-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/unisims/unisim/VITAL/LDP_1.vhd,v 1.2 2008/11/03 21:16:44 yanx Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Transparent Data Latch with Asynchronous Preset and Inverted Gate
-- /___/   /\     Filename : LDP_1.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:56:01 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    11/03/08 - Initial Q. CR49409
-- End Revision

----- CELL LDP_1 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity LDP_1 is
  generic(
    INIT : bit := '1'
    );

  port(
    Q : out std_ulogic;

    D   : in std_ulogic;
    G   : in std_ulogic;
    PRE : in std_ulogic
    );
end LDP_1;

architecture LDP_1_V of LDP_1 is
  signal q_o : std_ulogic := TO_X01(INIT);
begin
 
  Q <=  q_o;
  VITALBehavior : process(D, G, PRE)
  begin
    if (PRE = '1') then
      q_o <= '1';
    elsif (G = '0') then
      q_o <= D after 100 ps;        
    end if;
  end process;
end LDP_1_V;


