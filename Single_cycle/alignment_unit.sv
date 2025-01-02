module alignment_unit (
    input logic [2:0] fun3,
    input logic [1:0] addr,
    input logic [31:0] raw_data,
    output logic [31:0] aligned_data
);
    logic [7:0] byte_data;
    logic [15:0] halfword_data;

    assign byte_data = (addr == 2'b00) ? raw_data[7:0] :
                       (addr == 2'b01) ? raw_data[15:8] :
                       (addr == 2'b10) ? raw_data[23:16] : raw_data[31:24];

    assign halfword_data = (addr[1] == 1'b0) ? raw_data[15:0] : raw_data[31:16];

    always_comb begin
        case (fun3)
            3'b000: aligned_data = {{24{byte_data[7]}}, byte_data};
            3'b001: aligned_data = {{24{1'b0}}, byte_data};
            3'b010: aligned_data = {{16{halfword_data[15]}}, halfword_data};
            3'b011: aligned_data = {{16{1'b0}}, halfword_data};
            3'b100: aligned_data = raw_data;
            default: aligned_data = 32'b0;
        endcase
    end
endmodule
