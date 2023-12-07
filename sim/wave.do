onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group TB /tb/CLK
add wave -noupdate -group TB /tb/RSTn
add wave -noupdate -group TB /tb/WDATA
add wave -noupdate -group TB /tb/WEN
add wave -noupdate -group TB /tb/RDATA
add wave -noupdate -group TB /tb/REN
add wave -noupdate -group TB /tb/clk_in
add wave -noupdate -group TB /tb/rst_in
add wave -noupdate -group DUT /tb/u_fifo/CLK
add wave -noupdate -group DUT /tb/u_fifo/RSTn
add wave -noupdate -group DUT /tb/u_fifo/WDATA
add wave -noupdate -group DUT /tb/u_fifo/WEN
add wave -noupdate -group DUT /tb/u_fifo/RDATA
add wave -noupdate -group DUT /tb/u_fifo/REN
add wave -noupdate -group DUT /tb/u_fifo/r_waddr
add wave -noupdate -group DUT /tb/u_fifo/r_raddr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1510001 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ps} {2299500 ps}
