# 🧠 8-bit Pipelined RISC CPU in Verilog

![Verilog](https://img.shields.io/badge/Language-Verilog-blue)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Simulation](https://img.shields.io/badge/Simulated%20on-GTKWave-orange)
![Toolchain](https://img.shields.io/badge/Toolchain-Icarus%20Verilog-lightgrey)

---

## 📌 Project Overview

This project implements a **custom 8-bit RISC-style processor** using **Verilog HDL**.

> ⚠️ **Important:** This is **NOT a RISC-V processor**.  
> It is a **custom Instruction Set Architecture (ISA)** inspired by core RISC principles:
- Simplicity  
- Fixed instruction format  
- Pipelined execution  

The processor uses a **5-stage pipeline**.

---

## 🏗️ Pipeline Architecture

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

## 🧩 Architecture Breakdown

### 🔹 IF (Instruction Fetch)
- Program Counter (PC) generates address  
- Instruction fetched from instruction memory  
- Stored in IF/ID  

### 🔹 ID (Instruction Decode)
- Instruction decoded  
- Control signals generated  
- Register file read  

### 🔹 EX (Execute)
- ALU performs operations  

### 🔹 MEM (Memory)
- LOAD / STORE operations  

### 🔹 WB (Write Back)
- Result written back to register file  

---

## 🧾 Instruction Format
