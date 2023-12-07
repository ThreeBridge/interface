TB_NAME			:= tb

FLIST_DIR		:= ./flist
TEST_DIR		:= ./tests
LOG_DIR			:= ./log
WAVE_DIR		:= ./wave

VLOG_OPT		 = -sv -work work
VLOG_OPT		+= -f $(FLIST_DIR)/rtl.lst -f $(FLIST_DIR)/tb.lst

RUN_OPT			 = -c $(TB_NAME)
RUN_OPT			+= -L work
RUN_OPT			+= -l $(LOG_DIR)/sim.log
RUN_OPT			+= -wlf $(WAVE_DIR)/sim.wlf
RUN_OPT			+= -do "add log -r {/tb/*}; run -all"

comp :
	vlog $(VLOG_OPT)

run :
	vsim $(RUN_OPT)

clean :
	rm -rf $(LOG_DIR)/* $(WAVE_DIR)/* work transcript
