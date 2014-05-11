@echo off
del /f xst
copy %XILINX%\verilog\src\iSE\unisim_comp.v unisim_comp.v
xst -ifn run_xst.cmd -ofn log
