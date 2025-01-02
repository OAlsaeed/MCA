module data_path#(parameter n = 32, depth = 1024)
                (                    
                    input logic clk,
                    input logic reset_n,
                    input logic ALUsrc,
                    input logic memToReg,
                    input logic mem_write,
                    input logic reg_write,
                    input logic [3:0] alu_ctrl,
                    output logic [n-1:0] inst,
                    output logic zero,
                    output logic lessUnsigend,
                    output logic lessSigend,
                    input logic pc_sel 
                );

    
    logic [n-1:0] data_o;
    logic [$clog2(depth)-1:0] addr;
    logic [n-1:0] rdata;
    logic [n-1:0] imm;
    logic [$clog2(n)-1:0] raddr1; 
    logic [$clog2(n)-1:0] raddr2; 
    logic [$clog2(n)-1:0] waddr;
    logic [n-1:0] rdata1;
    logic [n-1:0] rdata2;
    logic [n-1:0] alu_result;
    logic [n-1:0] mux_output1;
    logic [n-1:0] mux_output2;
    logic [n-1:0] mux_output3;   
    logic [n-1:0] mux_output4; 
    logic [n-1:0] mux_output5; 
    logic [n-1:0] mux_output6;           
    logic PC_jump_sel;            
    logic PC_jalr_sel;
    logic aupic_sel;
    
    assign aupic_sel =    (~inst[6] &  ~inst[5] & 
                            inst[4] & ~inst[3] & 
                            inst[2] & inst[1] & inst[0]);
    
    assign PC_jalr_sel =    (inst[6] &  inst[5] & 
                            ~inst[4] & ~inst[3] & 
                            inst[2] & inst[1] & inst[0]);
                            
    assign PC_jump_sel =  (inst[6] &  inst[5] & 
                            ~inst[4] & inst[3] & 
                            inst[2] & inst[1] & inst[0]) ;
            
    // for selecting aupic value
    assign mux_output6 =  (aupic_sel) ? 
    (data_o + imm) : mux_output5;
          
    // for write data                     
    assign mux_output5 = (PC_jalr_sel) ? 
    data_o + 4 : mux_output2;
    
    // for next count
    assign mux_output4 = (PC_jalr_sel) ? 
    imm + rdata1 : mux_output3;
    
    assign raddr1 = inst[19:15];
    assign raddr2 = inst[24:20];
    assign waddr = inst[11:7];
    
    //     select the second operand
    assign mux_output1 = (ALUsrc)? imm: rdata2;
    //      select between data memory output or alu result
    assign mux_output2 = (memToReg)? rdata: alu_result;
    //      select weather jump or branch or just go to the next inst
    assign mux_output3 = (pc_sel | PC_jump_sel)? data_o + imm: data_o + 4;

    
    inst_mem # (n) rom(
                 .address(data_o),
                 .instruction(inst)
                );
                
    data_mem #(n) d(
    .clk(clk),
    .reset_n(reset_n),
    .mem_write(mem_write),
    .addr(alu_result),
    .fun3(inst [14:12]),
    .wdata(rdata2),
    .rdata(rdata)
    );

    imm_gen #(n) i(
     .inst(inst),
     .imm(imm)
    );

    reg_file #(n) f(
    .clk(clk),
    .reset_n(reset_n),
    .reg_write(reg_write),
    .raddr1(raddr1),
    .raddr2(raddr2),
    .waddr(waddr),
    .wdata(mux_output6),
    .rdata1(rdata1),
    .rdata2(rdata2)
    );

    alu #(n) u(
    .op1(rdata1),
    .op2(mux_output1),
    .alu_ctrl(alu_ctrl),
    .alu_result(alu_result),
    .zero(zero),
    .lessSigend(lessSigend),
    .lessUnsigend(lessUnsigend)
    );

    program_counter #(n) p(
    .clk(clk),
    .reset_n(reset_n),
    .data_in(mux_output4),
    .data_o(data_o)
    );
    

endmodule