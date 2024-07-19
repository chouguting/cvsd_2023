verdiSetActWin -win $_nWave1
wvResizeWindow -win $_nWave1 251 213 892 72
wvResizeWindow -win $_nWave1 0 23 1920 1009
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/origin_and_scale.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_origin_and_scale"
wvGetSignalSetScope -win $_nWave1 "/test_origin_and_scale/tests"
wvGetSignalSetScope -win $_nWave1 "/test_origin_and_scale/u_core"
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_origin_and_scale/u_core/channel_window\[1:0\]} \
{/test_origin_and_scale/u_core/current_state\[4:0\]} \
{/test_origin_and_scale/u_core/decrease_origin_x} \
{/test_origin_and_scale/u_core/decrease_origin_y} \
{/test_origin_and_scale/u_core/i_clk} \
{/test_origin_and_scale/u_core/i_op_mode\[3:0\]} \
{/test_origin_and_scale/u_core/i_op_valid} \
{/test_origin_and_scale/u_core/i_rst_n} \
{/test_origin_and_scale/u_core/increase_origin_x} \
{/test_origin_and_scale/u_core/increase_origin_y} \
{/test_origin_and_scale/u_core/input_op_ready} \
{/test_origin_and_scale/u_core/origin_x\[3:0\]} \
{/test_origin_and_scale/u_core/origin_y\[3:0\]} \
{/test_origin_and_scale/u_core/scale_down_channel_window} \
{/test_origin_and_scale/u_core/scale_up_channel_window} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_origin_and_scale/u_core/channel_window\[1:0\]} \
{/test_origin_and_scale/u_core/current_state\[4:0\]} \
{/test_origin_and_scale/u_core/decrease_origin_x} \
{/test_origin_and_scale/u_core/decrease_origin_y} \
{/test_origin_and_scale/u_core/i_clk} \
{/test_origin_and_scale/u_core/i_op_mode\[3:0\]} \
{/test_origin_and_scale/u_core/i_op_valid} \
{/test_origin_and_scale/u_core/i_rst_n} \
{/test_origin_and_scale/u_core/increase_origin_x} \
{/test_origin_and_scale/u_core/increase_origin_y} \
{/test_origin_and_scale/u_core/input_op_ready} \
{/test_origin_and_scale/u_core/origin_x\[3:0\]} \
{/test_origin_and_scale/u_core/origin_y\[3:0\]} \
{/test_origin_and_scale/u_core/scale_down_channel_window} \
{/test_origin_and_scale/u_core/scale_up_channel_window} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvGetSignalClose -win $_nWave1
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
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_origin_and_scale/u_core/i_clk} \
{/test_origin_and_scale/u_core/i_rst_n} \
{/test_origin_and_scale/u_core/o_op_ready} \
{/test_origin_and_scale/u_core/channel_window\[1:0\]} \
{/test_origin_and_scale/u_core/current_state\[4:0\]} \
{/test_origin_and_scale/u_core/decrease_origin_x} \
{/test_origin_and_scale/u_core/decrease_origin_y} \
{/test_origin_and_scale/u_core/i_op_mode\[3:0\]} \
{/test_origin_and_scale/u_core/i_op_valid} \
{/test_origin_and_scale/u_core/increase_origin_x} \
{/test_origin_and_scale/u_core/increase_origin_y} \
{/test_origin_and_scale/u_core/input_op_ready} \
{/test_origin_and_scale/u_core/origin_x\[3:0\]} \
{/test_origin_and_scale/u_core/origin_y\[3:0\]} \
{/test_origin_and_scale/u_core/scale_down_channel_window} \
{/test_origin_and_scale/u_core/scale_up_channel_window} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 0.000000
wvSetCursor -win $_nWave1 417670.048649
wvSetCursor -win $_nWave1 421296.050157
wvZoomIn -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter on
wvZoomIn -win $_nWave1
wvSetOptions -win $_nWave1 -cursorCenter off
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_origin_and_scale"
wvGetSignalSetScope -win $_nWave1 "/test_origin_and_scale/u_core"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_origin_and_scale/u_core/i_clk} \
{/test_origin_and_scale/u_core/i_rst_n} \
{/test_origin_and_scale/u_core/o_op_ready} \
{/test_origin_and_scale/u_core/channel_window\[1:0\]} \
{/test_origin_and_scale/u_core/current_state\[4:0\]} \
{/test_origin_and_scale/u_core/next_state\[4:0\]} \
{/test_origin_and_scale/u_core/decrease_origin_x} \
{/test_origin_and_scale/u_core/decrease_origin_y} \
{/test_origin_and_scale/u_core/i_op_mode\[3:0\]} \
{/test_origin_and_scale/u_core/i_op_valid} \
{/test_origin_and_scale/u_core/increase_origin_x} \
{/test_origin_and_scale/u_core/increase_origin_y} \
{/test_origin_and_scale/u_core/input_op_ready} \
{/test_origin_and_scale/u_core/origin_x\[3:0\]} \
{/test_origin_and_scale/u_core/origin_y\[3:0\]} \
{/test_origin_and_scale/u_core/scale_down_channel_window} \
{/test_origin_and_scale/u_core/scale_up_channel_window} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 5 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 6 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetCursor -win $_nWave1 421296.050157
wvSetCursor -win $_nWave1 423732.269920
wvSetCursor -win $_nWave1 422825.769543
wvSetCursor -win $_nWave1 422825.769543
wvSetCursor -win $_nWave1 421466.018978
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 421466.018978
wvSetCursor -win $_nWave1 418038.314428
wvSetCursor -win $_nWave1 420361.221643
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSaveSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/origin_and_scale.rc"
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
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetCursor -win $_nWave1 423124.623675
wvSetCursor -win $_nWave1 426399.928772
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetCursor -win $_nWave1 429282.197257
wvSetCursor -win $_nWave1 434129.648801
wvSetCursor -win $_nWave1 441990.381033
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 619577.423388
wvSetOptions -win $_nWave1 -cursorCenter on
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_origin_and_scale/tests"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_origin_and_scale/u_core/i_clk} \
{/test_origin_and_scale/u_core/i_rst_n} \
{/test_origin_and_scale/u_core/o_op_ready} \
{/test_origin_and_scale/u_core/i_op_valid} \
{/test_origin_and_scale/u_core/i_op_mode\[3:0\]} \
{/test_origin_and_scale/tests/i\[31:0\]} \
{/test_origin_and_scale/u_core/current_state\[4:0\]} \
{/test_origin_and_scale/u_core/next_state\[4:0\]} \
{/test_origin_and_scale/u_core/channel_window\[1:0\]} \
{/test_origin_and_scale/u_core/decrease_origin_x} \
{/test_origin_and_scale/u_core/decrease_origin_y} \
{/test_origin_and_scale/u_core/increase_origin_x} \
{/test_origin_and_scale/u_core/increase_origin_y} \
{/test_origin_and_scale/u_core/input_op_ready} \
{/test_origin_and_scale/u_core/origin_x\[3:0\]} \
{/test_origin_and_scale/u_core/origin_y\[3:0\]} \
{/test_origin_and_scale/u_core/scale_down_channel_window} \
{/test_origin_and_scale/u_core/scale_up_channel_window} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 627831.192232
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 16 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 627831.192232
wvSetCursor -win $_nWave1 622918.234587
wvSetCursor -win $_nWave1 623049.246791
wvSetCursor -win $_nWave1 627896.698334
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 650692.821809 -snap {("G1" 15)}
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 1032500.000000
wvSetCursor -win $_nWave1 612015.649677
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 580027.709978
wvSetCursor -win $_nWave1 588328.643216
wvSetCursor -win $_nWave1 414009.045226 -snap {("G1" 14)}
wvSetCursor -win $_nWave1 404670.495334 -snap {("G1" 14)}
wvSetCursor -win $_nWave1 610118.592965 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 598704.809763 -snap {("G1" 14)}
wvSetCursor -win $_nWave1 604930.509691 -snap {("G1" 14)}
wvSetCursor -win $_nWave1 578990.093324
wvSetCursor -win $_nWave1 802077.674085
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetCursor -win $_nWave1 1229053.221442 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 1224860.830918 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 1237962.051306 -snap {("G1" 9)}
wvSaveSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/origin_and_scale.rc"
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/write_mmu.fsdb}
wvRestoreSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/test_write_mmu.rc" \
           -overWriteAutoAlias on -appendSignals on
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 1447018.756084
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 )} \
           
wvRestoreSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
wvSetFileTimeRange -win $_nWave1 -time_unit 1p 0 20970000
wvCloseFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvTpfCloseForm -win $_nWave1
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/write_mmu.fsdb}
wvSetFileTimeRange -win $_nWave1 -time_unit 1p 0 20970000
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/mmu_ready} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/mmu_ready} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetCursor -win $_nWave1 129997.440775 -snap {("G1" 4)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 2 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 2 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 2 3 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetPosition -win $_nWave1 {("G1" 9)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/i_in_data\[7:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/o_out_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 11 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/i_in_data\[7:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/o_out_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 11 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 10 11 12 )} 
wvSetRadix -win $_nWave1 -format UDec
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
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 20909062.053123
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 20920758.025836
wvSetOptions -win $_nWave1 -cursorCenter off
wvSetOptions -win $_nWave1 -cursorCenter on
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 20912738.889908
wvSetCursor -win $_nWave1 20912738.889908
wvSetCursor -win $_nWave1 20915425.930217
wvSetCursor -win $_nWave1 20920128.250757
wvSetCursor -win $_nWave1 20914502.260111
wvSetCursor -win $_nWave1 20914502.260111
wvSetCursor -win $_nWave1 20908960.239474
wvSetCursor -win $_nWave1 20913998.440053
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/i_in_data\[7:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/o_out_valid} \
{/test_sram_write/u_core/o_op_ready} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/i_in_data\[7:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/o_out_valid} \
{/test_sram_write/u_core/o_op_ready} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetCursor -win $_nWave1 20919708.400709
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 20573650.596392 -snap {("G1" 8)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetCursor -win $_nWave1 20571866.786521 -snap {("G1" 8)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/o_op_ready} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/mmu_write_channel\[4:0\]} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/mmu_write_x\[3:0\]} \
{/test_sram_write/u_core/mmu_write_y\[3:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/i_in_data\[7:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/o_out_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 9 10 11 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/o_op_ready} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/mmu_write_channel\[4:0\]} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/mmu_write_x\[3:0\]} \
{/test_sram_write/u_core/mmu_write_y\[3:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/i_in_data\[7:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/o_out_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 9 10 11 12 13 14 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 10 11 12 13 14 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 10 11 12 13 14 15 )} 
wvSetRadix -win $_nWave1 -format UDec
wvZoomOut -win $_nWave1
wvSelectGroup -win $_nWave1 {G2}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core/mmu0/iConv0"
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/o_op_ready} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/mmu_write_x\[3:0\]} \
{/test_sram_write/u_core/mmu_write_y\[3:0\]} \
{/test_sram_write/u_core/mmu_write_channel\[4:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/i_in_data\[7:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/o_out_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test_sram_write/u_core/mmu0/iConv0/i_channel\[4:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_x\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_y\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_bank_select} \
{/test_sram_write/u_core/mmu0/iConv0/o_index\[7:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_sram_select\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/o_op_ready} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/mmu_write_x\[3:0\]} \
{/test_sram_write/u_core/mmu_write_y\[3:0\]} \
{/test_sram_write/u_core/mmu_write_channel\[4:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/i_in_data\[7:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/o_out_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test_sram_write/u_core/mmu0/iConv0/i_channel\[4:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_x\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_y\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_bank_select} \
{/test_sram_write/u_core/mmu0/iConv0/o_index\[7:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_sram_select\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G2" 6)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 3 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSaveSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/test_write_mmu.rc"
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/origin_and_scale.fsdb}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvRestoreSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/origin_and_scale.rc" \
           -overWriteAutoAlias on -appendSignals on
wvCloseFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvTpfCloseForm -win $_nWave1
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/origin_and_scale.fsdb}
wvRestoreSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/origin_and_scale.rc" \
           -overWriteAutoAlias on -appendSignals on
wvSetCursor -win $_nWave1 723047.549695 -snap {("G1" 1)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvCloseFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvTpfCloseForm -win $_nWave1
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/write_mmu.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write"
wvRestoreSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/test_write_mmu.rc" \
           -overWriteAutoAlias on -appendSignals on
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 20916106.489945
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/o_op_ready} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/mmu_write_x\[3:0\]} \
{/test_sram_write/u_core/mmu_write_y\[3:0\]} \
{/test_sram_write/u_core/mmu_write_channel\[4:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/i_in_data\[7:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/o_out_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test_sram_write/u_core/mmu0/iConv0/i_x\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_y\[3:0\]} \
{/test_sram_write/u_core/current_output_valid_result} \
{/test_sram_write/u_core/last_last_output_valid_result} \
{/test_sram_write/u_core/last_output_valid_result} \
{/test_sram_write/u_core/mmu0/iConv0/i_channel\[4:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_bank_select} \
{/test_sram_write/u_core/mmu0/iConv0/o_index\[7:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_sram_select\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 23)}
wvSelectSignal -win $_nWave1 {( "G1" 21 )} 
wvSelectSignal -win $_nWave1 {( "G1" 23 )} 
wvSelectSignal -win $_nWave1 {( "G1" 21 )} 
wvSetCursor -win $_nWave1 20911198.850965
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core/mmu0"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvSetPosition -win $_nWave1 {("G1" 24)}
wvSetPosition -win $_nWave1 {("G1" 24)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/o_op_ready} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/mmu_write_x\[3:0\]} \
{/test_sram_write/u_core/mmu_write_y\[3:0\]} \
{/test_sram_write/u_core/mmu_write_channel\[4:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/i_in_data\[7:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/o_out_valid} \
{/test_sram_write/u_core/current_output_valid_result} \
{/test_sram_write/u_core/last_last_output_valid_result} \
{/test_sram_write/u_core/last_output_valid_result} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test_sram_write/u_core/mmu0/iConv0/i_x\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_y\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_channel\[4:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_bank_select} \
{/test_sram_write/u_core/mmu0/iConv0/o_index\[7:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_sram_select\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 24 )} 
wvSetPosition -win $_nWave1 {("G1" 24)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 24)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 24)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/o_op_ready} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/mmu_write_x\[3:0\]} \
{/test_sram_write/u_core/mmu_write_y\[3:0\]} \
{/test_sram_write/u_core/mmu_write_channel\[4:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/i_in_data\[7:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/o_out_valid} \
{/test_sram_write/u_core/current_output_valid_result} \
{/test_sram_write/u_core/last_last_output_valid_result} \
{/test_sram_write/u_core/last_output_valid_result} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/count_counter0} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test_sram_write/u_core/mmu0/iConv0/i_x\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_y\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_channel\[4:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_bank_select} \
{/test_sram_write/u_core/mmu0/iConv0/o_index\[7:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_sram_select\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/o_op_ready} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/mmu_write_x\[3:0\]} \
{/test_sram_write/u_core/mmu_write_y\[3:0\]} \
{/test_sram_write/u_core/mmu_write_channel\[4:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/i_in_data\[7:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/o_out_valid} \
{/test_sram_write/u_core/current_output_valid_result} \
{/test_sram_write/u_core/last_last_output_valid_result} \
{/test_sram_write/u_core/last_output_valid_result} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/count_counter0} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test_sram_write/u_core/mmu0/iConv0/i_x\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_y\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_channel\[4:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_bank_select} \
{/test_sram_write/u_core/mmu0/iConv0/o_index\[7:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_sram_select\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSetPosition -win $_nWave1 {("G1" 25)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 24 25 )} 
wvSelectSignal -win $_nWave1 {( "G1" 24 25 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetPosition -win $_nWave1 {("G1" 22)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 22)}
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 23)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 23)}
wvSetPosition -win $_nWave1 {("G1" 24)}
wvSelectSignal -win $_nWave1 {( "G1" 22 )} 
wvSetCursor -win $_nWave1 20908848.713991
wvSetCursor -win $_nWave1 20907328.037125
wvSetCursor -win $_nWave1 20912304.797776
wvSetCursor -win $_nWave1 20909263.444045
wvSetCursor -win $_nWave1 20912719.527831
wvSetCursor -win $_nWave1 20914516.691399
wvSetCursor -win $_nWave1 20910645.877559
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core/mmu0"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvSetPosition -win $_nWave1 {("G1" 26)}
wvSetPosition -win $_nWave1 {("G1" 26)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/o_op_ready} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/mmu_write_x\[3:0\]} \
{/test_sram_write/u_core/mmu_write_y\[3:0\]} \
{/test_sram_write/u_core/mmu_write_channel\[4:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/i_in_data\[7:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/o_out_valid} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/count_counter0} \
{/test_sram_write/u_core/current_output_valid_result} \
{/test_sram_write/u_core/last_output_valid_result} \
{/test_sram_write/u_core/mmu_write_data\[7:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/last_last_output_valid_result} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test_sram_write/u_core/mmu0/iConv0/i_x\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_y\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_channel\[4:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_bank_select} \
{/test_sram_write/u_core/mmu0/iConv0/o_index\[7:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_sram_select\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 25 26 )} 
wvSetPosition -win $_nWave1 {("G1" 26)}
wvSetPosition -win $_nWave1 {("G1" 26)}
wvSetPosition -win $_nWave1 {("G1" 26)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/o_op_ready} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/mmu_write_x\[3:0\]} \
{/test_sram_write/u_core/mmu_write_y\[3:0\]} \
{/test_sram_write/u_core/mmu_write_channel\[4:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/i_in_data\[7:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/o_out_valid} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/count_counter0} \
{/test_sram_write/u_core/current_output_valid_result} \
{/test_sram_write/u_core/last_output_valid_result} \
{/test_sram_write/u_core/mmu_write_data\[7:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/last_last_output_valid_result} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test_sram_write/u_core/mmu0/iConv0/i_x\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_y\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_channel\[4:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_bank_select} \
{/test_sram_write/u_core/mmu0/iConv0/o_index\[7:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_sram_select\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 25 26 )} 
wvSetPosition -win $_nWave1 {("G1" 26)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSelectSignal -win $_nWave1 {( "G1" 26 )} 
wvSelectSignal -win $_nWave1 {( "G1" 26 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 26 )} 
wvExpandBus -win $_nWave1
wvSetCursor -win $_nWave1 20909539.930748
wvSetCursor -win $_nWave1 20911337.094316
wvSelectSignal -win $_nWave1 {( "G1" 26 )} 
wvSetPosition -win $_nWave1 {("G1" 26)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 26)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core/mmu0"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvSetPosition -win $_nWave1 {("G1" 27)}
wvSetPosition -win $_nWave1 {("G1" 27)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/o_op_ready} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/mmu_write_x\[3:0\]} \
{/test_sram_write/u_core/mmu_write_y\[3:0\]} \
{/test_sram_write/u_core/mmu_write_channel\[4:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/i_in_data\[7:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/o_out_valid} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/count_counter0} \
{/test_sram_write/u_core/current_output_valid_result} \
{/test_sram_write/u_core/last_output_valid_result} \
{/test_sram_write/u_core/mmu_write_data\[7:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/data_for_output\[13:0\]} \
{/test_sram_write/u_core/last_last_output_valid_result} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test_sram_write/u_core/mmu0/iConv0/i_x\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_y\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_channel\[4:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_bank_select} \
{/test_sram_write/u_core/mmu0/iConv0/o_index\[7:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_sram_select\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 27 )} 
wvSetPosition -win $_nWave1 {("G1" 27)}
wvSetPosition -win $_nWave1 {("G1" 27)}
wvSetPosition -win $_nWave1 {("G1" 27)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_sram_write/u_core/i_clk} \
{/test_sram_write/u_core/o_op_ready} \
{/test_sram_write/u_core/current_state\[4:0\]} \
{/test_sram_write/u_core/next_state\[4:0\]} \
{/test_sram_write/u_core/mmu_ready} \
{/test_sram_write/u_core/counter_x_value\[3:0\]} \
{/test_sram_write/u_core/counter_y_value\[3:0\]} \
{/test_sram_write/u_core/counter_channel_value\[4:0\]} \
{/test_sram_write/u_core/mmu_read_x\[3:0\]} \
{/test_sram_write/u_core/mmu_read_y\[3:0\]} \
{/test_sram_write/u_core/mmu_read_bank} \
{/test_sram_write/u_core/mmu_write_enable} \
{/test_sram_write/u_core/mmu_write_x\[3:0\]} \
{/test_sram_write/u_core/mmu_write_y\[3:0\]} \
{/test_sram_write/u_core/mmu_write_channel\[4:0\]} \
{/test_sram_write/u_core/i_op_mode\[3:0\]} \
{/test_sram_write/u_core/i_rst_n} \
{/test_sram_write/u_core/i_in_data\[7:0\]} \
{/test_sram_write/u_core/o_out_data\[13:0\]} \
{/test_sram_write/u_core/o_out_valid} \
{/test_sram_write/u_core/counter0_value\[11:0\]} \
{/test_sram_write/u_core/count_counter0} \
{/test_sram_write/u_core/current_output_valid_result} \
{/test_sram_write/u_core/last_output_valid_result} \
{/test_sram_write/u_core/mmu_write_data\[7:0\]} \
{/test_sram_write/u_core/sram_data\[0:15\]} \
{/test_sram_write/u_core/data_for_output\[13:0\]} \
{/test_sram_write/u_core/last_last_output_valid_result} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test_sram_write/u_core/mmu0/iConv0/i_x\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_y\[3:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/i_channel\[4:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_bank_select} \
{/test_sram_write/u_core/mmu0/iConv0/o_index\[7:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_sram_select\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 27 )} 
wvSetPosition -win $_nWave1 {("G1" 27)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 27 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetPosition -win $_nWave1 {("G1" 23)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvZoomIn -win $_nWave1
