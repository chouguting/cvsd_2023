verdiSetActWin -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/write_mmu.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write"
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvGetSignalClose -win $_nWave1
wvRestoreSignal -win $_nWave1 \
           "/home/raid7_2/user12/r2921a01/hw/hw3/1121_hw3/01_RTL/test_write_mmu.rc" \
           -overWriteAutoAlias on -appendSignals on
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
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_sram_write/u_core"
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
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
{/test_sram_write/u_core/i_op_valid} \
{/test_sram_write/u_core/mmu0/iConv0/i_channel\[4:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_bank_select} \
{/test_sram_write/u_core/mmu0/iConv0/o_index\[7:0\]} \
{/test_sram_write/u_core/mmu0/iConv0/o_sram_select\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 10679817.763027
wvSetCursor -win $_nWave1 10686953.002510
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
