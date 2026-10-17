# Custom RISC Processor Hardware Building Blocks

[![Language: SystemVerilog](https://img.shields.io/badge/Language-SystemVerilog%2FVerilog-blue.svg)](https://en.wikipedia.org/wiki/SystemVerilog)
[![Tool: AMD Vivado](https://img.shields.io/badge/Tool-AMD%2FXilinx%20Vivado-orange.svg)](https://www.xilinx.com/products/design-tools/vivado.html)
[![Domain: FPGA Design](https://img.shields.io/badge/Domain-FPGA%20%26%20Digital%20Design-green.svg)]()
[![Author: Mohammad Usman Irshad](https://img.shields.io/badge/Author-Mohammad%20Usman%20Irshad-purple.svg)](https://github.com/usman-irshad1)

## Executive Summary
**Custom RISC Processor Hardware Building Blocks** is a **Custom Processor Engineering** project implemented in SystemVerilog/Verilog and verified using AMD/Xilinx Vivado Simulator.

Comprehensive suite of custom processor modules including Instruction Memory, Register File, Adder, and ALU.

---

## Architectural Block Diagram

```mermaid
graph TD
    PC[Program Counter] --> Adder[PC+4 Adder]
    PC --> IM[Instruction Memory]
    IM --> RF[Register File]
    RF --> ALU[ALU Core]
    ALU --> Top[Processor Integration]
```

---

## Core Key Features & Highlights

- Hex memory file initialization (`ins_file.mem`, `regfile.mem`).
- Custom processor top integration module (`custom_processor_1.sv`).
- Individual component testbenches (`alu_tb.sv`, `reg_tb.sv`, `top_tb.sv`).

---

## Source Code & Module Index

| File Name | Module Name | Key Interface Signals |
| :--- | :--- | :--- |
| `ins_file.mem` | `ins_file.mem` | Internal Module / Support File |
| `regfile.mem` | `regfile.mem` | Internal Module / Support File |
| `Instruction_memory.sv` | `Instruction_memory` | `pc` (input), `output logic` (input), `r2` (output) |
| `reg_tb.sv` | `reg_tb` | Internal Module / Support File |
| `alu_tb.sv` | `alu_tb` | Internal Module / Support File |
| `adder.sv` | `ALU` | `opcode` (input), `input  logic` (input), `r2` (input) |
| `custom_processor_1.sv` | `reg_file` | `r3` (output), `input logic` (output), `c2` (input) |
| `program_counter.sv` | `program_counter` | `pc` (output), `input  logic clock` (output), `input  logic reset` (output) |
| `top_tb.sv` | `top_tb` | Internal Module / Support File |
| `top.sv` | `top` | `clock` (input), `input logic reset` (input), `output logic` (input) |
| `ins_testbench.sv` | `ins_testbench` | Internal Module / Support File |

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
