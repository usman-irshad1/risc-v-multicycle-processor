# 32-Bit Single-Cycle RISC-V Processor Core

[![Language: SystemVerilog](https://img.shields.io/badge/Language-SystemVerilog%2FVerilog-blue.svg)](https://en.wikipedia.org/wiki/SystemVerilog)
[![Tool: AMD Vivado](https://img.shields.io/badge/Tool-AMD%2FXilinx%20Vivado-orange.svg)](https://www.xilinx.com/products/design-tools/vivado.html)
[![Domain: FPGA Design](https://img.shields.io/badge/Domain-FPGA%20%26%20Digital%20Design-green.svg)]()
[![Author: Mohammad Usman Irshad](https://img.shields.io/badge/Author-Mohammad%20Usman%20Irshad-purple.svg)](https://github.com/usman-irshad1)

## Executive Summary
**32-Bit Single-Cycle RISC-V Processor Core** is a **Full CPU Core Engineering** project implemented in SystemVerilog/Verilog and verified using AMD/Xilinx Vivado Simulator.

Complete 32-bit Single-Cycle RISC-V Processor Core written in SystemVerilog, supporting RV32I base integer instructions.

---

## Architectural Block Diagram

```mermaid
graph TD
    PC[Program Counter] --> IMEM[Instruction Memory]
    IMEM --> DEC[Control Unit & Imm Gen]
    DEC --> RF[32x32 Register File]
    RF --> ALU[ALU & Multiplier/Shifter]
    ALU --> DMEM[Data Memory]
    DMEM --> WB[Writeback Mux]
    WB --> RF
```

---

## Core Key Features & Highlights

- Full RV32I Base Integer Instruction Set Support.
- Integrated Hardware Multiplier (`mul.sv`) and Logical Shift Unit (`sll.sv`).
- Memory Initialization files (`ins_file.mem`, `data_mem.mem`, `reg.mem`).
- Top-level testbench (`top_tb.sv`) verifying full execution.

---

## Source Code & Module Index

| File Name | Module Name | Key Interface Signals |
| :--- | :--- | :--- |
| `immediate_gen.sv` | `immediate_gen` | `ins` (input), `output logic` (input) |
| `pc.sv` | `program_counter` | `pc` (output), `input  logic` (output), `clock` (input) |
| `pc_immediate.sv` | `pc_immediate` | `pc_1` (input), `output logic` (input), `dataW` (input) |
| `data_mem.mem` | `data_mem.mem` | Internal Module / Support File |
| `ins_file.mem` | `ins_file.mem` | Internal Module / Support File |
| `reg.mem` | `reg.mem` | Internal Module / Support File |
| `data_mem.sv` | `data_mem` | `rd` (output), `input logic` (output), `clock` (input) |
| `ins_mem.sv` | `Unified_Memory_1Port` | `clock` (input), `input logic memwrite` (input), `input logic` (input) |
| `reg_mem.sv` | `reg_file` | `rd` (input), `input logic` (input), `r1` (input) |
| `unified_memory.mem` | `unified_memory.mem` | Internal Module / Support File |
| `ins_reg.sv` | `Instruction_reg` | `old_pc` (input), `input logic` (input), `clock` (input) |
| `mul_mux.sv` | `Mul_output_mux` | `fun11` (input), `input logic` (input), `lo` (input) |
| `mul_tets.sv` | `tb_alu_and_mult` | Internal Module / Support File |
| `ALU.sv` | `ALU` | `ALU_control` (input), `input logic` (input), `data2` (input) |
| `ALU_con.sv` | `alu_control` | `ALU_op` (input), `input logic` (input), `fun11` (input) |
| `mul.sv` | `multiplication_module` | `clock` (input), `input  logic                reset` (input), `input  logic` (input) |
| `mul_mux_1.sv` | `mul_mux` | `ALU_control` (input), `output logic` (input), `alu_1` (input) |
| `sll.sv` | `pc_reg` | `next_pc` (input), `input logic clock` (input), `input logic reset` (input) |
| `multiplication_module_tb_func_synth.v` | `ALU` | `O` (output), `i__carry__0_i_4__1` (output), `i__carry__1_i_4__1` (output) |
| `alu_result.sv` | `single_result_reg` | `clock` (input), `input logic reset` (input), `input logic` (input) |
| `alu_result_mux.sv` | `ALU_output` | `Alu_result` (input), `input logic` (input), `ALU_output` (output) |
| `alu_source_a.sv` | `ALU_source1` | `data1` (input), `pc` (input), `old_pc` (input) |
| `mux.sv` | `write_back_mem_reg` | `data` (input), `input logic clock` (input), `input logic reset` (input) |
| `mux_1.sv` | `ALU_source2` | `data2` (input), `immediate` (input), `input logic` (input) |
| `mux_2.sv` | `data_reg` | `data1` (input), `input logic` (input), `clock` (input) |
| `adress_source_mux.sv` | `adress_source_mux` | `pc_in` (input), `input logic` (input), `adress_source` (input) |
| `Control_unit.sv` | `Control_unit` | `mult_ready` (input), `opcode` (input), `fun21` (input) |
| `Control.sv` | `Control_unit` | `mult_ready` (input), `input logic` (input), `fun21` (input) |
| `design_1.v` | `design_1` | Internal Module / Support File |
| `wsd.sv` | `multiplication_module_tb` | Internal Module / Support File |
| `design_1_wrapper.v` | `design_1_wrapper` | Internal Module / Support File |
| `top_tb.sv` | `tb_top_processor` | Internal Module / Support File |
| `TOP.sv` | `top_processor` | `clock` (input), `input logic reset` (input), `output logic` (input) |
| `tb_top_processor_func_synth.v` | `ALU` | `O` (output), `i__carry__0_i_4__1` (output), `i__carry__1_i_4__1` (output) |

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


---

---

## Author & Contact Details

Developed and maintained by **Mohammad Usman Irshad**.

* **GitHub Profile**: [@usman-irshad1](https://github.com/usman-irshad1)
* **Email**: [217554659+usman-irshad1@users.noreply.github.com](mailto:217554659+usman-irshad1@users.noreply.github.com)
* **Domain**: Digital Design, Verilog/SystemVerilog HDL, Computer Architecture & RISC-V Processor Cores.
