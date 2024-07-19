verdiSetActWin -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/user12/r2921a01/hw/hw4/1121_hw4/01_RTL/IOTDF_F2.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF/des_module_0/key_scheduler_0"
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/des_module_0/key_scheduler_0/clk} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/input_for_pc2_permutation\[55:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/input_for_shifter_left_part\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/input_for_shifter_right_part\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/left_part_right_shifter_1bit_out\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/load_key_reg} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/pc2_input_select\[1:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/permuted_cipher_key\[55:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/right_part_right_shifter_1bit_out\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/schedule_counter_value\[3:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/shifter_select\[1:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/shifter_source} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/des_module_0/key_scheduler_0/clk} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/input_for_pc2_permutation\[55:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/input_for_shifter_left_part\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/input_for_shifter_right_part\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/left_part_right_shifter_1bit_out\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/load_key_reg} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/pc2_input_select\[1:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/permuted_cipher_key\[55:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/right_part_right_shifter_1bit_out\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/schedule_counter_value\[3:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/shifter_select\[1:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/shifter_source} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/key_out\[47:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/des_module_0/key_scheduler_0/clk} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/input_for_pc2_permutation\[55:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/input_for_shifter_left_part\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/input_for_shifter_right_part\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/left_part_right_shifter_1bit_out\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/load_key_reg} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/pc2_input_select\[1:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/permuted_cipher_key\[55:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/right_part_right_shifter_1bit_out\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/schedule_counter_value\[3:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/shifter_select\[1:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/shifter_source} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/key_out\[47:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 13212.897799
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter on
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 14986.441128
wvSaveSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw4/1121_hw4/01_RTL/des_decrypt.rc"
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF/des_module_0"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF/des_module_0/key_scheduler_0"
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/des_module_0/key_scheduler_0/clk} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/input_for_pc2_permutation\[55:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/input_for_shifter_left_part\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/input_for_shifter_right_part\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/left_part_right_shifter_1bit_out\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/load_key_reg} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/pc2_input_select\[1:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/permuted_cipher_key\[55:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/right_part_right_shifter_1bit_out\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/schedule_counter_value\[3:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/key_reg_left_part\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/key_reg_right_part\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/shifter_select\[1:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/shifter_source} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/key_out\[47:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 11 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/des_module_0/key_scheduler_0/clk} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/input_for_pc2_permutation\[55:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/input_for_shifter_left_part\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/input_for_shifter_right_part\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/left_part_right_shifter_1bit_out\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/load_key_reg} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/pc2_input_select\[1:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/permuted_cipher_key\[55:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/right_part_right_shifter_1bit_out\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/schedule_counter_value\[3:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/key_reg_left_part\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/key_reg_right_part\[27:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/shifter_select\[1:0\]} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/shifter_source} \
{/test/u_IOTDF/des_module_0/key_scheduler_0/key_out\[47:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 11 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetCursor -win $_nWave1 13301.574966
wvSetCursor -win $_nWave1 13390.252132
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 13667.368277
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 12)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 14387.870254
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
