transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023 {C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023/alu.sv}
vlog -sv -work work +incdir+C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023 {C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023/adder.sv}
vlog -sv -work work +incdir+C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023 {C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023/dmem.sv}
vlog -sv -work work +incdir+C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023 {C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023/top.sv}
vlog -sv -work work +incdir+C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023 {C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023/mux2.sv}
vlog -sv -work work +incdir+C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023 {C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023/flopenr.sv}
vlog -sv -work work +incdir+C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023 {C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023/flopr.sv}
vlog -sv -work work +incdir+C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023 {C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023/extend.sv}
vlog -sv -work work +incdir+C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023 {C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023/regfile.sv}
vlog -sv -work work +incdir+C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023 {C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023/datapath.sv}
vlog -sv -work work +incdir+C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023 {C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023/condlogic.sv}
vlog -sv -work work +incdir+C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023 {C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023/decoder.sv}
vlog -sv -work work +incdir+C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023 {C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023/controller.sv}
vlog -sv -work work +incdir+C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023 {C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023/arm.sv}
vlog -sv -work work +incdir+C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023 {C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023/imem.sv}

vlog -sv -work work +incdir+C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023 {C:/Users/sebas/Documents/GitHub/squesada_ebarrantes_icalderon_digital_design_lab_2023/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
