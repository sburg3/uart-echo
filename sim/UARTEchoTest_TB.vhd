----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/31/2015 03:36:46 PM
-- Design Name: 
-- Module Name: UARTEchoTest_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UARTEchoTest_TB is
--  Port ( );
end UARTEchoTest_TB;

architecture Behavioral of UARTEchoTest_TB is
component UARTEchoTest is
    Port ( CLK100MHZ : in STD_LOGIC;
           UART_TXD_IN : in STD_LOGIC;
           UART_RXD_OUT : out STD_LOGIC);
end component;

signal clk_100 : std_logic := '0';
signal rx : std_logic := '0';
signal tx : std_logic := '1';

constant BAUD : time := 104.17us;

begin

uet0 : UARTEchoTest
port map (
    CLK100MHZ => clk_100,
    UART_TXD_IN => tx,
    UART_RXD_OUT => rx
);

clk_100 <= not clk_100 after 5 ns;

process
begin
    wait for 20us;
    tx <= '0';
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    tx <= '0';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    tx <= '0';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    tx <= '0';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    tx <= '0';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    --wait for 200us;
    tx <= '0';
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    --wait for 200us;
    tx <= '0';
    wait for BAUD;
    tx <= '0';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    tx <= '0';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    tx <= '0';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    tx <= '1';   
    wait for BAUD;
    wait for 2000 us;
    assert false report "Simulation Ended" severity failure;
end process;
end Behavioral;
