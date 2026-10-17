# Verilog RISC Processor Architecture Prototype v3

[![Language: SystemVerilog](https://img.shields.io/badge/Language-SystemVerilog%2FVerilog-blue.svg)](https://en.wikipedia.org/wiki/SystemVerilog)
[![Tool: AMD Vivado](https://img.shields.io/badge/Tool-AMD%2FXilinx%20Vivado-orange.svg)](https://www.xilinx.com/products/design-tools/vivado.html)
[![Domain: FPGA Design](https://img.shields.io/badge/Domain-FPGA%20%26%20Digital%20Design-green.svg)]()
[![Author: Mohammad Usman Irshad](https://img.shields.io/badge/Author-Mohammad%20Usman%20Irshad-purple.svg)](https://github.com/usman-irshad1)

## Executive Summary
**Verilog RISC Processor Architecture Prototype v3** is a **Advanced CPU Prototypes** project implemented in SystemVerilog/Verilog and verified using AMD/Xilinx Vivado Simulator.

Advanced RISC processor architecture prototype featuring Immediate Extender, Register Controller, and ALU Decoder.

---

## Architectural Block Diagram

```mermaid
graph TD
    Inst[Instruction Fetch] --> Imm[Immediate Generator]
    Inst --> RegCon[Register Controller]
    RegCon --> RF[Register File]
    RF --> ALU[32-Bit ALU]
    ALU --> Writeback[Writeback Logic]
```

---

## Core Key Features & Highlights

- Flexible Immediate Extender Unit (`imm.sv`).
- Register Control unit (`register_con.sv`, `rfg.sv`).
- Comprehensive top integration (`Top.sv`).

---

## Source Code & Module Index

| File Name | Module Name | Key Interface Signals |
| :--- | :--- | :--- |
| `imm.sv` | `immediate_gen` | `ins` (input), `output logic` (input) |
| `pc.sv` | `program_counter` | `pc` (output), `input  logic` (output), `clock` (input) |
| `pc_4.sv` | `pc_adder` | `pc` (input), `output logic` (input) |
| `ins_file.mem` | `ins_file.mem` | Internal Module / Support File |
| `reg.mem` | `reg.mem` | Internal Module / Support File |
| `register_con.sv` | `Generic_pipeline_reg_reg` | `opcode` (input), `output logic` (input), `pc` (input) |
| `alu.sv` | `ALU` | `ALU_control` (input), `input logic` (input), `data2` (input) |
| `alu.v` | `ALU` | `ALU_control` (input), `input logic` (input), `data2` (input) |
| `mux_1.sv` | `MUX_1` | `data_from_reg2` (input), `input logic` (input), `data2` (output) |
| `mux_1.v` | `mux_1` | Internal Module / Support File |
| `Alou_cont.sv` | `alu_control` | `ALU_op` (input), `input logic` (input), `fun11` (input) |
| `inst.sv` | `Instruction_memory` | `pc_byte_address` (input), `output logic` (input), `r2` (output) |
| `rfg.sv` | `Control_unit` | `opcode` (input), `output logic memread` (input), `output logic memwrite` (input) |
| `rh.v` | `rh` | Internal Module / Support File |
| `ytrd.sv` | `reg_file` | `rd` (input), `input logic` (input), `r1` (input) |
| `Top.sv` | `top` | `clock` (input), `input  logic        reset` (input), `output logic` (input) |
| `tb.sv` | `top_tb` | Internal Module / Support File |

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
