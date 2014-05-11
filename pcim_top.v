/***********************************************************************

  File:   pcim_top.v
  Rev:    3.1.166

  This is the top-level template file for Verilog designs.

  Copyright (c) 2005-2008 Xilinx, Inc.  All rights reserved.

***********************************************************************/


module pcim_top (
                AD,             // PCI ports -- do not modify names!
                CBE,
                PAR,
                FRAME_N,
                TRDY_N,
                IRDY_N,
                STOP_N,
                DEVSEL_N,
                IDSEL,
                INTR_A,
                PERR_N,
                SERR_N,
                REQ_N,
                GNT_N,
                RST_N,
                PCLK,
                PING_DONE,      // Add user ports here
                PING_REQUEST32
                );
                // synthesis attribute syn_edif_bit_format = "%u<%i>"
                // synthesis attribute syn_edif_scalar_format = "%u"
                // synthesis attribute syn_noclockbuf = 1
                // synthesis attribute syn_hier = "hard"


  inout  [31:0] AD;             // PCI ports -- do not modify names!
  inout   [3:0] CBE;
  inout         PAR;
  inout         FRAME_N;
  inout         TRDY_N;
  inout         IRDY_N;
  inout         STOP_N;
  inout         DEVSEL_N;
  input         IDSEL;
  output        INTR_A;
  inout         PERR_N;
  inout         SERR_N;
  output        REQ_N;
  input         GNT_N;
  input         RST_N;
  input         PCLK;
  output        PING_DONE;      // Add user ports here
  input         PING_REQUEST32;


  // Internal buses -- do not modify names!

  wire  [255:0] CFG;
  wire   [31:0] ADDR;
  wire   [31:0] ADIO;
  wire    [7:0] BASE_HIT;
  wire    [3:0] S_CBE;
  wire   [15:0] PCI_CMD;
  wire    [3:0] M_CBE;
  wire   [39:0] CSR;
  wire   [31:0] SUB_DATA;


  // Instantiation of PCI Interface -- do not modify names!

  pcim_lc PCI_CORE (
                .AD_IO ( AD ),
                .CBE_IO ( CBE ),
                .PAR_IO ( PAR ),
                .FRAME_IO ( FRAME_N ),
                .TRDY_IO ( TRDY_N ),
                .IRDY_IO ( IRDY_N ),
                .STOP_IO ( STOP_N ),
                .DEVSEL_IO ( DEVSEL_N ),
                .IDSEL_I ( IDSEL ),
                .INTA_O ( INTR_A ),
                .PERR_IO ( PERR_N ),
                .SERR_IO ( SERR_N ),
                .REQ_O ( REQ_N ),
                .GNT_I ( GNT_N ),
                .RST_I ( RST_N ),
                .PCLK ( PCLK ),
                .FRAMEQ_N ( FRAMEQ_N ),
                .TRDYQ_N ( TRDYQ_N ),
                .IRDYQ_N ( IRDYQ_N ),
                .STOPQ_N ( STOPQ_N ),
                .DEVSELQ_N ( DEVSELQ_N ),
                .ADDR ( ADDR ),
                .ADIO ( ADIO ),
                .CFG_VLD ( CFG_VLD ),
                .CFG_HIT ( CFG_HIT ),
                .C_TERM ( C_TERM ),
                .C_READY ( C_READY ),
                .ADDR_VLD ( ADDR_VLD ),
                .BASE_HIT ( BASE_HIT ),
                .S_TERM ( S_TERM ),
                .S_READY ( S_READY ),
                .S_ABORT ( S_ABORT ),
                .S_WRDN ( S_WRDN ),
                .S_SRC_EN ( S_SRC_EN ),
                .S_DATA_VLD ( S_DATA_VLD ),
                .S_CBE ( S_CBE ),
                .PCI_CMD ( PCI_CMD ),
                .REQUEST ( REQUEST ),
                .REQUESTHOLD ( REQUESTHOLD ),
                .COMPLETE ( COMPLETE ),
                .M_WRDN ( M_WRDN ),
                .M_READY ( M_READY ),
                .M_SRC_EN ( M_SRC_EN ),
                .M_DATA_VLD ( M_DATA_VLD ),
                .M_CBE ( M_CBE ),
                .TIME_OUT ( TIME_OUT ),
                .CFG_SELF ( CFG_SELF ),
                .M_DATA ( M_DATA ),
                .DR_BUS ( DR_BUS ),
                .I_IDLE ( I_IDLE ),
                .M_ADDR_N ( M_ADDR_N ),
                .IDLE ( IDLE ),
                .B_BUSY ( B_BUSY ),
                .S_DATA ( S_DATA ),
                .BACKOFF ( BACKOFF ),
                .INTR_N ( INTR_N ),
                .PERRQ_N ( PERRQ_N ),
                .SERRQ_N ( SERRQ_N ),
                .KEEPOUT ( KEEPOUT ),
                .CSR ( CSR ),
                .SUB_DATA ( SUB_DATA ),
                .CFG ( CFG ),
                .RST ( RST ),
                .CLK ( CLK )
                );


  // Instantiation of the configuration module

  cfg CFG_INST (
                .CFG ( CFG )
                );


  // Instantiation of userapp back-end application template

  ping32 PING32_INST (
                .FRAMEQ_N ( FRAMEQ_N ),
                .TRDYQ_N ( TRDYQ_N ),
                .IRDYQ_N ( IRDYQ_N ),
                .STOPQ_N ( STOPQ_N ),
                .DEVSELQ_N ( DEVSELQ_N ),
                .ADDR ( ADDR ),
                .ADIO ( ADIO ),
                .CFG_VLD ( CFG_VLD ),
                .CFG_HIT ( CFG_HIT ),
                .C_TERM ( C_TERM ),
                .C_READY ( C_READY ),
                .ADDR_VLD ( ADDR_VLD ),
                .BASE_HIT ( BASE_HIT ),
                .S_TERM ( S_TERM ),
                .S_READY ( S_READY ),
                .S_ABORT ( S_ABORT ),
                .S_WRDN ( S_WRDN ),
                .S_SRC_EN ( S_SRC_EN ),
                .S_DATA_VLD ( S_DATA_VLD ),
                .S_CBE ( S_CBE ),
                .PCI_CMD ( PCI_CMD ),
                .REQUEST ( REQUEST ),
                .REQUESTHOLD ( REQUESTHOLD ),
                .COMPLETE ( COMPLETE ),
                .M_WRDN ( M_WRDN ),
                .M_READY ( M_READY ),
                .M_SRC_EN ( M_SRC_EN ),
                .M_DATA_VLD ( M_DATA_VLD ),
                .M_CBE ( M_CBE ),
                .TIME_OUT ( TIME_OUT ),
                .CFG_SELF ( CFG_SELF ),
                .M_DATA ( M_DATA ),
                .DR_BUS ( DR_BUS ),
                .I_IDLE ( I_IDLE ),
                .M_ADDR_N ( M_ADDR_N ),
                .IDLE ( IDLE ),
                .B_BUSY ( B_BUSY ),
                .S_DATA ( S_DATA ),
                .BACKOFF ( BACKOFF ),
                .INTR_N ( INTR_N ),
                .PERRQ_N ( PERRQ_N ),
                .SERRQ_N ( SERRQ_N ),
                .KEEPOUT ( KEEPOUT ),
                .CSR ( CSR ),
                .SUB_DATA ( SUB_DATA ),
                .CFG ( CFG ),
                .RST ( RST ),
                .CLK ( CLK ),
                .PING_DONE( PING_DONE ),
                .PING_REQUEST32( PING_REQUEST32 )
                );


endmodule
