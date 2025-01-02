`timescale 1ns / 1ps
module data_path_tb;

                
        parameter n = 32, depth = 1024;        
        
        logic clk;
        logic reset_n;
        logic branch;
        logic ALUsrc;
        logic memToReg;
        logic mem_write;
        logic reg_write;
        logic [4:0] alu_ctrl;
        logic [n-1:0] inst ;
        logic [1:0] ALUOp;
        data_path#(n, depth)
                riscVcpu(
                    .*
                );
        
        
        initial begin
            clk = 0;
            reset_n = 0;
            #1 reset_n = 1;
        end
        
        always #5 clk = ~clk;
        
        initial begin
            // Load 10 into to (addi to, x0, 10)
            reg_write = 1'b1;
            // Need to write to register file (to the to register)
            ALUsrc = 1'b1;
            // Need to select the second operand from Imm value
            mem_write = 1'b0;
            // This is not a store instruction
            alu_ctrl = 4'b0000;
            // ALU should perform Addition (addi to, x0, 10)
            memToReg = 1'b0;
            // It's not a lw instruction where data from Mem will go to reg
            branch= 1'b0;
            // It's not a branch instruction
            #10;
            // Load 5 into tl (addi tl, x0, 5)
            // Note that control signal for this and above insturction will be save, only the rd and
            //immediate value will change
            // These value's are not contorl by control so they are not input of data path
            // These value's will come from instruction directly
            reg_write = 1'b1;
            // Need to write to register file (to the to register)
            ALUsrc = 1'b1;
            // Need to select the second operand from Imm value
            mem_write = 1'b0;
            // This is not a store instruction
            alu_ctrl = 4'b0000;
            // ALU should perform Addition (addi to, x0, 10)
            memToReg = 1'b0;
            // It's not a lw instruction where data from Mem will go to reg
            branch = 1'b0;
            // It's not a branch instruction
            #10;
            // Add t2 = to + tl (add t2, tl, to)
            reg_write = 1'b1;
            // Need to write to register file (to the to register)
            ALUsrc = 1'b0;
            // Second operand is not Imm value
            mem_write = 1'b0;
            // This is not a store instruction
            alu_ctrl = 4'b0000
            ; // ALU should perform Addition (addi to, x0, 10)
            memToReg = 1'b0;
            // It's not a lw instruction where data from Mem will go to reg
            branch = 1'b0;
            // It's not a branch instruction
            #10;
            end 
endmodule
