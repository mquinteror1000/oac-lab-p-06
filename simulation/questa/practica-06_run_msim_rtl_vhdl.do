transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/martin/current/oac-lab/practica-06/practica6.vhd}

vcom -93 -work work {/home/martin/current/oac-lab/practica-06/tb_practica6.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  tb_practica6

add wave *
view structure
view signals
run -all
