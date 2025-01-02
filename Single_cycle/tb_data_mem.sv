`timescale 1ns / 1ps

module tb_data_mem;

    // Parameters
    parameter WIDTH = 32;
    parameter DEPTH = 1024;

    // Signals
    logic clk;
    logic reset_n;
    logic mem_write;
    logic [$clog2(DEPTH)-1:0] addr;
    logic [WIDTH-1:0] wdata;
    logic [WIDTH-1:0] rdata;

    // DUT instantiation
    data_mem #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH)
    ) dut (
        .clk(clk),
        .reset_n(reset_n),
        .mem_write(mem_write),
        .addr(addr),
        .wdata(wdata),
        .rdata(rdata)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test procedure
    initial begin
        // Initialize signals
        reset_n = 0;
        mem_write = 0;
        addr = 0;
        wdata = 0;

        // Apply reset
        #10;
        reset_n = 1;

        // Wait for reset to complete
        #10;

        // Test memory writes
        mem_write = 1;
        addr = 10;
        wdata = 32'hDEADBEEF;
        #10;

        addr = 20;
        wdata = 32'hCAFEBABE;
        #10;

        mem_write = 0;

        // Test memory reads
        addr = 10;
        #10;
        $display("Read Data at addr 10: %h", rdata);
        
        addr = 20;
        #10;
        $display("Read Data at addr 20: %h", rdata);

        // Check reset initialization
        addr = 0;
        #10;
        $display("Data at addr 0 after reset: %h", rdata);

        addr = 1;
        #10;
        $display("Data at addr 1 after reset: %h", rdata);

        // End simulation
        $stop;
    end

endmodule