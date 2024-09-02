library IEEE;
use IEEE.std_logic_1164.all;

entity design is
	port(
    	clk: in std_logic;
        rst: in std_logic
    );
end design;

architecture behavior of design is
    signal wireClk, wireRst, wireBranch, wireZero, wireRegWrite, wireBne, wireBeq, wireMemWR, wireAluSrc: std_logic;
    
    signal wireJumpAddr, wireBranchAddr, wirePcPlus4, wireInst, wireWriteData, wireReadData1, wireReadData2, wireImm, wireResult, wireMemData: std_logic_vector(31 downto 0);
    
    signal wireOpCode, wireFunct: std_logic_vector(5 downto 0);
    
    signal wireAluOp, wireRegDst, wireMemToReg, wireJump: std_logic_vector(1 downto 0);
    
begin
	process(clk,rst)
    	begin
        	wireClk <= clk;
            wireRst <= rst;
    end process;
        
    STAGEFETCH: entity work.fetch port map(
    	clk        => wireClk,
        rst        => wireRst,
        bne		   => wireBne,
        beq		   => wireBeq,
        branch     => wireBranch,
        jump       => wireJump,
        zero       => wireZero,
        readData1  => wireReadData1,
        jumpAddr   => wireJumpAddr,
        branchAddr => wireBranchAddr,
        PCplus4    => wirePcPlus4,
        inst       => wireInst
    );
    COMPONENTCONTROL: entity work.control port map(
        op		 => wireOpCode,
        funct    => wireFunct,
        regDst	 => wireRegDst,
        jump	 => wireJump,
        branch	 => wireBranch,
        bne		 => wireBne,
        beq		 => wireBeq,
        memWR	 => wireMemWR,
        memToReg => wireMemToReg,
        aluOp	 => wireAluOp,
        aluSrc	 => wireAluSrc,
        regWrite => wireRegWrite
    );
    STAGEDECODE: entity work.decode port map(
    	clk        => wireClk,
        rst        => wireRst,
        PCplus4    => wirePcPlus4,
        inst       => wireInst,
        writeData  => wireWriteData,
        regDst     => wireRegDst,
        regWrite   => wireRegWrite,
        opcode     => wireOpCode,
        jumpAddr   => wireJumpAddr,
        readData1  => wireReadData1,
        readData2  => wireReadData2,
        imm        => wireImm,
        funct      => wireFunct
    );
    STAGEEXECUTE: entity work.execute port map(
        pcPlus4		=> wirePcPlus4,
        aluSrc		=> wireAluSrc,
        rd1 	    => wireReadData1,
        rd2			=> wireReadData2,
        imm			=> wireImm,
        funct		=> wireFunct,
        aluOp		=> wireAluOp,
        result 		=> wireResult,
        zero		=> wireZero,
        branchAddr	=> wireBranchAddr
    );
    STAGEMEMACC: entity work.memoryAccess port map(
    	--clk		   => wireClk,
        address    => wireResult,
        memWrite   => wireMemWR,
        writeData  => wireReadData2,
        memoryData => wireMemData
    );
    STAGEWB: entity work.writeback port map(
    	memoryData => wireMemData,
        result     => wireResult,
        PcPlus4    => wirePcPlus4,
        memToReg   => wireMemToReg,
        writeData  => wireWriteData
    );
end behavior;