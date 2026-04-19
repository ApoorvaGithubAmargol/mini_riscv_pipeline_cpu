#8 BIT RISC V BASED PROCESSOR

Project Overview

This project is a simple 8-bit RISC-style processor designed in Verilog HDL. The processor follows a simplified pipelined architecture inspired by RISC-V concepts such as instruction fetch, decode, execute, memory access, and writeback.

The goal of this project is to understand how a processor works internally and how pipelining improves performance by allowing multiple instructions to be processed at the same time.


Features
8-bit processor datapath
Program Counter (PC)
Instruction Memory
Register File
Arithmetic Logic Unit (ALU)
Control Unit
Data Memory
Pipeline Registers:
IF/ID
ID/EX
EX/MEM
MEM/WB
Basic LOAD and STORE support
ALU operations:
ADD
SUB
AND
OR
XOR
GTKWave waveform verification
Testbench for simulation


Processor Pipeline Stages
1. Instruction Fetch (IF)
Program Counter generates instruction address
Instruction is fetched from Instruction Memory
Instruction and PC are stored in IF/ID register
2. Instruction Decode (ID)
Opcode is decoded by Control Unit
Register File reads source operands
Control signals are generated
Data is stored in ID/EX register
3. Execute (EX)
ALU performs required operation
Arithmetic and logical results are generated
Output is stored in EX/MEM register
4. Memory Access (MEM)
Data Memory performs LOAD or STORE operations
Memory data is stored in MEM/WB register
5. Write Back (WB)
Result is written back into Register File
Either ALU result or Memory result is selected


