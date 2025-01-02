`timescale 1ns / 1ps

module alu_tb;

    // Parameter for ALU width
    parameter WIDTH = 32;

    // Testbench signals
    logic [WIDTH-1:0] op1, op2;
    logic [3:0] alu_ctrl;
    logic [WIDTH-1:0] alu_result;
    logic zero;
    logic lessSigend;
    logic lessUnsigend;

    // Instantiate the ALU module
    alu #(.WIDTH(WIDTH)) uut (
        .op1(op1),
        .op2(op2),
        .alu_ctrl(alu_ctrl),
        .alu_result(alu_result),
        .zero(zero),
        .lessSigend(lessSigend),
        .lessUnsigend(lessUnsigend)
    );

    // Testbench process
    initial begin
        // Test ADD operation (alu_ctrl = 4'b0000)
        op1 = 32'h0000_000A; // 10 in decimal
        op2 = 32'h0000_0005; // 5 in decimal
        alu_ctrl = 4'b0000; // ADD
        #10; // Wait for 10 time units
        $display("ADD: op1=%h, op2=%h, alu_result=%h, zero=%b", op1, op2, alu_result, zero);

        // Test SUB operation (alu_ctrl = 4'b0001)
        op1 = 32'h0000_000A; // 10 in decimal
        op2 = 32'h0000_000A; // 10 in decimal
        alu_ctrl = 4'b0001; // SUB
        #10;
        $display("SUB: op1=%h, op2=%h, alu_result=%h, zero=%b", op1, op2, alu_result, zero);

        // Test AND operation (alu_ctrl = 4'b0010)
        op1 = 32'h0F0F_0F0F;
        op2 = 32'h00FF_00FF;
        alu_ctrl = 4'b0111; // AND
        #10;
        $display("AND: op1=%h, op2=%h, alu_result=%h, zero=%b", op1, op2, alu_result, zero);

        // Test OR operation (alu_ctrl = 4'b0011)
        op1 = 32'h0F0F_0F0F;
        op2 = 32'h00FF_00FF;
        alu_ctrl = 4'b0110; // OR
        #10;
        $display("OR: op1=%h, op2=%h, alu_result=%h, zero=%b", op1, op2, alu_result, zero);

        // Test XOR operation (alu_ctrl = 4'b0100)
        op1 = 32'hFFFF_0000;
        op2 = 32'h0000_FFFF;
        alu_ctrl = 4'b0100; // XOR
        #10;
        $display("XOR: op1=%h, op2=%h, alu_result=%h, zero=%b", op1, op2, alu_result, zero);

        // Test SLL operation (alu_ctrl = 4'b0001)
        op1 = 32'h0000_0001;
        op2 = 32'h0000_0008;
        alu_ctrl = 4'b0001; // SLL
        #10;
        $display("SLL: op1=%h, op2=%h, alu_result=%h, zero=%b", op1, op2, alu_result, zero);

        // Test SRL operation (alu_ctrl = 4'b0101)
        op1 = 32'h8000_0000;
        op2 = 32'h0000_0008;
        alu_ctrl = 4'b0101; // SRL
        #10;
        $display("SRL: op1=%h, op2=%h, alu_result=%h, zero=%b", op1, op2, alu_result, zero);

        // Test SRA operation (alu_ctrl = 4'b1101)
        op1 = 32'h8000_0000; // Signed number
        op2 = 32'h0000_0008;
        alu_ctrl = 4'b1101; // SRA
        #10;
        $display("SRA: op1=%h, op2=%h, alu_result=%h, zero=%b", op1, op2, alu_result, zero);

        // Test SLT operation (alu_ctrl = 4'b0010)
        op1 = 32'hFFFF_FFFF; // -1 in signed
        op2 = 32'h0000_0000; // 0 in signed
        alu_ctrl = 4'b0010; // SLT
        #10;
        $display("SLT: op1=%h, op2=%h, alu_result=%h, zero=%b, lessSigend=%b", op1, op2, alu_result, zero, lessSigend);

        // Test SLTU operation (alu_ctrl = 4'b0011)
        op1 = 32'h0000_0001;
        op2 = 32'hFFFF_FFFF;
        alu_ctrl = 4'b0011; // SLTU
        #10;
        $display("SLTU: op1=%h, op2=%h, alu_result=%h, zero=%b, lessUnsigend=%b", op1, op2, alu_result, zero, lessUnsigend);

        // End simulation
        $stop;
    end

endmodule
