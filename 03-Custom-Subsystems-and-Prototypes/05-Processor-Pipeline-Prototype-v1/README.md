# Verilog RISC Processor Pipeline Stage Prototype v1

[![Language: SystemVerilog](https://img.shields.io/badge/Language-SystemVerilog%2FVerilog-blue.svg)](https://en.wikipedia.org/wiki/SystemVerilog)
[![Tool: AMD Vivado](https://img.shields.io/badge/Tool-AMD%2FXilinx%20Vivado-orange.svg)](https://www.xilinx.com/products/design-tools/vivado.html)
[![Domain: FPGA Design](https://img.shields.io/badge/Domain-FPGA%20%26%20Digital%20Design-green.svg)]()
[![Author: Mohammad Usman Irshad](https://img.shields.io/badge/Author-Mohammad%20Usman%20Irshad-purple.svg)](https://github.com/usman-irshad1)

## Executive Summary
**Verilog RISC Processor Pipeline Stage Prototype v1** is a **Pipelined CPU Architectures** project implemented in SystemVerilog/Verilog and verified using AMD/Xilinx Vivado Simulator.

Prototype RISC processor pipeline architecture featuring IF/ID Pipeline Registers and PC increment logic.

---

## Architectural Block Diagram

```mermaid
graph LR
    PC[Program Counter] --> Adder[PC+4 Adder]
    PC --> IMEM[Instruction Memory]
    IMEM --> IFID[IF/ID Pipeline Register]
    IFID --> DEC[Instruction Decoder]
```

---

## Core Key Features & Highlights

- Instruction Fetch / Instruction Decode (IF/ID) Pipeline Register stage.
- PC+4 branch increment adder.
- Full top-level testbench (`top_tb.sv`).

---

## Source Code & Module Index

| File Name | Module Name | Key Interface Signals |
| :--- | :--- | :--- |
| `pc.sv` | `program_counter` | `pc` (output), `input  logic` (output), `clock` (input) |
| `pc_4.sv` | `pc_adder` | `pc` (input), `output logic` (input) |
| `ins_file.mem` | `ins_file.mem` | Internal Module / Support File |
| `If_IDReg.sv` | `Generic_pipeline_reg_reg` | `opcode` (input), `output logic` (input), `pc` (input) |
| `ALU.sv` | `ALU` | Internal Module / Support File |
| `mux_1.sv` | `MUX_1` | `data_from_reg2` (input), `input logic` (input), `data2` (output) |
| `ins.sv` | `Instruction_memory` | `pc_byte_address` (input), `output logic` (input), `r2` (output) |
| `top_tb.sv` | `top_tb` | Internal Module / Support File |
| `Top.sv` | `Top` | `clock` (input), `input  logic        reset` (input), `output logic` (input) |

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
