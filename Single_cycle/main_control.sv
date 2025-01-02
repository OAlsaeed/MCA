module main_control(
    input logic [6:0] opcode,
    output logic reg_write,
    output logic mem_write,
    output logic mem_to_reg,
    output logic [1:0] alu_op,
    output logic alu_src,
    output logic branch
);

    always @(*) begin
        case (opcode)
            7'b0110011: begin // R-Type
                reg_write = 1'b1; 
                mem_write = 1'b0; 
                mem_to_reg = 1'b0;
                alu_op = 2'b10;
                alu_src = 1'b0;
                branch = 1'b0;
            end 
            7'b0010011: begin // I-Type
                reg_write = 1'b1; 
                mem_write = 1'b0; 
                mem_to_reg = 1'b0;
                alu_op = 2'b11;
                alu_src = 1'b1;
                branch = 1'b0;
            end 
            7'b0000011: begin // Load
                reg_write = 1'b1; 
                mem_write = 1'b0; 
                mem_to_reg = 1'b1;
                alu_op = 2'b00;
                alu_src = 1'b1;
                branch = 1'b0;
            end 
            7'b0100011: begin // Store
                reg_write = 1'b0; 
                mem_write = 1'b1; 
                mem_to_reg = 1'b0;
                alu_op = 2'b00;
                alu_src = 1'b1;
                branch = 1'b0;
            end 
            7'b1100011: begin // Branch (beq)
                reg_write = 1'b0; 
                mem_write = 1'b0; 
                mem_to_reg = 1'b0;
                alu_op = 2'b01;
                alu_src = 1'b0;
                branch = 1'b1;
            end 
            7'b1101111: begin // J-type (jal)
                reg_write = 1'b1; 
                mem_write = 1'b0; 
                mem_to_reg = 1'b0;
                alu_op = 2'b00;
                alu_src = 1'b1;
                branch = 1'b1;
            end 
            7'b1100111: begin // J-type (jalr)
                reg_write = 1'b1; 
                mem_write = 1'b0; 
                mem_to_reg = 1'b0;
                alu_op = 2'b00;
                alu_src = 1'b1;
                branch = 1'b0;
            end
            7'b0010111: begin // U-Type (auipc)
                reg_write = 1'b1; 
                mem_write = 1'b0; 
                mem_to_reg = 1'b0;
                alu_op = 2'b00;
                alu_src = 1'b1;
                branch = 1'b0;
            end
            7'b0110111: begin // U-Type (lui)
                reg_write = 1'b1; 
                mem_write = 1'b0; 
                mem_to_reg = 1'b0;
                alu_op = 2'b00;
                alu_src = 1'b1;
                branch = 1'b0;
            end 
            default: begin      
                reg_write = 1'b0; 
                mem_write = 1'b0; 
                mem_to_reg = 1'b0;
                alu_op = 2'b00;
                alu_src = 1'b0;
                branch = 1'b0;
            end            
        endcase
    end

endmodule
