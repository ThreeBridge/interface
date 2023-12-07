`timescale 1ps/1ps
`include "local_if.sv"
`include "mst_model.sv"
module tb();

    logic           CLK     ;   //
    logic           RSTn    ;   //
    logic   [ 7: 0] WDATA   ;   //
    logic           WEN     ;   //
    logic   [ 7: 0] RDATA   ;   //
    logic           REN     ;   //

    bit clk_in;
    bit rst_in;
    initial forever begin
        #10ns clk_in = ~clk_in;
    end

    initial begin
        #100ns;
        rst_in = 1'b1;
    end

    assign CLK  = clk_in;
    assign RSTn = rst_in;

    //--IF--//
    local_if u_if( .CLK(CLK) );

    //--model--//
    mst_model u_mst_model;

    //--DUT--//
    fifo u_fifo( .* );

    assign WDATA    = u_if.WDATA ;
    assign WEN      = u_if.WEN   ;
    assign REN      = u_if.REN   ;

    //--TEST--//
    initial begin
        u_mst_model = new(u_if);
        @(posedge RSTn);
        u_mst_model.fifo_wr(0, 8, 8'h00);
        u_mst_model.fifo_wr(1, 8, 8'h00);
        u_mst_model.fifo_wr(2, 8, 8'h00);
        #100ns;
        u_mst_model.fifo_rd(8);
        u_mst_model.fifo_rd(8);
        u_mst_model.fifo_rd(8);
        #100ns;
        $finish;
    end

endmodule
