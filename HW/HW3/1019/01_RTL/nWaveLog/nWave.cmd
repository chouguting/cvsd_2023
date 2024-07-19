wvResizeWindow -win $_nWave1 8 31 892 72
wvResizeWindow -win $_nWave1 0 23 1920 1009
wvResizeWindow -win $_nWave1 0 0 892 72
wvResizeWindow -win $_nWave1 0 23 1920 1009
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/write_mmu.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/tests"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/tests/i\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/tests/i\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/tests"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 7 8 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/current_state\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/current_state\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/tests"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 6 7 8 9 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 6 7 8 9 10 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 3 4 5 6 7 8 9 10 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 3 4 5 6 7 8 9 10 11 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 4815330.002010 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 11110940.728263 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 15694206.633790 -snap {("G1" 1)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter on
wvSetCursor -win $_nWave1 15810012.235312
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 15776018.471177
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/tests"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 12466877.168505 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 10691819.789275 -snap {("G2" 0)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 15792137.225686
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 20954887.906533 -snap {("G1" 0)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 20829999.282125
wvSetOptions -win $_nWave1 -cursorCenter off
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter on
wvSetCursor -win $_nWave1 20916257.788945
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 20909226.371176
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/output_valid_for_next_cycle} \
{/test_sram_write/u_core/output_valid_for_next_two_cycle} \
{/test_sram_write/u_core/output_valid_result} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 14 15 16 )} 
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/output_valid_for_next_cycle} \
{/test_sram_write/u_core/output_valid_for_next_two_cycle} \
{/test_sram_write/u_core/output_valid_result} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 14 15 16 )} 
wvSetPosition -win $_nWave1 {("G1" 16)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 16)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/tests"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/output_valid_for_next_two_cycle} \
{/test_sram_write/u_core/output_valid_for_next_cycle} \
{/test_sram_write/u_core/output_valid_result} \
{/test_sram_write/u_core/data_for_output\[13:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 17 18 )} 
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/output_valid_for_next_two_cycle} \
{/test_sram_write/u_core/output_valid_for_next_cycle} \
{/test_sram_write/u_core/output_valid_result} \
{/test_sram_write/u_core/data_for_output\[13:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 17 18 )} 
wvSetPosition -win $_nWave1 {("G1" 18)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 17 18 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 16 )} 
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSaveSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/signal.rc"
wvSaveSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/test_write_mmu.rc"
wvSetCursor -win $_nWave1 20915727.328987
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 10992569.106093
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSaveSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/test_write_mmu.rc"
wvSetCursor -win $_nWave1 10992882.729491
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 29)}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 \
           )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 24 )} 
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSetCursor -win $_nWave1 10993228.296002 -snap {("G1" 29)}
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 15794178.465951 -snap {("G1" 31)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 10672342.637461
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter off
wvSetOptions -win $_nWave1 -cursorCenter on
wvSetCursor -win $_nWave1 10672342.637461
wvSetCursor -win $_nWave1 10673071.521457
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 21 )} 
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 10992910.856035
wvSetOptions -win $_nWave1 -cursorCenter off
wvSetOptions -win $_nWave1 -cursorCenter on
wvSetOptions -win $_nWave1 -cursorCenter off
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 10993363.867607
wvSetCursor -win $_nWave1 10992388.150371
wvSetCursor -win $_nWave1 10992481.075822
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvUnknownSaveResult -win $_nWave1 -clear
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 33)}
wvSetPosition -win $_nWave1 {("G1" 33)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/sram_data\[0\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[1\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[2\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[3\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[4\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[5\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[6\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[7\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[8\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[9\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[10\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[11\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[12\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[13\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[14\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[15\]\[7:0\]} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/current_output_valid_result} \
{/test_sram_write/u_core/last_last_output_valid_result} \
{/test_sram_write/u_core/last_output_valid_result} \
{/test_sram_write/u_core/o_out_valid} \
{/test_sram_write/u_core/data_for_output\[13:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 30 31 32 33 )} 
wvSetPosition -win $_nWave1 {("G1" 33)}
wvSetPosition -win $_nWave1 {("G1" 33)}
wvSetPosition -win $_nWave1 {("G1" 33)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/sram_data\[0\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[1\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[2\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[3\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[4\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[5\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[6\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[7\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[8\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[9\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[10\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[11\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[12\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[13\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[14\]\[7:0\]} \
{/test_sram_write/u_core/sram_data\[15\]\[7:0\]} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/current_output_valid_result} \
{/test_sram_write/u_core/last_last_output_valid_result} \
{/test_sram_write/u_core/last_output_valid_result} \
{/test_sram_write/u_core/o_out_valid} \
{/test_sram_write/u_core/data_for_output\[13:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 30 31 32 33 )} 
wvSetPosition -win $_nWave1 {("G1" 33)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 31)}
wvSetPosition -win $_nWave1 {("G1" 34)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 35)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 35)}
wvSelectSignal -win $_nWave1 {( "G1" 33 )} 
wvSelectSignal -win $_nWave1 {( "G1" 34 )} 
wvSetPosition -win $_nWave1 {("G1" 34)}
wvSetPosition -win $_nWave1 {("G1" 33)}
wvSetPosition -win $_nWave1 {("G1" 32)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 32)}
wvSetPosition -win $_nWave1 {("G1" 33)}
wvSetCursor -win $_nWave1 10687743.674795 -snap {("G1" 34)}
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 23 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/tests"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/data_for_output\[13:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/current_output_valid_result} \
{/test_sram_write/u_core/last_output_valid_result} \
{/test_sram_write/u_core/last_counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/last_last_output_valid_result} \
{/test_sram_write/u_core/o_out_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/tests/i\[31:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/data_for_output\[13:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/current_output_valid_result} \
{/test_sram_write/u_core/last_output_valid_result} \
{/test_sram_write/u_core/last_counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/last_last_output_valid_result} \
{/test_sram_write/u_core/o_out_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
wvSetPosition -win $_nWave1 {("G1" 18)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetRadix -win $_nWave1 -format UDec
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 10995805.838627
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 10997483.621870
wvSetOptions -win $_nWave1 -cursorCenter on
wvSetOptions -win $_nWave1 -cursorCenter off
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 10996152.337337
wvZoom -win $_nWave1 10992359.088275 10992650.876664
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter on
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 10992586.360637
wvSetCursor -win $_nWave1 10992586.360637
wvSetCursor -win $_nWave1 10997573.365644
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetCursor -win $_nWave1 10992586.360637
wvSetCursor -win $_nWave1 10994892.180156
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 29)}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 \
           )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 28 )} 
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvSelectSignal -win $_nWave1 {( "G1" 32 )} 
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvSetCursor -win $_nWave1 10998109.602742
wvSetCursor -win $_nWave1 10997466.118225
wvSetCursor -win $_nWave1 10998806.710969
wvSetCursor -win $_nWave1 10990602.283376
wvSetCursor -win $_nWave1 10994570.437898
wvSetCursor -win $_nWave1 10997466.118225
wvSetCursor -win $_nWave1 10998055.979032
wvSetCursor -win $_nWave1 10998913.958388
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
