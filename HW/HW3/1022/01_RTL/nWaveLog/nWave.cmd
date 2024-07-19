verdiSetActWin -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/core.fsdb}
wvRestoreSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/convolution.rc" \
           -overWriteAutoAlias on -appendSignals on
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G3" 26 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 26)}
wvSetPosition -win $_nWave1 {("G3" 25)}
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSetPosition -win $_nWave1 {("G3" 9)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 9)}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSelectSignal -win $_nWave1 {( "G3" 12 )} 
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSelectSignal -win $_nWave1 {( "G3" 9 10 11 12 13 14 15 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 8)}
wvGetSignalOpen -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
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
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 10700214.114910
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter on
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSetRadix -win $_nWave1 -format UDec
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSelectSignal -win $_nWave1 {( "G3" 6 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetCursor -win $_nWave1 10817681.694929
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSetPosition -win $_nWave1 {("G3" 11)}
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
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0:3\]} \
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
wvSelectSignal -win $_nWave1 {( "G3" 10 11 )} 
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSetPosition -win $_nWave1 {("G3" 11)}
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
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0:3\]} \
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
wvSelectSignal -win $_nWave1 {( "G3" 10 11 )} 
wvSetPosition -win $_nWave1 {("G3" 11)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 10 11 )} 
wvSetRadix -win $_nWave1 -format Ascii
wvSelectSignal -win $_nWave1 {( "G3" 10 11 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 10771390.283770
wvSetCursor -win $_nWave1 10774411.034847
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 11 )} 
wvSelectSignal -win $_nWave1 {( "G3" 10 )} 
wvSelectSignal -win $_nWave1 {( "G3" 10 )} 
wvSetPosition -win $_nWave1 {("G3" 10)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 15)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 15 )} 
wvExpandBus -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 10 )} 
wvSelectSignal -win $_nWave1 {( "G3" 10 )} 
wvSetPosition -win $_nWave1 {("G3" 10)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSelectSignal -win $_nWave1 {( "G3" 11 )} 
wvSelectSignal -win $_nWave1 {( "G3" 11 )} 
wvSetPosition -win $_nWave1 {("G3" 11)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 11)}
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 11 )} 
wvExpandBus -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 11 )} 
wvSetPosition -win $_nWave1 {("G3" 11)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSelectSignal -win $_nWave1 {( "G3" 10 )} 
wvSetPosition -win $_nWave1 {("G3" 10)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSelectSignal -win $_nWave1 {( "G3" 10 )} 
wvSetPosition -win $_nWave1 {("G3" 10)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSetCursor -win $_nWave1 10815278.617169
wvSetCursor -win $_nWave1 10807885.726376 -snap {("G3" 10)}
wvSetCursor -win $_nWave1 10808839.647768 -snap {("G3" 10)}
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
{/testbed/u_core/origin_x\[3:0\]} \
{/testbed/u_core/origin_y\[3:0\]} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0:3\]} \
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
wvSelectSignal -win $_nWave1 {( "G3" 12 13 )} 
wvSetPosition -win $_nWave1 {("G3" 13)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 12 13 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvSelectSignal -win $_nWave1 {( "G3" 13 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
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
{/testbed/u_core/origin_x\[3:0\]} \
{/testbed/u_core/origin_y\[3:0\]} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum_abs\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum_abs\[0:3\]} \
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
{/testbed/u_core/origin_x\[3:0\]} \
{/testbed/u_core/origin_y\[3:0\]} \
{/testbed/u_core/conv_engine_start_trigger} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testbed/u_core/convEngin0/current_state\[4:0\]} \
{/testbed/u_core/convEngin0/i_clk} \
{/testbed/u_core/convEngin0/i_origin_x\[3:0\]} \
{/testbed/u_core/convEngin0/i_origin_y\[3:0\]} \
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum_abs\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum_abs\[0:3\]} \
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
wvSelectSignal -win $_nWave1 {( "G3" 14 15 )} 
wvSetPosition -win $_nWave1 {("G3" 15)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 14 15 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSaveSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/sobel.rc"
wvSetCursor -win $_nWave1 10771557.220006
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 9)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSetPosition -win $_nWave1 {("G3" 11)}
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
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/save_sobel_degree} \
{/testbed/u_core/convEngin0/save_sobel_result} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum_abs\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum_abs\[0:3\]} \
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
wvSelectSignal -win $_nWave1 {( "G3" 10 11 )} 
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSetPosition -win $_nWave1 {("G3" 11)}
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
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/save_sobel_degree} \
{/testbed/u_core/convEngin0/save_sobel_result} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum_abs\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum_abs\[0:3\]} \
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
wvSelectSignal -win $_nWave1 {( "G3" 10 11 )} 
wvSetPosition -win $_nWave1 {("G3" 11)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 10769470.516953
wvSelectSignal -win $_nWave1 {( "G3" 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 16 )} 
wvSelectSignal -win $_nWave1 {( "G3" 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G3" 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 14 )} 
wvSetPosition -win $_nWave1 {("G3" 14)}
wvExpandBus -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 19 )} 
wvSetPosition -win $_nWave1 {("G3" 19)}
wvExpandBus -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvSetPosition -win $_nWave1 {("G3" 24)}
wvSetPosition -win $_nWave1 {("G3" 24)}
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
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/save_sobel_degree} \
{/testbed/u_core/convEngin0/save_sobel_result} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum_abs\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum_abs\[0:3\]} \
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
wvSelectSignal -win $_nWave1 {( "G3" 24 )} 
wvSetPosition -win $_nWave1 {("G3" 24)}
wvSetPosition -win $_nWave1 {("G3" 24)}
wvSetPosition -win $_nWave1 {("G3" 24)}
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
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/save_sobel_degree} \
{/testbed/u_core/convEngin0/save_sobel_result} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum_abs\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum_abs\[0:3\]} \
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
wvSelectSignal -win $_nWave1 {( "G3" 24 )} 
wvSetPosition -win $_nWave1 {("G3" 24)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 24 )} 
wvExpandBus -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 25 26 27 28 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G3" 12 )} 
wvSetPosition -win $_nWave1 {("G3" 12)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 32)}
wvSelectSignal -win $_nWave1 {( "G3" 12 )} 
wvSetPosition -win $_nWave1 {("G3" 12)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 12)}
wvSetPosition -win $_nWave1 {("G3" 28)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G3" 29 )} 
wvSelectSignal -win $_nWave1 {( "G3" 29 30 31 32 33 34 35 36 37 38 39 40 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 28)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 \
           "/testbed/u_core/convEngin0/generate_sobel_degree\[0\]"
wvGetSignalSetScope -win $_nWave1 \
           "/testbed/u_core/convEngin0/generate_sobel_degree\[0\]/arctan_approx"
wvSetPosition -win $_nWave1 {("G3" 40)}
wvSetPosition -win $_nWave1 {("G3" 40)}
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
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/save_sobel_degree} \
{/testbed/u_core/convEngin0/save_sobel_result} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_degree\[0\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[1\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[2\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[3\]\[3:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[0\]/arctan_approx/abs_x\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[0\]/arctan_approx/abs_x_extended\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[0\]/arctan_approx/abs_y\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[0\]/arctan_approx/abs_y_extended\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[0\]/arctan_approx/i_data_x\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[0\]/arctan_approx/i_data_y\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[0\]/arctan_approx/o_degree_approx\[3:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[0\]/arctan_approx/same_sign} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[0\]/arctan_approx/x_times_tan_0\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[0\]/arctan_approx/x_times_tan_22_5\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[0\]/arctan_approx/x_times_tan_45\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[0\]/arctan_approx/x_times_tan_67_5\[21:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 29 30 31 32 33 34 35 36 37 38 39 40 )} 
wvSetPosition -win $_nWave1 {("G3" 40)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 29 )} 
wvSelectSignal -win $_nWave1 {( "G3" 33 )} 
wvSelectSignal -win $_nWave1 {( "G3" 33 )} 
wvSelectSignal -win $_nWave1 {( "G3" 29 )} 
wvSelectSignal -win $_nWave1 {( "G3" 29 30 31 32 33 34 35 36 37 38 39 40 )} 
wvSetPosition -win $_nWave1 {("G3" 29)}
wvSetPosition -win $_nWave1 {("G3" 38)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 12)}
wvSetPosition -win $_nWave1 {("G4" 12)}
wvSelectSignal -win $_nWave1 {( "G4" 1 )} 
wvSelectSignal -win $_nWave1 {( "G4" 5 )} 
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSelectSignal -win $_nWave1 {( "G4" 1 2 )} 
wvSelectSignal -win $_nWave1 {( "G4" 1 2 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvSelectSignal -win $_nWave1 {( "G4" 2 )} 
wvSelectSignal -win $_nWave1 {( "G4" 3 )} 
wvSelectSignal -win $_nWave1 {( "G4" 8 )} 
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 3)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G4" 8 )} 
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 11)}
wvSetPosition -win $_nWave1 {("G4" 12)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 12)}
wvSaveSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/sobel.rc"
wvSelectSignal -win $_nWave1 {( "G4" 3 )} 
wvSelectSignal -win $_nWave1 {( "G4" 4 )} 
wvSelectSignal -win $_nWave1 {( "G4" 4 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 4)}
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSetPosition -win $_nWave1 {("G4" 4)}
wvSetPosition -win $_nWave1 {("G4" 5)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 4)}
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSetCursor -win $_nWave1 10789677.751784
wvSelectSignal -win $_nWave1 {( "G4" 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G4" 12 )} 
wvSelectSignal -win $_nWave1 {( "G4" 12 )} 
wvSetRadix -win $_nWave1 -format UDec
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 10790254.079287
wvSetCursor -win $_nWave1 10794506.978829
wvSetCursor -win $_nWave1 10789657.878417
wvSetCursor -win $_nWave1 10794785.205902
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 10769864.009519 -snap {("G3" 13)}
wvSelectSignal -win $_nWave1 {( "G3" 13 )} 
wvSetPosition -win $_nWave1 {("G3" 13)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 5)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter off
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter on
wvSetOptions -win $_nWave1 -cursorCenter off
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G3" 13 )} 
wvSelectSignal -win $_nWave1 {( "G3" 13 14 15 16 17 )} 
wvSelectSignal -win $_nWave1 {( "G3" 13 14 15 16 17 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 10774378.032736
wvSelectSignal -win $_nWave1 {( "G3" 12 )} 
wvSelectSignal -win $_nWave1 {( "G3" 12 )} 
wvSetPosition -win $_nWave1 {("G3" 12)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 5)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G3" 22 )} 
wvSelectGroup -win $_nWave1 {G4}
wvSelectSignal -win $_nWave1 {( "G4" 1 )} 
wvSelectSignal -win $_nWave1 {( "G4" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 \
           "/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx"
wvGetSignalSetScope -win $_nWave1 \
           "/testbed/u_core/convEngin0/generate_sobel_degree\[0\]/arctan_approx"
wvGetSignalSetScope -win $_nWave1 \
           "/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx"
wvSetPosition -win $_nWave1 {("G4" 12)}
wvSetPosition -win $_nWave1 {("G4" 12)}
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
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/save_sobel_degree} \
{/testbed/u_core/convEngin0/save_sobel_result} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[1\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[2\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[3\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[1\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[2\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[3\]\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_degree\[0\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[1\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[2\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[3\]\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_x\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_x_extended\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_y\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_y_extended\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/i_data_x\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/i_data_y\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/o_degree_approx\[3:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/same_sign} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_0\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_22_5\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_45\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_67_5\[21:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave1 {("G4" 12)}
wvSetPosition -win $_nWave1 {("G4" 12)}
wvSetPosition -win $_nWave1 {("G4" 12)}
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
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/save_sobel_degree} \
{/testbed/u_core/convEngin0/save_sobel_result} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[1\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[2\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[3\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[1\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[2\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[3\]\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_degree\[0\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[1\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[2\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[3\]\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_x\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_x_extended\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_y\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_y_extended\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/i_data_x\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/i_data_y\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/o_degree_approx\[3:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/same_sign} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_0\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_22_5\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_45\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_67_5\[21:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave1 {("G4" 12)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G4" 5 )} 
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetCursor -win $_nWave1 10770303.993455
wvSelectSignal -win $_nWave1 {( "G4" 1 2 )} 
wvSelectSignal -win $_nWave1 {( "G4" 1 2 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvSelectSignal -win $_nWave1 {( "G4" 7 )} 
wvSelectSignal -win $_nWave1 {( "G3" 12 )} 
wvSetPosition -win $_nWave1 {("G3" 12)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 12)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSelectSignal -win $_nWave1 {( "G3" 13 )} 
wvSetPosition -win $_nWave1 {("G3" 13)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 13)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSelectSignal -win $_nWave1 {( "G4" 7 )} 
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvSelectSignal -win $_nWave1 {( "G4" 7 )} 
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvSetPosition -win $_nWave1 {("G4" 12)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvSelectSignal -win $_nWave1 {( "G4" 7 )} 
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G4" 12)}
wvSetPosition -win $_nWave1 {("G4" 11)}
wvSetPosition -win $_nWave1 {("G4" 12)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 12)}
wvSelectSignal -win $_nWave1 {( "G4" 3 )} 
wvSelectSignal -win $_nWave1 {( "G4" 7 )} 
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSelectSignal -win $_nWave1 {( "G4" 4 )} 
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 4)}
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 10824276.752492
wvSelectSignal -win $_nWave1 {( "G3" 12 )} 
wvSetPosition -win $_nWave1 {("G3" 12)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSelectSignal -win $_nWave1 {( "G3" 12 )} 
wvSetPosition -win $_nWave1 {("G3" 12)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 12)}
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSelectSignal -win $_nWave1 {( "G3" 13 )} 
wvSetPosition -win $_nWave1 {("G3" 13)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 5)}
wvZoomIn -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 \
           "/testbed/u_core/convEngin0/generate_sobel_degree\[0\]"
wvGetSignalSetScope -win $_nWave1 \
           "/testbed/u_core/convEngin0/generate_sobel_degree\[1\]"
wvGetSignalSetScope -win $_nWave1 \
           "/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 6)}
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
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/save_sobel_degree} \
{/testbed/u_core/convEngin0/save_sobel_result} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[1\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[2\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[3\]\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_degree\[0\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[1\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[2\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[3\]\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/i_data_x\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/i_data_y\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/same_sign} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_x\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_y\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_result_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_x_extended\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_y_extended\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_0\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_22_5\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_45\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_67_5\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/o_degree_approx\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 6)}
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
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/save_sobel_degree} \
{/testbed/u_core/convEngin0/save_sobel_result} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[1\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[2\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[3\]\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_degree\[0\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[1\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[2\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[3\]\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/i_data_x\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/i_data_y\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/same_sign} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_x\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_y\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_result_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_x_extended\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_y_extended\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_0\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_22_5\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_45\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_67_5\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/o_degree_approx\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvSetPosition -win $_nWave1 {("G4" 6)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 17)}
wvSetPosition -win $_nWave1 {("G3" 27)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 27)}
wvSetPosition -win $_nWave1 {("G3" 28)}
wvSetPosition -win $_nWave1 {("G3" 21)}
wvSetPosition -win $_nWave1 {("G3" 18)}
wvSetPosition -win $_nWave1 {("G3" 17)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 17)}
wvSetPosition -win $_nWave1 {("G3" 18)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSetCursor -win $_nWave1 10803250.735131
wvSetCursor -win $_nWave1 10809610.211082
wvSetCursor -win $_nWave1 10813664.377001
wvSetCursor -win $_nWave1 10818831.451211
wvSetPosition -win $_nWave1 {("G3" 17)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testbed"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvGetSignalSetScope -win $_nWave1 \
           "/testbed/u_core/convEngin0/generate_sobel_degree\[0\]"
wvGetSignalSetScope -win $_nWave1 \
           "/testbed/u_core/convEngin0/generate_sobel_degree\[1\]"
wvGetSignalSetScope -win $_nWave1 \
           "/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx"
wvGetSignalSetScope -win $_nWave1 "/testbed/u_core/convEngin0"
wvSetPosition -win $_nWave1 {("G3" 18)}
wvSetPosition -win $_nWave1 {("G3" 18)}
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
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/save_sobel_degree} \
{/testbed/u_core/convEngin0/save_sobel_result} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[1\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[2\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[3\]\[0:3\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/sobel_result_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_degree\[0\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[1\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[2\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[3\]\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/i_data_x\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/i_data_y\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/same_sign} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_x\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_y\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_x_extended\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_y_extended\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_0\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_22_5\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_45\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_67_5\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/o_degree_approx\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G3" 18 )} 
wvSetPosition -win $_nWave1 {("G3" 18)}
wvSetPosition -win $_nWave1 {("G3" 18)}
wvSetPosition -win $_nWave1 {("G3" 18)}
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
{/testbed/u_core/convEngin0/line_buffer_sram\[0:15\]} \
{/testbed/u_core/convEngin0/o_finished} \
{/testbed/u_core/convEngin0/o_output_valid} \
{/testbed/u_core/convEngin0/i_channel_window\[1:0\]} \
{/testbed/u_core/convEngin0/o_output_data\[13:0\]} \
{/testbed/u_core/convEngin0/save_sobel_degree} \
{/testbed/u_core/convEngin0/save_sobel_result} \
{/testbed/u_core/convEngin0/saved_sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[0\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[1\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[2\]\[0:3\]} \
{/testbed/u_core/convEngin0/saved_sobel_result\[3\]\[0:3\]} \
{/testbed/u_core/convEngin0/counter0_value\[5:0\]} \
{/testbed/u_core/convEngin0/sobel_result_counter_value\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_x_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[0\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[1\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[2\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_y_single_channel_sum\[3\]\[13:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[0:3\]} \
{/testbed/u_core/convEngin0/sobel_degree\[0\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[1\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[2\]\[3:0\]} \
{/testbed/u_core/convEngin0/sobel_degree\[3\]\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/i_data_x\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/i_data_y\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/same_sign} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_x\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_y\[13:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_x_extended\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/abs_y_extended\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_0\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_22_5\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_45\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/x_times_tan_67_5\[21:0\]} \
{/testbed/u_core/convEngin0/generate_sobel_degree\[1\]/arctan_approx/o_degree_approx\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G3" 18 )} 
wvSetPosition -win $_nWave1 {("G3" 18)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 10829642.560328
wvSetCursor -win $_nWave1 10824078.018871
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G3" 14 )} 
wvSelectSignal -win $_nWave1 {( "G3" 15 )} 
wvSelectSignal -win $_nWave1 {( "G3" 12 )} 
wvSelectSignal -win $_nWave1 {( "G3" 12 )} 
wvSetPosition -win $_nWave1 {("G3" 12)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 22)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 17 )} 
wvSelectSignal -win $_nWave1 {( "G3" 17 18 19 20 )} 
wvSelectSignal -win $_nWave1 {( "G3" 21 )} 
wvSelectSignal -win $_nWave1 {( "G3" 17 18 19 20 21 )} 
wvSelectSignal -win $_nWave1 {( "G3" 17 18 19 20 21 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvSelectSignal -win $_nWave1 {( "G3" 22 )} 
wvExpandBus -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 22 )} 
wvSetPosition -win $_nWave1 {("G3" 22)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 22)}
