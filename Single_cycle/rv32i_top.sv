module rv32i_top #(parameter n = 32, depth = 1024)
                (
                input logic clk,
                input logic reset_n      
                );
    
                 logic zero;
                 logic lessUnsigend;
                 logic lessSigend;     
                 logic pc_sel;    
                 logic ALUsrc;
                 logic memToReg;
                 logic mem_write;
                 logic reg_write;
                 logic [3:0] alu_ctrl;
                 logic [n-1:0] inst;
      
    data_path#(n , depth)
                dp(
                    .clk(clk),
                    .reset_n(reset_n),
                    .ALUsrc(ALUsrc),
                    .memToReg(memToReg),
                    .mem_write(mem_write),
                    .reg_write(reg_write),
                    .alu_ctrl(alu_ctrl),
                    .inst(inst),
                    .pc_sel(pc_sel),
                    .zero(zero),
                    .lessUnsigend(lessUnsigend),
                    .lessSigend(lessSigend)
                );
    
    control_unit #( n )cu(
                .inst(inst),
                .reg_write(reg_write),
                .mem_write(mem_write),
                .mem_to_reg(memToReg),
                .alu_src(ALUsrc),                
                .alu_ctrl(alu_ctrl),
                .zero(zero),
                .lessUnsigend(lessUnsigend),
                .lessSigend(lessSigend),
                .pc_sel(pc_sel)
    );


endmodule
