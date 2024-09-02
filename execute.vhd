-- estagio de execução

library IEEE;
use IEEE.std_logic_1164.all;

entity execute is
	port(
    pcPlus4: 	in std_logic_vector(31 downto 0);
    aluSrc: 	in std_logic;
    rd1: 	    in std_logic_vector(31 downto 0);
    rd2: 		in std_logic_vector(31 downto 0);
    imm: 		in std_logic_vector(31 downto 0);
    funct: 		in std_logic_vector(5 downto 0);
    aluOp: 		in std_logic_vector(1 downto 0);
    result: 	out std_logic_vector(31 downto 0);
    zero: 		out std_logic;
    branchAddr: out std_logic_vector(31 downto 0)
    );
end execute;

architecture behavior of execute is
	signal wireRegB: std_logic_vector(31 downto 0);
    signal wireOpper: std_logic_vector(2 downto 0);
	begin
    	MUXREGB: entity work.mux232 port map (
          d0 => rd2,
          d1 => imm,
          s  => aluSrc,
          y  => wireRegB
        );
        ULA: entity work.alu port map (
        	regA => rd1,
            regB => wireRegB,
            oper => wireOpper,
            result => result,
            zero => zero
        );
        ULACONTROL: entity work.alucontrol port map(
        	AluOP => aluOp,
            funct => funct,
            oper => wireOpper
        );
        ADD32: entity work.adder32 port map (
          a => pcPlus4,
          b => imm sll 2,
          s => branchAddr
        );
    end behavior;