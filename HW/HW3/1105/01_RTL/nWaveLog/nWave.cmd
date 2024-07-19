verdiSetActWin -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/core.fsdb}
wvRestoreSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/finalTest.rc" \
           -overWriteAutoAlias on -appendSignals on
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 10673742.619314
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/next_state\[4:0\]} \
{/testbed/u_core/i_clk} \
{/testbed/u_core/i_rst_n} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/o_op_ready} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/i_in_data_delayed\[7:0\]} \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/o_in_ready} \
{/testbed/u_core/next_state\[4:0\]} \
{/testbed/u_core/o_out_data\[13:0\]} \
{/testbed/u_core/o_out_valid} \
{/testbed/u_core/mmu_write_x\[3:0\]} \
{/testbed/u_core/mmu_write_y\[3:0\]} \
{/testbed/u_core/mmu_write_channel\[4:0\]} \
{/testbed/u_core/mmu_write_enable} \
{/testbed/u_core/mmu_write_data\[7:0\]} \
{/testbed/u_core/sram_data\[0:15\]} \
{/testbed/u_core/sram_data\[0\]\[7:0\]} \
{/testbed/u_core/sram_data\[1\]\[7:0\]} \
{/testbed/u_core/sram_data\[2\]\[7:0\]} \
{/testbed/u_core/sram_data\[3\]\[7:0\]} \
{/testbed/u_core/sram_data\[4\]\[7:0\]} \
{/testbed/u_core/sram_data\[5\]\[7:0\]} \
{/testbed/u_core/sram_data\[6\]\[7:0\]} \
{/testbed/u_core/sram_data\[7\]\[7:0\]} \
{/testbed/u_core/sram_data\[8\]\[7:0\]} \
{/testbed/u_core/sram_data\[9\]\[7:0\]} \
{/testbed/u_core/sram_data\[10\]\[7:0\]} \
{/testbed/u_core/sram_data\[11\]\[7:0\]} \
{/testbed/u_core/sram_data\[12\]\[7:0\]} \
{/testbed/u_core/sram_data\[13\]\[7:0\]} \
{/testbed/u_core/sram_data\[14\]\[7:0\]} \
{/testbed/u_core/sram_data\[15\]\[7:0\]} \
{/testbed/u_core/data_for_output\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/indata_mem_index\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/next_state\[4:0\]} \
{/testbed/u_core/i_clk} \
{/testbed/u_core/i_rst_n} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/o_op_ready} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/i_in_data_delayed\[7:0\]} \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/o_in_ready} \
{/testbed/u_core/next_state\[4:0\]} \
{/testbed/u_core/o_out_data\[13:0\]} \
{/testbed/u_core/o_out_valid} \
{/testbed/u_core/mmu_write_x\[3:0\]} \
{/testbed/u_core/mmu_write_y\[3:0\]} \
{/testbed/u_core/mmu_write_channel\[4:0\]} \
{/testbed/u_core/mmu_write_enable} \
{/testbed/u_core/mmu_write_data\[7:0\]} \
{/testbed/u_core/sram_data\[0:15\]} \
{/testbed/u_core/sram_data\[0\]\[7:0\]} \
{/testbed/u_core/sram_data\[1\]\[7:0\]} \
{/testbed/u_core/sram_data\[2\]\[7:0\]} \
{/testbed/u_core/sram_data\[3\]\[7:0\]} \
{/testbed/u_core/sram_data\[4\]\[7:0\]} \
{/testbed/u_core/sram_data\[5\]\[7:0\]} \
{/testbed/u_core/sram_data\[6\]\[7:0\]} \
{/testbed/u_core/sram_data\[7\]\[7:0\]} \
{/testbed/u_core/sram_data\[8\]\[7:0\]} \
{/testbed/u_core/sram_data\[9\]\[7:0\]} \
{/testbed/u_core/sram_data\[10\]\[7:0\]} \
{/testbed/u_core/sram_data\[11\]\[7:0\]} \
{/testbed/u_core/sram_data\[12\]\[7:0\]} \
{/testbed/u_core/sram_data\[13\]\[7:0\]} \
{/testbed/u_core/sram_data\[14\]\[7:0\]} \
{/testbed/u_core/sram_data\[15\]\[7:0\]} \
{/testbed/u_core/data_for_output\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/indata_mem_index\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetCursor -win $_nWave1 10672335.626197
wvSetCursor -win $_nWave1 10674048.487378
wvSetCursor -win $_nWave1 10674048.487378
wvSetCursor -win $_nWave1 10676250.737468
wvSetCursor -win $_nWave1 10677107.168058
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetCursor -win $_nWave1 10675149.612423
wvSetCursor -win $_nWave1 10677474.209740
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/mmu0"
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/check"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/tests"
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/next_state\[4:0\]} \
{/testbed/u_core/i_clk} \
{/testbed/u_core/i_rst_n} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/o_op_ready} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/i_in_data_delayed\[7:0\]} \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/o_in_ready} \
{/testbed/u_core/next_state\[4:0\]} \
{/testbed/u_core/o_out_data\[13:0\]} \
{/testbed/u_core/o_out_valid} \
{/testbed/u_core/mmu_write_x\[3:0\]} \
{/testbed/u_core/mmu_write_y\[3:0\]} \
{/testbed/u_core/mmu_write_channel\[4:0\]} \
{/testbed/u_core/mmu_write_enable} \
{/testbed/u_core/mmu_write_data\[7:0\]} \
{/testbed/u_core/sram_data\[0:15\]} \
{/testbed/u_core/sram_data\[0\]\[7:0\]} \
{/testbed/u_core/sram_data\[1\]\[7:0\]} \
{/testbed/u_core/sram_data\[2\]\[7:0\]} \
{/testbed/u_core/sram_data\[3\]\[7:0\]} \
{/testbed/u_core/sram_data\[4\]\[7:0\]} \
{/testbed/u_core/sram_data\[5\]\[7:0\]} \
{/testbed/u_core/sram_data\[6\]\[7:0\]} \
{/testbed/u_core/sram_data\[7\]\[7:0\]} \
{/testbed/u_core/sram_data\[8\]\[7:0\]} \
{/testbed/u_core/sram_data\[9\]\[7:0\]} \
{/testbed/u_core/sram_data\[10\]\[7:0\]} \
{/testbed/u_core/sram_data\[11\]\[7:0\]} \
{/testbed/u_core/sram_data\[12\]\[7:0\]} \
{/testbed/u_core/sram_data\[13\]\[7:0\]} \
{/testbed/u_core/sram_data\[14\]\[7:0\]} \
{/testbed/u_core/sram_data\[15\]\[7:0\]} \
{/testbed/u_core/data_for_output\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/indata_mem_index\[31:0\]} \
{/testbed/tests/j\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/next_state\[4:0\]} \
{/testbed/u_core/i_clk} \
{/testbed/u_core/i_rst_n} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/o_op_ready} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/i_in_data_delayed\[7:0\]} \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/o_in_ready} \
{/testbed/u_core/next_state\[4:0\]} \
{/testbed/u_core/o_out_data\[13:0\]} \
{/testbed/u_core/o_out_valid} \
{/testbed/u_core/mmu_write_x\[3:0\]} \
{/testbed/u_core/mmu_write_y\[3:0\]} \
{/testbed/u_core/mmu_write_channel\[4:0\]} \
{/testbed/u_core/mmu_write_enable} \
{/testbed/u_core/mmu_write_data\[7:0\]} \
{/testbed/u_core/sram_data\[0:15\]} \
{/testbed/u_core/sram_data\[0\]\[7:0\]} \
{/testbed/u_core/sram_data\[1\]\[7:0\]} \
{/testbed/u_core/sram_data\[2\]\[7:0\]} \
{/testbed/u_core/sram_data\[3\]\[7:0\]} \
{/testbed/u_core/sram_data\[4\]\[7:0\]} \
{/testbed/u_core/sram_data\[5\]\[7:0\]} \
{/testbed/u_core/sram_data\[6\]\[7:0\]} \
{/testbed/u_core/sram_data\[7\]\[7:0\]} \
{/testbed/u_core/sram_data\[8\]\[7:0\]} \
{/testbed/u_core/sram_data\[9\]\[7:0\]} \
{/testbed/u_core/sram_data\[10\]\[7:0\]} \
{/testbed/u_core/sram_data\[11\]\[7:0\]} \
{/testbed/u_core/sram_data\[12\]\[7:0\]} \
{/testbed/u_core/sram_data\[13\]\[7:0\]} \
{/testbed/u_core/sram_data\[14\]\[7:0\]} \
{/testbed/u_core/sram_data\[15\]\[7:0\]} \
{/testbed/u_core/data_for_output\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/indata_mem_index\[31:0\]} \
{/testbed/tests/j\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 10673559.098469
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 10676495.431922
wvSetCursor -win $_nWave1 10673681.445697
wvSetCursor -win $_nWave1 10676006.043014
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 16 )} 
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
wvSelectSignal -win $_nWave1 {( "G1" 36 )} 
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 16 )} 
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvSetCursor -win $_nWave1 10673069.709561
wvSetCursor -win $_nWave1 10680043.501511
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 10670989.806698
wvSetCursor -win $_nWave1 10672580.320652
wvSetCursor -win $_nWave1 10673069.709561
wvSetCursor -win $_nWave1 10676373.084695
wvSetCursor -win $_nWave1 10675639.001332
wvSetCursor -win $_nWave1 10674782.570741
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/next_state\[4:0\]} \
{/testbed/u_core/i_clk} \
{/testbed/u_core/i_rst_n} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/o_op_ready} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/i_in_data_delayed\[7:0\]} \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/o_in_ready} \
{/testbed/u_core/next_state\[4:0\]} \
{/testbed/u_core/o_out_data\[13:0\]} \
{/testbed/u_core/o_out_valid} \
{/testbed/u_core/mmu_write_x\[3:0\]} \
{/testbed/u_core/mmu_write_y\[3:0\]} \
{/testbed/u_core/mmu_write_channel\[4:0\]} \
{/testbed/u_core/mmu_write_enable} \
{/testbed/u_core/mmu_write_data\[7:0\]} \
{/testbed/u_core/sram_data\[0:15\]} \
{/testbed/u_core/sram_data\[0\]\[7:0\]} \
{/testbed/u_core/sram_data\[1\]\[7:0\]} \
{/testbed/u_core/sram_data\[2\]\[7:0\]} \
{/testbed/u_core/sram_data\[3\]\[7:0\]} \
{/testbed/u_core/sram_data\[4\]\[7:0\]} \
{/testbed/u_core/sram_data\[5\]\[7:0\]} \
{/testbed/u_core/sram_data\[6\]\[7:0\]} \
{/testbed/u_core/sram_data\[7\]\[7:0\]} \
{/testbed/u_core/sram_data\[8\]\[7:0\]} \
{/testbed/u_core/sram_data\[9\]\[7:0\]} \
{/testbed/u_core/sram_data\[10\]\[7:0\]} \
{/testbed/u_core/sram_data\[11\]\[7:0\]} \
{/testbed/u_core/sram_data\[12\]\[7:0\]} \
{/testbed/u_core/sram_data\[13\]\[7:0\]} \
{/testbed/u_core/sram_data\[14\]\[7:0\]} \
{/testbed/u_core/sram_data\[15\]\[7:0\]} \
{/testbed/u_core/data_for_output\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/in_data\[7:0\]} \
{/testbed/in_data\[7:0\]} \
{/testbed/indata_mem_index\[31:0\]} \
{/testbed/tests/j\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetRadix -win $_nWave1 -format UDec
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 12077724.343129
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter on
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 10670764.480080
wvSetOptions -win $_nWave1 -cursorCenter off
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter on
wvSetCursor -win $_nWave1 10674373.723283
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 430626.479005
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetCursor -win $_nWave1 10625611.988514
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 10674061.490487
wvSetOptions -win $_nWave1 -cursorCenter off
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter on
wvSetOptions -win $_nWave1 -cursorCenter off
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 429683.461953
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 434944.392723
wvSetCursor -win $_nWave1 435678.476086
wvSetCursor -win $_nWave1 436657.253903
wvSetOptions -win $_nWave1 -cursorCenter on
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 437574.858107
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvUnknownSaveResult -win $_nWave1 -clear
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/next_state\[4:0\]} \
{/testbed/u_core/i_clk} \
{/testbed/u_core/i_rst_n} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/o_op_ready} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/i_in_data_delayed\[7:0\]} \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/o_in_ready} \
{/testbed/u_core/next_state\[4:0\]} \
{/testbed/u_core/o_out_data\[13:0\]} \
{/testbed/u_core/o_out_valid} \
{/testbed/u_core/mmu_write_x\[3:0\]} \
{/testbed/u_core/mmu_write_y\[3:0\]} \
{/testbed/u_core/mmu_write_channel\[4:0\]} \
{/testbed/u_core/mmu_write_enable} \
{/testbed/u_core/mmu_write_data\[7:0\]} \
{/testbed/u_core/sram_data\[0:15\]} \
{/testbed/u_core/sram_data\[0\]\[7:0\]} \
{/testbed/u_core/sram_data\[1\]\[7:0\]} \
{/testbed/u_core/sram_data\[2\]\[7:0\]} \
{/testbed/u_core/sram_data\[3\]\[7:0\]} \
{/testbed/u_core/sram_data\[4\]\[7:0\]} \
{/testbed/u_core/sram_data\[5\]\[7:0\]} \
{/testbed/u_core/sram_data\[6\]\[7:0\]} \
{/testbed/u_core/sram_data\[7\]\[7:0\]} \
{/testbed/u_core/sram_data\[8\]\[7:0\]} \
{/testbed/u_core/sram_data\[9\]\[7:0\]} \
{/testbed/u_core/sram_data\[10\]\[7:0\]} \
{/testbed/u_core/sram_data\[11\]\[7:0\]} \
{/testbed/u_core/sram_data\[12\]\[7:0\]} \
{/testbed/u_core/sram_data\[13\]\[7:0\]} \
{/testbed/u_core/sram_data\[14\]\[7:0\]} \
{/testbed/u_core/sram_data\[15\]\[7:0\]} \
{/testbed/u_core/data_for_output\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/in_data\[7:0\]} \
{/testbed/data_idx\[31:0\]} \
{/testbed/in_ready} \
{/testbed/in_valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/next_state\[4:0\]} \
{/testbed/u_core/i_clk} \
{/testbed/u_core/i_rst_n} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/o_op_ready} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/i_in_data_delayed\[7:0\]} \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/o_in_ready} \
{/testbed/u_core/next_state\[4:0\]} \
{/testbed/u_core/o_out_data\[13:0\]} \
{/testbed/u_core/o_out_valid} \
{/testbed/u_core/mmu_write_x\[3:0\]} \
{/testbed/u_core/mmu_write_y\[3:0\]} \
{/testbed/u_core/mmu_write_channel\[4:0\]} \
{/testbed/u_core/mmu_write_enable} \
{/testbed/u_core/mmu_write_data\[7:0\]} \
{/testbed/u_core/sram_data\[0:15\]} \
{/testbed/u_core/sram_data\[0\]\[7:0\]} \
{/testbed/u_core/sram_data\[1\]\[7:0\]} \
{/testbed/u_core/sram_data\[2\]\[7:0\]} \
{/testbed/u_core/sram_data\[3\]\[7:0\]} \
{/testbed/u_core/sram_data\[4\]\[7:0\]} \
{/testbed/u_core/sram_data\[5\]\[7:0\]} \
{/testbed/u_core/sram_data\[6\]\[7:0\]} \
{/testbed/u_core/sram_data\[7\]\[7:0\]} \
{/testbed/u_core/sram_data\[8\]\[7:0\]} \
{/testbed/u_core/sram_data\[9\]\[7:0\]} \
{/testbed/u_core/sram_data\[10\]\[7:0\]} \
{/testbed/u_core/sram_data\[11\]\[7:0\]} \
{/testbed/u_core/sram_data\[12\]\[7:0\]} \
{/testbed/u_core/sram_data\[13\]\[7:0\]} \
{/testbed/u_core/sram_data\[14\]\[7:0\]} \
{/testbed/u_core/sram_data\[15\]\[7:0\]} \
{/testbed/u_core/data_for_output\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/in_data\[7:0\]} \
{/testbed/data_idx\[31:0\]} \
{/testbed/in_ready} \
{/testbed/in_valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter off
wvSetOptions -win $_nWave1 -cursorCenter on
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 )} 
wvSetCursor -win $_nWave1 434846.514941 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 440046.272097
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 434479.473259
wvSetCursor -win $_nWave1 435091.209395
wvSetCursor -win $_nWave1 439495.709574
wvSetCursor -win $_nWave1 437782.848394
wvSetCursor -win $_nWave1 437782.848394
wvSetCursor -win $_nWave1 442799.084709
wvSetCursor -win $_nWave1 440107.445711
wvSetCursor -win $_nWave1 435213.556622
wvSetCursor -win $_nWave1 440841.529074
wvSetCursor -win $_nWave1 439862.751256
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 10 11 )} 
wvSetCursor -win $_nWave1 449962.514862
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 10678426.072365
wvSetCursor -win $_nWave1 10674755.655549
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 10678793.114038
wvSetCursor -win $_nWave1 10675122.697222
wvSetCursor -win $_nWave1 10680505.975219
wvSetCursor -win $_nWave1 10671207.585951
wvSetCursor -win $_nWave1 10673899.224950
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvScrollDown -win $_nWave1 0
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomIn -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 10673899.224950
wvSetCursor -win $_nWave1 10669678.245611
wvSetCursor -win $_nWave1 10670534.676202
wvSetCursor -win $_nWave1 10671880.495701
wvSetCursor -win $_nWave1 10672125.190155
wvSetCursor -win $_nWave1 10673103.967973
wvSetCursor -win $_nWave1 10672859.273519
wvSetCursor -win $_nWave1 10672492.231837
wvSetCursor -win $_nWave1 10675183.870836
wvSetCursor -win $_nWave1 10677508.468153
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvExit
