# 8-bit Pipelined RISC CPU in Verilog

![Verilog](https://img.shields.io/badge/Language-Verilog-blue)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Simulation](https://img.shields.io/badge/Simulated%20on-GTKWave-orange)
![Toolchain](https://img.shields.io/badge/Toolchain-Icarus%20Verilog-lightgrey)

---
This project was done as part of an internship under Nexus Core Innovations Submitted by **Apoorva amargol 1MV22EC127**
---
##  Project Overview

This project implements a **custom 8-bit RISC-style processor** using **Verilog HDL**.

> **Important:** This is **NOT a RISC-V processor**.  
> It is a **custom Instruction Set Architecture (ISA)** inspired by core RISC principles:
- Simplicity  
- Fixed instruction format  
- Pipelined execution  

The processor uses a **5-stage pipeline**.

---

## Pipeline Architecture

![Pipeline](https://raw.githubusercontent.com/ApoorvaGithubAmargol/mini_riscv_pipeline_cpu/main/git_images_/pipeline.png)

---

## ⚙️ Key Features

- Custom 8-bit ISA (Non RISC-V)
- 5-stage pipelined architecture  
- Modular Verilog design  
- Separate instruction & data memory  
- Register file with read/write support  
- ALU supporting multiple operations  
- Load and Store instructions  
- Pipeline registers:
  - IF/ID  
  - ID/EX  
  - EX/MEM  
  - MEM/WB  
- Verified using GTKWave  

---

## Architecture Breakdown

### IF (Instruction Fetch)
- Program Counter (PC) generates address  
- Instruction fetched from instruction memory  
- Stored in IF/ID  

### ID (Instruction Decode)
- Instruction decoded  
- Control signals generated  
- Register file read  

### EX (Execute)
- ALU performs operations  

### MEM (Memory)
- LOAD / STORE operations  

### WB (Write Back)
- Result written back to register file  

---

##  Instruction Format
[7:4] Opcode
[3:2] Register 1 / Destination
[1:0] Register 2


---

## Supported Instructions

| Opcode | Operation |
|--------|----------|
| 0001 | ADD |
| 0010 | SUB |
| 0011 | AND |
| 0100 | OR |
| 0101 | XOR |
| 0110 | LOAD |
| 0111 | STORE |

---

## Project Structure
risc_project/

│── README.md

│── src_r/

│ ├── alu.v

│ ├── cpu_top.v

│ ├── cu.v

│ ├── data_mem.v

│ ├── ex_mem_reg.v

│ ├── id_ex_reg.v

│ ├── if_id_reg.v

│ ├── instruction_mem.v

│ ├── mem_wb_reg.v

│ ├── pc.v

│ └── register_file.v

│── tbr/

│ └── cpu_tb.v

│── cpu_out (ignored)

│── cpu.vcd (ignored)



---

##  Simulation Instructions

###  Compile

```bash
iverilog -o cpu_out \
src_r/pc.v \
src_r/instruction_mem.v \
src_r/register_file.v \
src_r/alu.v \
src_r/cu.v \
src_r/data_mem.v \
src_r/if_id_reg.v \
src_r/id_ex_reg.v \
src_r/ex_mem_reg.v \
src_r/mem_wb_reg.v \
src_r/cpu_top.v \
tbr/cpu_tb.v
```

### Run
```bash
vvp cpu_out
```

### View Waveforms
```bash
gtkwave cpu.vcd
```
---

## GTKWave Output

### Highlights

Custom ISA
Clean pipeline implementation
Beginner-friendly design
Clear visualization using GTKWave

### Future Work
Hazard detection
Forwarding
Branch & jump support
16/32-bit scaling

### Tools
Verilog
Icarus Verilog
GTKWave
VS Code
GitHub

### Learning Outcome
CPU datapath design
Pipeline execution
Control signal flow
Memory interaction
