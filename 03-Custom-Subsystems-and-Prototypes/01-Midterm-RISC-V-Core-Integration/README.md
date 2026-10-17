# RISC-V Midterm Processor Core Design

[![Language: SystemVerilog](https://img.shields.io/badge/Language-SystemVerilog%2FVerilog-blue.svg)](https://en.wikipedia.org/wiki/SystemVerilog)
[![Tool: AMD Vivado](https://img.shields.io/badge/Tool-AMD%2FXilinx%20Vivado-orange.svg)](https://www.xilinx.com/products/design-tools/vivado.html)
[![Domain: FPGA Design](https://img.shields.io/badge/Domain-FPGA%20%26%20Digital%20Design-green.svg)]()
[![Author: Mohammad Usman Irshad](https://img.shields.io/badge/Author-Mohammad%20Usman%20Irshad-purple.svg)](https://github.com/usman-irshad1)

## Executive Summary
**RISC-V Midterm Processor Core Design** is a **CPU Core Engineering** project implemented in SystemVerilog/Verilog and verified using AMD/Xilinx Vivado Simulator.

32-bit RISC-V processor datapath featuring instruction memory, register file, ALU decoder, and control unit.

---

## Architectural Block Diagram

```mermaid
graph TD
    PC[PC Unit] --> IMEM[Instruction Memory]
    IMEM --> DEC[Control & ALU Decoder]
    DEC --> RF[Register File]
    RF --> ALU[32-bit ALU]
    ALU --> DMEM[Data Memory]
```

---

## Core Key Features & Highlights

- Full datapath integration including Instruction Memory and Register Bank.
- Support for Memory Initialization (`mid.mem`, `reg_mid.mem`).
- Comprehensive top-level testbench (`top_tb.sv`).

---

## Source Code & Module Index

| File Name | Module Name | Key Interface Signals |
| :--- | :--- | :--- |
| `mid.mem` | `mid.mem` | Internal Module / Support File |
| `reg.mem` | `reg.mem` | Internal Module / Support File |
| `reg_mid.mem` | `reg_mid.mem` | Internal Module / Support File |
| `instruction_mem.v` | `instruction_mem` | Internal Module / Support File |
| `reg_file.sv` | `reg_file` | `rd` (input), `input logic` (input), `r1` (input) |
| `reg_mid.sv` | `reg_mid` | Internal Module / Support File |
| `ALU.sv` | `ALU` | `ALU_control` (input), `input  logic` (input), `data2` (input) |
| `ALU_control.sv` | `alu_control` | `ALU_op` (input), `input logic fun21` (input), `input logic` (input) |
| `Control_unit.sv` | `Control_unit` | `opcode` (input), `output logic memread` (input), `output logic memwrite` (input) |
| `ins.sv` | `Instruction_memory` | `pc` (input), `output logic` (input), `r2` (output) |
| `program_counter.sv` | `program_counter` | `pc` (output), `input  logic clock` (output), `input  logic reset` (output) |
| `top_tb.sv` | `top_tb` | Internal Module / Support File |
| `top.sv` | `top` | `clock` (input), `input logic reset` (input), `output logic` (input) |

---

## Hardware Simulation & Verification Guide

### Prerequisites
- **AMD / Xilinx Vivado Design Suite** (2020.1 or newer recommended)
- **ModelSim / Icarus Verilog / GTKWave** (Optional alternative simulators)

### Step-by-Step Execution in Vivado
1. **Open Vivado IDE** and launch a new project.
2. Select **RTL Project** without specifying sources initially.
3. Choose your target FPGA Device (e.g. `xc7a35tcpg236-1` Artix-7 or generic).
4. Click **Add Sources** -> **Add or Create Design Sources** and add all `.sv` / `.v` / `.mem` files from this repository.
5. Set the primary top-level module (e.g. `TOP.sv` / `top.sv`) as **Top Module**.
6. Navigate to **Flow Navigator** -> **Simulation** -> **Run Simulation** -> **Run Behavioral Simulation**.
7. Observe the waveform outputs in `xsim` to confirm state transitions and signal behavior.

---

## Author & Contact Details

Developed and maintained by **Mohammad Usman Irshad**.

* **GitHub Profile**: [@usman-irshad1](https://github.com/usman-irshad1)
* **Email**: [217554659+usman-irshad1@users.noreply.github.com](mailto:217554659+usman-irshad1@users.noreply.github.com)
* **Domain**: Digital Design, Verilog/SystemVerilog HDL, Computer Architecture & RISC-V Processor Cores.
