class mst_model;

    virtual interface local_if vif;

    function new(virtual interface local_if _if);
        vif = _if;
    endfunction

    // mode 0 : fix, 1 : inc, 2 : random
    task fifo_wr(input int mode=0, num=1, input bit [7:0] wdata);
        for( int ii = 0; ii < num; ii++ )begin
            @(posedge vif.CLK);
            if( mode == 0 )begin
                vif.cb.WDATA    <= wdata;
            end else if( mode == 1 )begin
                vif.cb.WDATA    <= wdata + ii;
            end else if( mode == 2 )begin
                vif.cb.WDATA    <= $urandom_range(0, 2**8-1);
            end
            vif.cb.WEN      <= 1'b1;
            @(posedge vif.CLK);
            vif.cb.WDATA    <= 8'h00;
            vif.cb.WEN      <= 1'b0;
        end
    endtask

    task fifo_rd(input int num=1);
        for( int ii = 0; ii < num; ii++ )begin
            @(posedge vif.CLK);
            vif.cb.REN      <= 1'b1;
            @(posedge vif.CLK);
            vif.cb.REN      <= 1'b0;
        end
    endtask

endclass