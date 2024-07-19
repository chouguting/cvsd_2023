verdiSetActWin -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/core.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/convEngin0/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvCloseFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvTpfCloseForm -win $_nWave1
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/core.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectGroup -win $_nWave1 {G2}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/mmu0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvGetSignalClose -win $_nWave1
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
wvZoom -win $_nWave1 293450.695715 623582.728395
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 436357.813954
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectGroup -win $_nWave1 {G3}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 2)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/mmu0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvSetPosition -win $_nWave1 {("G3" 19)}
wvSetPosition -win $_nWave1 {("G3" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 )} 
wvSetPosition -win $_nWave1 {("G3" 19)}
wvSetPosition -win $_nWave1 {("G3" 19)}
wvSetPosition -win $_nWave1 {("G3" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 )} 
wvSetPosition -win $_nWave1 {("G3" 19)}
wvGetSignalClose -win $_nWave1
wvSaveSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/convolution.rc"
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSelectSignal -win $_nWave1 {( "G3" 6 7 8 )} 
wvSelectSignal -win $_nWave1 {( "G3" 6 7 8 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G3" 17 )} 
wvSelectSignal -win $_nWave1 {( "G3" 17 )} 
wvSetRadix -win $_nWave1 -format UDec
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 436357.813954
wvSetCursor -win $_nWave1 10699793.506377
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 10659193.044413
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 10681359.019806
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 5 )} 
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 5 )} 
wvSetPosition -win $_nWave1 {("G2" 5)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetCursor -win $_nWave1 10708317.037551
wvSelectSignal -win $_nWave1 {( "G3" 13 )} 
wvSetPosition -win $_nWave1 {("G3" 13)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSetPosition -win $_nWave1 {("G3" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/save_conv_result} \
{/testbed/u_core/convEngin0/saved_conv_result\[0:3\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 14 15 )} 
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSetPosition -win $_nWave1 {("G3" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/save_conv_result} \
{/testbed/u_core/convEngin0/saved_conv_result\[0:3\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 14 15 )} 
wvSetPosition -win $_nWave1 {("G3" 15)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 15 )} 
wvExpandBus -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 15 )} 
wvSetPosition -win $_nWave1 {("G3" 15)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSelectSignal -win $_nWave1 {( "G3" 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 13 )} 
wvSetPosition -win $_nWave1 {("G3" 13)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSetPosition -win $_nWave1 {("G3" 12)}
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 7)}
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSetPosition -win $_nWave1 {("G3" 12)}
wvSetPosition -win $_nWave1 {("G3" 13)}
wvSetPosition -win $_nWave1 {("G3" 12)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 12)}
wvSetPosition -win $_nWave1 {("G3" 11)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSetPosition -win $_nWave1 {("G3" 12)}
wvSetPosition -win $_nWave1 {("G3" 11)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 11)}
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 11 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSaveSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/convolution.rc"
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter on
wvSelectSignal -win $_nWave1 {( "G3" 15 )} 
wvSelectSignal -win $_nWave1 {( "G3" 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSetPosition -win $_nWave1 {("G3" 5)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 27)}
wvSetCursor -win $_nWave1 10771552.844880
wvSetCursor -win $_nWave1 10770427.125457
wvSetCursor -win $_nWave1 10767820.196269
wvSetCursor -win $_nWave1 10769656.896379
wvScrollDown -win $_nWave1 1
wvSetOptions -win $_nWave1 -cursorCenter off
wvSetOptions -win $_nWave1 -cursorCenter on
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G3" 22 )} 
wvSetPosition -win $_nWave1 {("G3" 22)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 43)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSetCursor -win $_nWave1 10769156.988075 -snap {("G3" 6)}
wvSetCursor -win $_nWave1 10769216.236465 -snap {("G3" 6)}
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSelectSignal -win $_nWave1 {( "G3" 22 )} 
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 23 )} 
wvSelectSignal -win $_nWave1 {( "G3" 24 )} 
wvSelectSignal -win $_nWave1 {( "G3" 23 )} 
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G3" 45 )} 
wvSelectSignal -win $_nWave1 {( "G3" 46 )} 
wvSetPosition -win $_nWave1 {("G3" 46)}
wvSetPosition -win $_nWave1 {("G3" 26)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetCursor -win $_nWave1 10770314.298551
wvSetOptions -win $_nWave1 -cursorCenter off
wvSetOptions -win $_nWave1 -cursorCenter on
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSelectSignal -win $_nWave1 {( "G3" 10 )} 
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSetPosition -win $_nWave1 {("G3" 6)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G3" 24 )} 
wvSelectSignal -win $_nWave1 {( "G3" 24 )} 
wvSetPosition -win $_nWave1 {("G3" 24)}
wvExpandBus -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 24 )} 
wvSetPosition -win $_nWave1 {("G3" 24)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 24)}
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSetPosition -win $_nWave1 {("G3" 7)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 7)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/save_conv_result} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_all_channel_sum\[17:0\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0:3\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/save_conv_result} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_all_channel_sum\[17:0\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0:3\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSetPosition -win $_nWave1 {("G3" 9)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSetRadix -win $_nWave1 -format UDec
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSetPosition -win $_nWave1 {("G3" 8)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 25)}
wvSelectSignal -win $_nWave1 {( "G3" 25 )} 
wvSetPosition -win $_nWave1 {("G3" 5)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/save_conv_result} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[1\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[2\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[3\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[4\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[5\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[6\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[7\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[8\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[9\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[10\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[11\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[12\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[13\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[14\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[15\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_all_channel_sum\[17:0\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0:3\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/save_conv_result} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[1\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[2\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[3\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[4\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[5\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[6\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[7\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[8\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[9\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[10\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[11\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[12\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[13\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[14\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[15\]\[17:0\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_all_channel_sum\[17:0\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0:3\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSetPosition -win $_nWave1 {("G3" 6)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSetPosition -win $_nWave1 {("G3" 9)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSelectSignal -win $_nWave1 {( "G3" 10 )} 
wvSetPosition -win $_nWave1 {("G3" 10)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 17 )} 
wvSetPosition -win $_nWave1 {("G3" 17)}
wvSetPosition -win $_nWave1 {("G3" 14)}
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSetPosition -win $_nWave1 {("G3" 10)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSelectSignal -win $_nWave1 {( "G3" 11 )} 
wvExpandBus -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 12 13 14 15 )} 
wvSetRadix -win $_nWave1 -format UDec
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSelectSignal -win $_nWave1 {( "G3" 6 7 8 9 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 8 9 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 8 9 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSaveSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/convolution.rc"
wvSelectSignal -win $_nWave1 {( "G3" 11 )} 
wvSetCursor -win $_nWave1 10772691.640216 -snap {("G3" 13)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 5)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/save_conv_result} \
{/testbed/u_core/convEngin0/conv_result_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_all_channel_sum\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0:3\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[1\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[2\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[3\]\[17:0\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/save_conv_result} \
{/testbed/u_core/convEngin0/conv_result_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_all_channel_sum\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0:3\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[1\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[2\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[3\]\[17:0\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSetPosition -win $_nWave1 {("G3" 6)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/save_conv_result} \
{/testbed/u_core/convEngin0/conv_result_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/count_counter0} \
{/testbed/u_core/convEngin0/count_conv_result_counter} \
{/testbed/u_core/convEngin0/count_counter0} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_all_channel_sum\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0:3\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[1\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[2\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[3\]\[17:0\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 8 9 )} 
wvSetPosition -win $_nWave1 {("G3" 9)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSelectSignal -win $_nWave1 {( "G3" 23 )} 
wvSetPosition -win $_nWave1 {("G3" 23)}
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 10779015.070476 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 10770957.289347 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 10762425.521094
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 10767876.373028
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 10801884.949256
wvSetCursor -win $_nWave1 10801884.949256
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSelectSignal -win $_nWave1 {( "G3" 20 )} 
wvSetPosition -win $_nWave1 {("G3" 20)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetCursor -win $_nWave1 10792642.200315
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 16 )} 
wvSetPosition -win $_nWave1 {("G3" 16)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 16)}
wvSelectSignal -win $_nWave1 {( "G3" 16 )} 
wvExpandBus -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 16 )} 
wvSelectSignal -win $_nWave1 {( "G3" 16 )} 
wvSetRadix -win $_nWave1 -format UDec
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
wvSetCursor -win $_nWave1 10803973.455024
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 10895571.466965
wvSetCursor -win $_nWave1 10891305.582838
wvSetCursor -win $_nWave1 10887513.685837
wvSetCursor -win $_nWave1 10890831.595713
wvSelectSignal -win $_nWave1 {( "G3" 24 )} 
wvSetPosition -win $_nWave1 {("G3" 24)}
wvSetPosition -win $_nWave1 {("G3" 21)}
wvSetPosition -win $_nWave1 {("G3" 20)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 20)}
wvSetPosition -win $_nWave1 {("G3" 21)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvSetPosition -win $_nWave1 {("G3" 22)}
wvSetPosition -win $_nWave1 {("G3" 22)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/save_conv_result} \
{/testbed/u_core/convEngin0/conv_result_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/count_conv_result_counter} \
{/testbed/u_core/convEngin0/count_counter0} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_all_channel_sum\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0:3\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[1\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[2\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[3\]\[17:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 22 )} 
wvSetPosition -win $_nWave1 {("G3" 22)}
wvSetCursor -win $_nWave1 10894623.492715 -snap {("G3" 25)}
wvSetCursor -win $_nWave1 10885854.730899
wvSetCursor -win $_nWave1 10887750.679400
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 10889942.869846
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 21 )} 
wvSelectSignal -win $_nWave1 {( "G3" 21 )} 
wvSetRadix -win $_nWave1 -format UDec
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 10787987.787275 -snap {("G3" 7)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 10790970.053122 -snap {("G3" 7)}
wvSetCursor -win $_nWave1 10791417.801912
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter off
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 10795230.559896
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 12 )} 
wvSelectSignal -win $_nWave1 {( "G3" 12 13 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 12 13 14 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G3" 12 )} 
wvSelectSignal -win $_nWave1 {( "G3" 11 )} 
wvSetPosition -win $_nWave1 {("G3" 11)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 24)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetOptions -win $_nWave1 -cursorCenter on
wvSetOptions -win $_nWave1 -cursorCenter off
wvSelectSignal -win $_nWave1 {( "G3" 13 )} 
wvSelectSignal -win $_nWave1 {( "G3" 14 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
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
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvCloseFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvTpfCloseForm -win $_nWave1
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/core.fsdb}
wvRestoreSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/convolution.rc" \
           -overWriteAutoAlias on -appendSignals on
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
wvZoomIn -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter on
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSetRadix -win $_nWave1 -format UDec
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 10795261.215052
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSetPosition -win $_nWave1 {("G3" 7)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 31)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSetPosition -win $_nWave1 {("G3" 7)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 7)}
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSetRadix -win $_nWave1 -format UDec
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSetPosition -win $_nWave1 {("G3" 8)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 31)}
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSetPosition -win $_nWave1 {("G3" 7)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 47)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
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
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter off
wvSetOptions -win $_nWave1 -cursorCenter on
wvSetOptions -win $_nWave1 -cursorCenter off
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 10788937.366454
wvZoomIn -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter on
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 \
           22 23 )} 
wvSelectSignal -win $_nWave1 {( "G3" 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 \
           22 23 )} 
wvSetRadix -win $_nWave1 -format UDec
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSetCursor -win $_nWave1 10794681.614338
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G3" 24 )} 
wvScrollDown -win $_nWave1 12
wvSelectSignal -win $_nWave1 {( "G3" 40 )} 
wvSelectSignal -win $_nWave1 {( "G3" 24 )} 
wvSelectSignal -win $_nWave1 {( "G3" 24 25 26 27 28 29 30 31 32 33 34 35 36 37 \
           38 39 40 )} 
wvSelectSignal -win $_nWave1 {( "G3" 24 25 26 27 28 29 30 31 32 33 34 35 36 37 \
           38 39 40 )} 
wvSetRadix -win $_nWave1 -format UDec
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G3" 41 )} 
wvSelectSignal -win $_nWave1 {( "G3" 41 )} 
wvSetPosition -win $_nWave1 {("G3" 41)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 63)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G3" 42 43 44 45 46 47 48 49 50 51 52 53 54 55 \
           56 57 )} 
wvSetRadix -win $_nWave1 -format UDec
wvZoomOut -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G3" 58 )} 
wvSetPosition -win $_nWave1 {("G3" 58)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 81)}
wvSelectSignal -win $_nWave1 {( "G3" 59 )} 
wvSelectSignal -win $_nWave1 {( "G3" 58 )} 
wvScrollUp -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G3" 42 )} 
wvSelectSignal -win $_nWave1 {( "G3" 43 )} 
wvSelectSignal -win $_nWave1 {( "G3" 44 )} 
wvSelectSignal -win $_nWave1 {( "G3" 45 )} 
wvSelectSignal -win $_nWave1 {( "G3" 46 )} 
wvSelectSignal -win $_nWave1 {( "G3" 47 )} 
wvSelectSignal -win $_nWave1 {( "G3" 57 )} 
wvSetPosition -win $_nWave1 {("G3" 57)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 99)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G3" 76 )} 
wvSetPosition -win $_nWave1 {("G3" 76)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 76)}
wvSetPosition -win $_nWave1 {("G3" 81)}
wvSelectSignal -win $_nWave1 {( "G3" 57 )} 
wvSetPosition -win $_nWave1 {("G3" 57)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 57)}
wvSetPosition -win $_nWave1 {("G3" 63)}
wvSelectSignal -win $_nWave1 {( "G3" 58 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G3" 41 )} 
wvSetPosition -win $_nWave1 {("G3" 41)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 41)}
wvSetPosition -win $_nWave1 {("G3" 47)}
wvSelectSignal -win $_nWave1 {( "G3" 24 )} 
wvSetPosition -win $_nWave1 {("G3" 24)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 24)}
wvSetPosition -win $_nWave1 {("G3" 31)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 3
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSetPosition -win $_nWave1 {("G3" 5)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/save_conv_result} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[1\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[2\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[3\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[4\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[5\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[6\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[7\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[8\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[9\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[10\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[11\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[12\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[13\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[14\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[15\]\[0:10\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_all_channel_sum\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0:3\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[1\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[2\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[3\]\[17:0\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/save_conv_result} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[1\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[2\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[3\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[4\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[5\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[6\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[7\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[8\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[9\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[10\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[11\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[12\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[13\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[14\]\[0:10\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[15\]\[0:10\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_all_channel_sum\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0:3\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[1\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[2\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[3\]\[17:0\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSetPosition -win $_nWave1 {("G3" 6)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 10863659.735965
wvSetCursor -win $_nWave1 10863905.720351
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSetPosition -win $_nWave1 {("G3" 8)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSelectSignal -win $_nWave1 {( "G3" 11 )} 
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSelectSignal -win $_nWave1 {( "G3" 22 )} 
wvSetPosition -win $_nWave1 {("G3" 22)}
wvSetPosition -win $_nWave1 {("G3" 20)}
wvSetPosition -win $_nWave1 {("G3" 18)}
wvSetPosition -win $_nWave1 {("G3" 17)}
wvSetPosition -win $_nWave1 {("G3" 16)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 16)}
wvSetPosition -win $_nWave1 {("G3" 17)}
wvSelectSignal -win $_nWave1 {( "G3" 17 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetPosition -win $_nWave1 {("G3" 12)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvSetPosition -win $_nWave1 {("G3" 13)}
wvSetPosition -win $_nWave1 {("G3" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/save_conv_result} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_all_channel_sum\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0:3\]} \
{/testbed/u_core/convEngin0/conv_result_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[1\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[2\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[3\]\[17:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 13 )} 
wvSetPosition -win $_nWave1 {("G3" 13)}
wvSetPosition -win $_nWave1 {("G3" 13)}
wvSetPosition -win $_nWave1 {("G3" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/save_conv_result} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_all_channel_sum\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0:3\]} \
{/testbed/u_core/convEngin0/conv_result_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[1\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[2\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[3\]\[17:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 13 )} 
wvSetPosition -win $_nWave1 {("G3" 13)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 13 )} 
wvExpandBus -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 13 )} 
wvSetPosition -win $_nWave1 {("G3" 13)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 13)}
wvSetCursor -win $_nWave1 10890677.021050
wvSetCursor -win $_nWave1 10890103.057482
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 10917817.298327
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/origin_x\[3:0\]} \
{/testbed/u_core/origin_y\[3:0\]} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/save_conv_result} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_all_channel_sum\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0:3\]} \
{/testbed/u_core/convEngin0/conv_result_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[1\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[2\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[3\]\[17:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 6 7 )} 
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testbed/u_core/i_clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testbed/u_core/i_in_valid} \
{/testbed/u_core/i_in_data\[7:0\]} \
{/testbed/u_core/current_state\[4:0\]} \
{/testbed/u_core/i_op_mode\[3:0\]} \
{/testbed/u_core/i_op_valid} \
{/testbed/u_core/origin_x\[3:0\]} \
{/testbed/u_core/origin_y\[3:0\]} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/save_conv_result} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_sigle_channel_sum\[0:15\]} \
{/testbed/u_core/convEngin0/multiplied_with_kernel_all_channel_sum\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0:3\]} \
{/testbed/u_core/convEngin0/conv_result_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[0\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[1\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[2\]\[17:0\]} \
{/testbed/u_core/convEngin0/saved_conv_result\[3\]\[17:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_mmu_x_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_y_index\[3:0\]} \
{/testbed/u_core/convEngin0/o_mmu_channel_index\[4:0\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/set_x_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/set_y_index_counter_to_conv_origin} \
{/testbed/u_core/convEngin0/shift_line_buffer} \
{/testbed/u_core/convEngin0/sram_data\[0:15\]} \
{/testbed/u_core/convEngin0/x_index_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/y_index_counter_value\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G2" 6 7 )} 
wvSetPosition -win $_nWave1 {("G2" 7)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 10928312.632139
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter off
wvSetOptions -win $_nWave1 -cursorCenter on
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 10936633.053994
wvSetCursor -win $_nWave1 10939798.873044
wvSetPosition -win $_nWave1 {("G3" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 10998488.287747
wvSetCursor -win $_nWave1 10998163.588358
wvSetCursor -win $_nWave1 11001572.931951
wvSetCursor -win $_nWave1 11003196.428900
wvSetCursor -win $_nWave1 11004332.876764
wvSelectSignal -win $_nWave1 {( "G3" 23 )} 
wvSelectSignal -win $_nWave1 {( "G3" 23 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 11022516.042593
wvSetCursor -win $_nWave1 11021541.944424
wvSetCursor -win $_nWave1 11026574.784966
wvSetCursor -win $_nWave1 11028522.981305
wvSetCursor -win $_nWave1 11000923.533171
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSetPosition -win $_nWave1 {("G3" 8)}
wvExpandBus -win $_nWave1
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSetPosition -win $_nWave1 {("G3" 8)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSetPosition -win $_nWave1 {("G3" 9)}
wvExpandBus -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G3" 26 )} 
wvSelectSignal -win $_nWave1 {( "G3" 26 )} 
wvSetPosition -win $_nWave1 {("G3" 26)}
wvExpandBus -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 26 )} 
wvSetPosition -win $_nWave1 {("G3" 26)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 26)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSaveSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/convolution.rc"
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
