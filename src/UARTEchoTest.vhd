----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/31/2015 03:30:56 PM
-- Design Name: 
-- Module Name: UARTEchoTest - Behavioral
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

entity UARTEchoTest is
    Port ( CLK100MHZ : in STD_LOGIC;
           UART_TXD_IN : in STD_LOGIC;
           UART_RXD_OUT : out STD_LOGIC);
end UARTEchoTest;

architecture Behavioral of UARTEchoTest is

component UARTReceiver is
    Generic ( baud : integer := 9600);
    Port ( UART_TXD_IN : in STD_LOGIC;
           CLK100MHZ : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (7 downto 0);
           data_ready : out STD_LOGIC);
end component;

component UARTTransmitter is
    Generic ( baud : integer := 9600);
    Port ( CLK100MHZ : in STD_LOGIC;
           UART_RXD_OUT : out STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           uart_tx : in STD_LOGIC;
           uart_rdy : out STD_LOGIC);
end component;

signal data_in : std_logic_vector(7 downto 0) := "00000000";
signal data_out : std_logic_vector(7 downto 0) := "00000000";
signal new_data : std_logic := '0';
signal xmit : std_logic := '0';
signal ready : std_logic := '0';

signal state : std_logic := '0';

begin

ur0 : UARTReceiver
port map (
    UART_TXD_IN => UART_TXD_IN,
    CLK100MHZ => CLK100MHZ,
    data_out => data_in,
    data_ready => new_data
);

ut0 : UARTTransmitter
port map (
    CLK100MHZ => CLK100MHZ,
    UART_RXD_OUT => UART_RXD_OUT,
    data_in => data_out,
    uart_tx => xmit,
    uart_rdy => ready
);

process(CLK100MHZ)
begin
    if rising_edge(CLK100MHZ) then
        if state = '0' then
            xmit <= '0';
            data_out <= "00000000";
            if new_data = '1' then
                data_out <= data_in;
                state <= '1';
            end if;
        else
            data_out <= data_out;
            if ready = '1' then
                xmit <= '1';
                state <= '0';
            end if;
        end if;
    end if;
end process;
end Behavioral;
