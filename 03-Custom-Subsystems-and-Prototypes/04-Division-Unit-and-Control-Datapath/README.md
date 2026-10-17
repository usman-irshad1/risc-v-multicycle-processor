# Verilog Custom Control Unit, Division Unit & Memory Datapath

[![Language: SystemVerilog](https://img.shields.io/badge/Language-SystemVerilog%2FVerilog-blue.svg)](https://en.wikipedia.org/wiki/SystemVerilog)
[![Tool: AMD Vivado](https://img.shields.io/badge/Tool-AMD%2FXilinx%20Vivado-orange.svg)](https://www.xilinx.com/products/design-tools/vivado.html)
[![Domain: FPGA Design](https://img.shields.io/badge/Domain-FPGA%20%26%20Digital%20Design-green.svg)]()
[![Author: Mohammad Usman Irshad](https://img.shields.io/badge/Author-Mohammad%20Usman%20Irshad-purple.svg)](https://github.com/usman-irshad1)

## Executive Summary
**Verilog Custom Control Unit, Division Unit & Memory Datapath** is a **Advanced Processor Components** project implemented in SystemVerilog/Verilog and verified using AMD/Xilinx Vivado Simulator.

Advanced datapath hardware incorporating a Hardware Multiplier/Divider module, FSM Control, and Memory output controller.

---

## Architectural Block Diagram

```mermaid
graph TD
    Control[FSM Control Unit] --> Datapath[Processor Datapath]
    Datapath --> MUL[Hardware Multiplier Module]
    Datapath --> DIV[Division Testbench Unit]
    Datapath --> DMEM[Data Memory Controller]
```

---

## Core Key Features & Highlights

- Hardware Multiplication Unit (`muliplication_module.sv`).
- Integrated Hardware Division test module (`tb_div.sv`).
- Memory output interface controller (`data_mem_out.sv`).

---

## Source Code & Module Index

| File Name | Module Name | Key Interface Signals |
| :--- | :--- | :--- |
| `immediate_gen.sv` | `immediate_gen.sv` | Internal Module / Support File |
| `pc.sv` | `pc.sv` | Internal Module / Support File |
| `pc_immediate.sv` | `pc_immediate` | `pc_1` (input), `output logic` (input), `dataW` (input) |
| `data_mem.mem` | `data_mem.mem` | Internal Module / Support File |
| `data_mem_out.mem` | `data_mem_out.mem` | Internal Module / Support File |
| `ins_file.mem` | `ins_file.mem` | Internal Module / Support File |
| `reg.mem` | `reg.mem` | Internal Module / Support File |
| `data_mem_out.sv` | `data_mem_out.sv` | Internal Module / Support File |
| `data_mem.sv` | `data_mem` | `rd` (output), `input logic` (output), `clock` (input) |
| `ins_mem.sv` | `ins_mem.sv` | Internal Module / Support File |
| `reg_mem.sv` | `reg_file` | `rd` (input), `input logic` (input), `r1` (input) |
| `ALU.sv` | `ALU` | `ALU_control` (input), `input logic` (input), `data2` (input) |
| `alu_cont.sv` | `alu_cont.sv` | Internal Module / Support File |
| `mul.sv` | `mul.sv` | Internal Module / Support File |
| `muliplication_module.sv` | `multiplication_module` | `ALU_control` (input), `input  logic` (input), `data2` (input) |
| `mul_mux.sv` | `mul_mux.sv` | Internal Module / Support File |
| `sll.sv` | `sll` | `immediate` (input), `output logic` (input) |
| `mux.sv` | `mux.sv` | Internal Module / Support File |
| `mux_1.sv` | `mux_1.sv` | Internal Module / Support File |
| `mux_2.sv` | `MUX_2` | `alu_data` (input), `input  logic` (input), `mem_to_reg` (input) |
| `Control_unit.sv` | `Control_unit.sv` | Internal Module / Support File |
| `top_tb.sv` | `top_tb.sv` | Internal Module / Support File |
| `top.sv` | `top` | `clock` (input), `input logic reset` (input), `output logic` (input) |
| `tb_div.sv` | `tb_div` | Internal Module / Support File |

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
