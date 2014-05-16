@echo off

set XVKMA_CORE_LUT_PACK=TRUE
set XIL_PAR_MAX_PLOAD=100
set XIL_GUIDE_CONNECTRPT=1
set XIL_MAP_OLD_SAVE=1

%XILINX%\bin\nt\ngdbuild -uc .\2s050pq208_32_33.ucf cnc_top_ila

%XILINX%\bin\nt\map -pr b cnc_top_ila.ngd -o cnc_top_ila.ncd cnc_top_ila.pcf

%XILINX%\bin\nt\par -ol high -w cnc_top_ila.ncd cnc_top_ila_routed cnc_top_ila.pcf

%XILINX%\bin\nt\trce -v 10 cnc_top_ila_routed.ncd cnc_top_ila.pcf

%XILINX%\bin\nt\netgen -ofmt verilog -w cnc_top_ila_routed.ncd

%XILINX%\bin\nt\bitgen -w -g startupclk:cclk cnc_top_ila_routed.ncd cnc_top_ila cnc_top_ila.pcf
rem %XILINX%\bin\nt\promgen -p mcs -x xcf32p -c 0xFF -w -o bitstream_cclk.mcs -u 0 bitstream_cclk.bit
