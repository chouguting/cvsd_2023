verdiSetActWin -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/user12/r2921a01/hw/hw4/1121_hw4/01_RTL/IOTDF_F5.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF/input_receiver_0"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF/des_module_0"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF/binary_gray_converter_0"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/binary_gray_mode} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF/binary_gray_converter_0"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF/crc_module_0"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF/binary_gray_converter_0"
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/binary_gray_mode} \
{/test/u_IOTDF/binary_gray_converter_0/clk} \
{/test/u_IOTDF/binary_gray_converter_0/converter_round_counter\[3:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/converter_start} \
{/test/u_IOTDF/binary_gray_converter_0/count_converter_round_counter} \
{/test/u_IOTDF/binary_gray_converter_0/current_state\[1:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_in\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_out\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_out_valid} \
{/test/u_IOTDF/binary_gray_converter_0/data_reg\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_reg_input\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_input\[7:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_output\[7:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/mode} \
{/test/u_IOTDF/binary_gray_converter_0/next_xor_carry} \
{/test/u_IOTDF/binary_gray_converter_0/reset_xor_carry_reg} \
{/test/u_IOTDF/binary_gray_converter_0/save_to_data_reg} \
{/test/u_IOTDF/binary_gray_converter_0/save_xor_carry_reg} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 \
           )} 
wvSetPosition -win $_nWave1 {("G1" 18)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 13611.945048
wvZoomIn -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter on
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF/binary_gray_converter_0"
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/binary_gray_mode} \
{/test/u_IOTDF/binary_gray_converter_0/clk} \
{/test/u_IOTDF/binary_gray_converter_0/converter_round_counter\[3:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/converter_start} \
{/test/u_IOTDF/binary_gray_converter_0/count_converter_round_counter} \
{/test/u_IOTDF/binary_gray_converter_0/current_state\[1:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_in\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_out\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_out_valid} \
{/test/u_IOTDF/binary_gray_converter_0/data_reg\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_reg_input\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_input\[7:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_output\[7:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/mode} \
{/test/u_IOTDF/binary_gray_converter_0/next_xor_carry} \
{/test/u_IOTDF/binary_gray_converter_0/reset_xor_carry_reg} \
{/test/u_IOTDF/binary_gray_converter_0/save_to_data_reg} \
{/test/u_IOTDF/binary_gray_converter_0/save_xor_carry_reg} \
{/test/u_IOTDF/binary_gray_converter_0/xor_carry_in} \
{/test/u_IOTDF/binary_gray_converter_0/xor_carry_reg} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 19 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/binary_gray_mode} \
{/test/u_IOTDF/binary_gray_converter_0/clk} \
{/test/u_IOTDF/binary_gray_converter_0/converter_round_counter\[3:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/converter_start} \
{/test/u_IOTDF/binary_gray_converter_0/count_converter_round_counter} \
{/test/u_IOTDF/binary_gray_converter_0/current_state\[1:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_in\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_out\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_out_valid} \
{/test/u_IOTDF/binary_gray_converter_0/data_reg\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_reg_input\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_input\[7:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_output\[7:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/mode} \
{/test/u_IOTDF/binary_gray_converter_0/next_xor_carry} \
{/test/u_IOTDF/binary_gray_converter_0/reset_xor_carry_reg} \
{/test/u_IOTDF/binary_gray_converter_0/save_to_data_reg} \
{/test/u_IOTDF/binary_gray_converter_0/save_xor_carry_reg} \
{/test/u_IOTDF/binary_gray_converter_0/xor_carry_in} \
{/test/u_IOTDF/binary_gray_converter_0/xor_carry_reg} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 19 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
wvSelectSignal -win $_nWave1 {( "G1" 16 )} 
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 20)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF/binary_gray_converter_0"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF/binary_gray_converter_0"
wvSelectGroup -win $_nWave1 {G2}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF/binary_gray_converter_0"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF/binary_gray_converter_0"
wvGetSignalSetScope -win $_nWave1 \
           "/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_unit_0"
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/binary_gray_mode} \
{/test/u_IOTDF/binary_gray_converter_0/clk} \
{/test/u_IOTDF/binary_gray_converter_0/converter_round_counter\[3:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/converter_start} \
{/test/u_IOTDF/binary_gray_converter_0/count_converter_round_counter} \
{/test/u_IOTDF/binary_gray_converter_0/current_state\[1:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_in\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_out\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_out_valid} \
{/test/u_IOTDF/binary_gray_converter_0/data_reg\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_reg_input\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_input\[7:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_output\[7:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/mode} \
{/test/u_IOTDF/binary_gray_converter_0/save_to_data_reg} \
{/test/u_IOTDF/binary_gray_converter_0/save_xor_carry_reg} \
{/test/u_IOTDF/binary_gray_converter_0/reset_xor_carry_reg} \
{/test/u_IOTDF/binary_gray_converter_0/xor_carry_in} \
{/test/u_IOTDF/binary_gray_converter_0/xor_carry_reg} \
{/test/u_IOTDF/binary_gray_converter_0/next_xor_carry} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_unit_0/data_in\[7:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_unit_0/data_out\[7:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_unit_0/last_xor_result} \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_unit_0/next_xor_result} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/binary_gray_mode} \
{/test/u_IOTDF/binary_gray_converter_0/clk} \
{/test/u_IOTDF/binary_gray_converter_0/converter_round_counter\[3:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/converter_start} \
{/test/u_IOTDF/binary_gray_converter_0/count_converter_round_counter} \
{/test/u_IOTDF/binary_gray_converter_0/current_state\[1:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_in\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_out\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_out_valid} \
{/test/u_IOTDF/binary_gray_converter_0/data_reg\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/data_reg_input\[127:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_input\[7:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_output\[7:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/mode} \
{/test/u_IOTDF/binary_gray_converter_0/save_to_data_reg} \
{/test/u_IOTDF/binary_gray_converter_0/save_xor_carry_reg} \
{/test/u_IOTDF/binary_gray_converter_0/reset_xor_carry_reg} \
{/test/u_IOTDF/binary_gray_converter_0/xor_carry_in} \
{/test/u_IOTDF/binary_gray_converter_0/xor_carry_reg} \
{/test/u_IOTDF/binary_gray_converter_0/next_xor_carry} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_unit_0/data_in\[7:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_unit_0/data_out\[7:0\]} \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_unit_0/last_xor_result} \
{/test/u_IOTDF/binary_gray_converter_0/gray_to_bin_xor_unit_0/next_xor_result} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 10)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 23408.209851
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 13678.452923
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter off
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSelectSignal -win $_nWave1 {( "G1" 16 )} 
