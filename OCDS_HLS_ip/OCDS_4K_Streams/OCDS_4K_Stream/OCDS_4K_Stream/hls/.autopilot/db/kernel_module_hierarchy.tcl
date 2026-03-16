set ModuleHierarchy {[{
"Name" : "cloud_mlp_top", "RefName" : "cloud_mlp_top","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "read_input_U0", "RefName" : "read_input","ID" : "1","Type" : "sequential"},
	{"Name" : "compute_l1_U0", "RefName" : "compute_l1","ID" : "2","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "L1_Loop","RefName" : "L1_Loop","ID" : "3","Type" : "pipeline"},]},
	{"Name" : "compute_l2_U0", "RefName" : "compute_l2","ID" : "4","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "L2_Loop","RefName" : "L2_Loop","ID" : "5","Type" : "pipeline"},]},
	{"Name" : "compute_l3_U0", "RefName" : "compute_l3","ID" : "6","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "L3_Loop","RefName" : "L3_Loop","ID" : "7","Type" : "pipeline"},]},
	{"Name" : "write_output_U0", "RefName" : "write_output","ID" : "8","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_write_output_Pipeline_Loop_Out_fu_608", "RefName" : "write_output_Pipeline_Loop_Out","ID" : "9","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop_Out","RefName" : "Loop_Out","ID" : "10","Type" : "pipeline"},]},]},]
}]}