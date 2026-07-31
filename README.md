# Risc V Multicycle Processor

Flagship 32-bit Multi-Cycle RISC-V Processor with Hardware Multiplier and Unified Memory

## Architecture & Project Modules
This repository contains the hardware description and simulation models developed in SystemVerilog/Verilog using AMD/Xilinx Vivado.

### Primary Verilog & Support Files
- `immediate_gen.sv`
- `pc.sv`
- `pc_immediate.sv`
- `pc_reg.sv`
- `data_mem.mem`
- `data_mem.sv`
- `ins_file.mem`
- `ins_mem.sv`
- `reg.mem`
- `reg_mem.sv`
- `unified_mem.sv`
- `write_mem_reg.sv`
- `Alu_result_reg.sv`
- `data_reg.sv`
- `Instruction_reg.sv`
- `ALU.sv`
- `ALU_con.sv`
- `Alu_mux_2.sv`
- `ALU_output.sv`
- `mul.sv`
- `mul_mux_1.sv`
- `sll.sv`
- `mux.sv`
- `mux_1.sv`
- `mux_2.sv`
- `mux_source_a.sv`
- `Control_unit.sv`
- `fsm_control.sv`
- `cnonroel.sv`
- `place_holder.sv`
- `TOP.sv`

## Build & Simulation Instructions
1. Open **AMD/Xilinx Vivado** (or ModelSim / Icarus Verilog).
2. Create a new Vivado RTL Project.
3. Add the Verilog/SystemVerilog source files located in this repository.
4. Set the top-level module (e.g. `TOP.sv` or top module) as the Top Module.
5. Run Behavioral Simulation via `xsim` or launch Synthesis/Implementation.

## Author & Maintainer
- **Author**: Mohammad Usman Irshad
- **GitHub Profile**: [@usman-irshad1](https://github.com/usman-irshad1)
