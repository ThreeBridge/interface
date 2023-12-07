module fifo (
    input   logic           CLK     ,   //
    input   logic           RSTn    ,   //
    input   logic   [ 7: 0] WDATA   ,   //
    input   logic           WEN     ,   //
    output  logic   [ 7: 0] RDATA   ,   //
    input   logic           REN         //
);

    logic   [ 7: 0] w_waddr         ;
    logic   [ 7: 0] r_waddr         ;
    logic   [ 7: 0] w_raddr         ;
    logic   [ 7: 0] r_raddr         ;
    logic   [ 7: 0] mem [ 255: 0]   ;

    assign w_waddr = ( WEN ) ? r_waddr + 8'h01 : r_waddr;
    always_ff @(posedge CLK)begin
        if( !RSTn )begin
            r_waddr <= 8'h00;
        end else begin
            r_waddr <= w_waddr;
        end
    end

    assign w_raddr = ( REN ) ? r_raddr + 8'h01 : r_raddr;
    always_ff @(posedge CLK)begin
        if( !RSTn )begin
            r_raddr <= 8'h00;
        end else begin
            r_raddr <= w_raddr;
        end
    end

    always_ff @(posedge CLK)begin
        if( WEN )begin
            mem[r_waddr] <= WDATA;
        end
    end

    always_ff @(posedge CLK)begin
        RDATA <= mem[r_raddr[7:0]+( REN ? 1'b1 : 1'b0 )];
    end

endmodule