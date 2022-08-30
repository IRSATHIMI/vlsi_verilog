#Makefile 
RTL = ../rtl/*.v
LIB = work 
COVOP = -coveropt 3 +cover +acc
TB1 = ../tb/tb_coincol1.v
TB2 = ../tb/tb_coincol2.v
TB3 = ../tb/tb_coincol3.v
INC = +incdir+../tb
VSIMOPT = -coverage -vopt work.tb_coincol
VSIMCOV = coverage save -onexit -directive -cvg -codeAll duv_cov
VSIMBATCH = -c -do "$(VSIMCOV); run -all; exit"

html:
	firefox covhtmlreport/pages/__frametop.htm &

lib:
	vlib $(LIB)
	vmap work $(LIB)

run_tb1:
	vlog -work $(LIB) $(COVOP) $(RTL) $(TB1) $(INC)  
	vsim $(VSIMOPT) $(VSIMBATCH)    
	vcover report -html duv_cov

run_tb2:
	vlog -work $(LIB) $(COVOP) $(RTL) $(TB2) $(INC)  
	vsim $(VSIMOPT) $(VSIMBATCH)    
	vcover report -html duv_cov

run_tb3:
	vlog -work $(LIB) $(COVOP) $(RTL) $(TB3) $(INC)  
	vsim $(VSIMOPT) $(VSIMBATCH)    
	vcover report -html duv_cov
	
run1: clean lib run_tb1 html 
run2: clean lib run_tb2 html
run3: clean lib run_tb3 html

clean:
	rm -rf modelsim.* transcript* vlog.* work vsim.wlf fcover* covhtml* duv_cov* *.txt
	clear

