module data_mem #(parameter WIDTH = 32, DEPTH = 1024) (
    input logic clk, reset_n, mem_write,
    input logic [2:0] fun3,
    input logic [WIDTH-1:0] addr, wdata,
    output logic [WIDTH-1:0] rdata
);
    logic [WIDTH-1:0] dmem [0:DEPTH-1];
    logic [3:0] wsel;
    logic [WIDTH-1:0] raw_data;

    always_comb begin
        case (fun3)
            3'b000: wsel = (addr[1:0] == 2'b00) ? 4'b0001 :
                          (addr[1:0] == 2'b01) ? 4'b0010 :
                          (addr[1:0] == 2'b10) ? 4'b0100 : 4'b1000;
            3'b001: wsel = (addr[1] == 1'b0) ? 4'b0011 : 4'b1100;
            3'b010: wsel = 4'b1111;
            default: wsel = 4'b0000;
        endcase
    end

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            integer i;
            for (i = 0; i < DEPTH; i++) dmem[i] <= 32'b0;
        end else if (mem_write) begin
            dmem[addr[31:2]] <= {
                (wsel[3] ? wdata[31:24] : dmem[addr[31:2]][31:24]),
                (wsel[2] ? wdata[23:16] : dmem[addr[31:2]][23:16]),
                (wsel[1] ? wdata[15:8]  : dmem[addr[31:2]][15:8]),
                (wsel[0] ? wdata[7:0]   : dmem[addr[31:2]][7:0])
            };
        end
    end

    assign raw_data = dmem[addr[31:2]];

    alignment_unit align_unit (
        .fun3(fun3),
        .addr(addr[1:0]),
        .raw_data(raw_data),
        .aligned_data(rdata)
    );
endmodule



















