module alu_control (
    input  logic [1:0] alu_op,      
    input  logic func7,   
    input  logic [2:0] func3,     
    output logic [3:0] alu_ctrl   
);

always @(*) begin
    case (alu_op)
        2'b00: begin // Load/Store
            alu_ctrl = 4'b0000; // Add
        end
        2'b01: begin // Branch
            alu_ctrl = 4'b1000; // Subtract
        end
        2'b10: begin // R-type
            case ({func7, func3})
                4'b0000: alu_ctrl = 4'b0000; // Add
                4'b1000: alu_ctrl = 4'b1000; // Subtract
                4'b0111: alu_ctrl = 4'b0111; // AND
                4'b0110: alu_ctrl = 4'b0110; // OR
                4'b0001: alu_ctrl = 4'b0001; // SLL
                4'b0010: alu_ctrl = 4'b0010; // SLT
                default: alu_ctrl = 4'bxxxx; // Invalid
            endcase
        end
        2'b11: begin // I-type instructions
            case (func3)
                3'b000: alu_ctrl = 4'b0000;                   // ADDI
                3'b010: alu_ctrl = 4'b0010;                   // SLTI
                3'b011: alu_ctrl = 4'b0011;                   // SLTIU
                3'b100: alu_ctrl = 4'b0100;                   // XORI
                3'b110: alu_ctrl = 4'b0110;                   // ORI
                3'b111: alu_ctrl = 4'b0111;                   // ANDI
                3'b001: alu_ctrl = 4'b0001;                   // SLLI
                3'b101: alu_ctrl = func7 ? 4'b1101 : 4'b0101; // SRAI (1101) or SRLI (0101)
                default: alu_ctrl = 4'bxxxx;                  // Invalid instruction
            endcase
        end
        default: alu_ctrl = 4'bxxxx; // Invalid alu_op
    endcase
end

endmodule