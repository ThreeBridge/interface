interface local_if(
    input   logic   CLK         //
);

    bit     [ 7: 0] WDATA   ;   //
    bit             WEN     ;   //
    bit     [ 7: 0] RDATA   ;   //
    bit             REN     ;   //

    clocking cb @(posedge CLK);
        default output #1ps;
        output  WDATA, WEN, REN;
        input   RDATA;
    endclocking

endinterface