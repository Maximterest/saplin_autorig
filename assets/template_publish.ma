//Maya ASCII 2023 scene
//Name: template_publish.ma
//Last modified: Tue, Jan 09, 2024 11:55:52 AM
//Codeset: 1252
requires maya "2023";
requires "stereoCamera" "10.0";
requires -nodeType "aiOptions" -nodeType "aiAOVDriver" -nodeType "aiAOVFilter" "mtoa" "5.2.1.1";
requires "realflow" "5.0.8";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2023";
fileInfo "version" "2023";
fileInfo "cutIdentifier" "202211021031-847a9f9623";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 19045)";
fileInfo "UUID" "137AA9E4-452D-3D9C-3B0D-F5B686559AE0";
fileInfo "license" "education";
createNode transform -s -n "persp";
	rename -uid "E6D83A08-4562-FA0A-876A-68968ADC5444";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 51.03378104046903 30.073846255082085 18.18752797128176 ;
	setAttr ".r" -type "double3" -30.338352729497867 74.200000000003172 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "0B61039E-4F31-5E59-222C-668EBD1461BD";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 70.354170400491924;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -4.3394069940993933 6.4196504961340546 2.9176111364522401 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "BFE079AB-4C51-505C-D44D-D89574E9FB23";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 30.796741954152537 1000.1 -3.4825289017416452 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "CEA72365-4093-AD6D-AC16-4C8A4BE48205";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 58.300913949457225;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "5A390672-4D4F-AB97-8D15-1FA22B04C960";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.4465112368286843 2.2086842755628817 1018.8731760480705 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "5DCE28B7-4808-DCEA-695E-2E9BA1BD515E";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1015.4366801099237;
	setAttr ".ow" 41.875920065723776;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" 5.5468592375553305 5.4130167352709408 3.4364959381467495 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "FA1C35E8-43F9-B1F4-61B1-16BF624C1FB2";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1014.6876795539338 0.53901173532470836 4.2732762684031256 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "8F191184-40CE-3482-F218-C68F8D751F09";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1009.0773722884708;
	setAttr ".ow" 29.778538604503389;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".tp" -type "double3" 5.6103072654630388 6.9833241889689255 1.2796133400201413 ;
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -n "GRP_template_biped";
	rename -uid "40520B8F-4DDC-8295-DD5C-5D8EA5873D2C";
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode transform -n "TPL_CTRL_scale" -p "GRP_template_biped";
	rename -uid "AC1746EF-43CB-C668-CAB3-ABAEEC7CF0AB";
	setAttr ".ove" yes;
	setAttr ".ovc" 14;
createNode nurbsCurve -n "TPL_CTRL_scaleShape" -p "TPL_CTRL_scale";
	rename -uid "D7AA8D80-4C21-3EE8-80E2-8490ED3D89A2";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 48 0 no 3
		49 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48
		49
		-13.250921791485432 0 19.729150222878317
		-14.210556868092258 0 21.191181294523552
		-10.720244654876629 0 24.681493507739155
		-24.930801522968899 0 24.930801522968899
		-24.681493507739159 0 10.720244654876629
		-21.19118129452356 0 14.21055686809226
		-19.729150222878328 0 13.250921791485432
		-21.790404723776046 0 8.8339478609902837
		-23.262729367274435 0 4.4169739304951454
		-23.557194295974096 0 1.5411238796607229e-15
		-23.262729367274435 0 -4.4169739304951383
		-21.790404723776053 0 -8.833947860990282
		-19.729150222878328 0 -13.250921791485418
		-21.19118129452356 0 -14.210556868092254
		-24.681493507739159 0 -10.720244654876627
		-24.930801522968903 0 -24.930801522968888
		-10.72024465487663 0 -24.681493507739155
		-14.210556868092265 0 -21.191181294523552
		-13.250921791485446 0 -19.729150222878317
		-8.8339478609902944 0 -21.790404723776039
		-4.4169739304951472 0 -23.262729367274432
		-1.5411238796607239e-15 0 -23.557194295974089
		4.4169739304951392 0 -23.262729367274432
		8.8339478609902837 0 -21.790404723776046
		13.250921791485432 0 -19.729150222878317
		14.210556868092258 0 -21.191181294523552
		10.720244654876629 0 -24.681493507739155
		24.930801522968899 0 -24.930801522968899
		24.681493507739159 0 -10.720244654876629
		21.19118129452356 0 -14.21055686809226
		19.729150222878328 0 -13.250921791485432
		21.790404723776046 0 -8.8339478609902837
		23.262729367274435 0 -4.4169739304951454
		23.557194295974096 0 -1.5411238796607229e-15
		23.262729367274435 0 4.4169739304951383
		21.790404723776053 0 8.833947860990282
		19.729150222878328 0 13.250921791485418
		21.19118129452356 0 14.210556868092254
		24.681493507739159 0 10.720244654876627
		24.930801522968903 0 24.930801522968888
		10.72024465487663 0 24.681493507739155
		14.210556868092265 0 21.191181294523552
		13.250921791485446 0 19.729150222878317
		8.8339478609902944 0 21.790404723776039
		4.4169739304951472 0 23.262729367274432
		1.5411238796607239e-15 0 23.557194295974089
		-4.4169739304951392 0 23.262729367274432
		-8.8339478609902837 0 21.790404723776046
		-13.250921791485432 0 19.729150222878317
		;
createNode transform -n "GRP_template_head_C" -p "TPL_CTRL_scale";
	rename -uid "35A203F8-47B2-AC73-D9A2-17A97254772E";
	setAttr ".rp" -type "double3" 0 127.53803014469031 -3.5505068302154914 ;
	setAttr ".sp" -type "double3" 0 127.53803014469031 -3.5505068302154914 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode joint -n "TPL_head_01_C" -p "GRP_template_head_C";
	rename -uid "3E670684-4AE2-806F-415B-1BB6A638ECAD";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".t" -type "double3" 0 127.53803014469031 -3.5505068302154914 ;
	setAttr ".r" -type "double3" 1.5902773407317584e-15 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.9809910497290506 0.19405298336149168 0
		 0 -0.19405298336149168 0.9809910497290506 0 0 118.03182983398438 -3.550506830215455 1;
	setAttr ".sd" 3;
	setAttr ".radi" 2;
createNode joint -n "TPL_head_02_C" -p "TPL_head_01_C";
	rename -uid "AB39D2B2-4E00-9886-AB2A-67B77C24D47E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".t" -type "double3" 0 5.2782690235297451 0 ;
	setAttr ".r" -type "double3" 1.5902773407317584e-15 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.9809910497290506 0.19405298336149168 0
		 0 -0.19405298336149168 0.9809910497290506 0 0 118.03182983398438 -3.550506830215455 1;
	setAttr ".sd" 3;
createNode transform -n "GRP_template_eyes" -p "TPL_CTRL_scale";
	rename -uid "A3D9F574-49A5-D344-F9E9-9FB9449AE80D";
	setAttr ".rp" -type "double3" 0 127.53803253173828 -3.5505068302154541 ;
	setAttr ".sp" -type "double3" 0 127.53803253173828 -3.5505068302154541 ;
createNode transform -n "GRP_template_eye_L" -p "GRP_template_eyes";
	rename -uid "4505EF85-415E-A0FF-5C0F-38BC16BCD235";
	setAttr ".rp" -type "double3" 2.0058324337005615 129.56733703613281 -0.76538705825805664 ;
	setAttr ".sp" -type "double3" 2.0058324337005615 129.56733703613281 -0.76538705825805664 ;
createNode joint -n "TPL_eye_01_L" -p "GRP_template_eye_L";
	rename -uid "C2B6F68F-44BD-7953-63A8-E1BFD09BE298";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 2.0058324412389066 129.56733853355192 -0.76538703387538409 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 0.44438065074382782 -0.1555606473305666 0.8822282710538053 0
		 0.038349610420078582 0.98720833675072661 0.15475466787948997 0 -0.895016840414257 -0.034936869521439734 0.44466197332684232 0
		 1.6087983753036406 115.47028079490164 0.93635386846764668 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "clavicle";
	setAttr ".radi" 0.5;
	setAttr ".liw" yes;
createNode joint -n "TPL_eye_02_L" -p "TPL_eye_01_L";
	rename -uid "44C2D7DC-49E8-8578-AE2F-62AE208F4F69";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -1.9031331843777366e-08 3.2395183779954095e-07 0.9472406981472935 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.44438065074382782 -0.1555606473305666 0.8822282710538053 0
		 0.038349610420078582 0.98720833675072661 0.15475466787948997 0 -0.895016840414257 -0.034936869521439734 0.44466197332684232 0
		 1.6087983753036406 115.47028079490164 0.93635386846764668 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "clavicle";
	setAttr ".radi" 0.3;
	setAttr ".liw" yes;
createNode transform -n "GRP_template_eye_R" -p "GRP_template_eyes";
	rename -uid "4BA23D02-4083-80BE-6F58-25BC46647BFE";
	setAttr ".rp" -type "double3" -2.0058300495147705 129.56700134277344 -0.76538699865341187 ;
	setAttr ".sp" -type "double3" -2.0058300495147705 129.56700134277344 -0.76538699865341187 ;
createNode joint -n "TPL_eye_01_R" -p "GRP_template_eye_R";
	rename -uid "247F8D64-4EFB-2655-33B0-9AA425131207";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -2.00583 129.567 -0.765387 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".bps" -type "matrix" 0.44438065074382782 -0.1555606473305666 0.8822282710538053 0
		 0.038349610420078582 0.98720833675072661 0.15475466787948997 0 -0.895016840414257 -0.034936869521439734 0.44466197332684232 0
		 1.6087983753036406 115.47028079490164 0.93635386846764668 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "clavicle";
	setAttr ".radi" 0.5;
	setAttr ".liw" yes;
createNode joint -n "TPL_eye_02_R" -p "TPL_eye_01_R";
	rename -uid "FD54D5B4-4128-81D3-5207-75A82866AC2D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 0 0 -0.947241 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.44438065074382782 -0.1555606473305666 0.8822282710538053 0
		 0.038349610420078582 0.98720833675072661 0.15475466787948997 0 -0.895016840414257 -0.034936869521439734 0.44466197332684232 0
		 1.6087983753036406 115.47028079490164 0.93635386846764668 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "clavicle";
	setAttr ".radi" 0.3;
	setAttr ".liw" yes;
createNode transform -n "GRP_template_jaw_C" -p "TPL_CTRL_scale";
	rename -uid "FF67A950-473A-5960-F202-D9881F72A065";
	setAttr ".rp" -type "double3" 0 125.77494812011719 -2.5268814563751221 ;
	setAttr ".sp" -type "double3" 0 125.77494812011719 -2.5268814563751221 ;
createNode joint -n "TPL_jaw_01_C" -p "GRP_template_jaw_C";
	rename -uid "3FE09D90-4BF6-1812-7220-F69E03ABDC25";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".t" -type "double3" 0 125.77494481355833 -2.5268813846920759 ;
	setAttr ".r" -type "double3" 36.170291647594219 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 0.44438065074382782 -0.1555606473305666 0.8822282710538053 0
		 0.038349610420078582 0.98720833675072661 0.15475466787948997 0 -0.895016840414257 -0.034936869521439734 0.44466197332684232 0
		 1.6087983753036406 115.47028079490164 0.93635386846764668 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "clavicle";
	setAttr ".liw" yes;
createNode joint -n "TPL_jaw_02_C" -p "TPL_jaw_01_C";
	rename -uid "35E5C926-45FE-257D-6F5D-59B228C4DEB3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".t" -type "double3" -1.9031331843777366e-08 3.2395184129674348e-07 4.7325779784483677 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.44438065074382782 -0.1555606473305666 0.8822282710538053 0
		 0.038349610420078582 0.98720833675072661 0.15475466787948997 0 -0.895016840414257 -0.034936869521439734 0.44466197332684232 0
		 1.6087983753036406 115.47028079490164 0.93635386846764668 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "clavicle";
	setAttr ".radi" 0.7;
	setAttr ".liw" yes;
createNode joint -n "TPL_upper_jaw_01_C" -p "TPL_jaw_01_C";
	rename -uid "AACA8DD3-47D3-C769-B562-808B5928F620";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr ".r" -type "double3" 20.102108886275701 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -36.170291647594212 0 0 ;
	setAttr ".bps" -type "matrix" 0.44438065074382782 -0.1555606473305666 0.8822282710538053 0
		 0.038349610420078582 0.98720833675072661 0.15475466787948997 0 -0.895016840414257 -0.034936869521439734 0.44466197332684232 0
		 1.6087983753036406 115.47028079490164 0.93635386846764668 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "clavicle";
	setAttr ".radi" 0.7;
	setAttr ".liw" yes;
createNode joint -n "TPL_upper_jaw_02_C" -p "TPL_upper_jaw_01_C";
	rename -uid "C9F85D08-4085-B9FC-D5AA-158F1425D66E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr ".t" -type "double3" -1.9031332558483438e-08 3.2395184977607183e-07 4.2918302454305168 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.44438065074382782 -0.1555606473305666 0.8822282710538053 0
		 0.038349610420078582 0.98720833675072661 0.15475466787948997 0 -0.895016840414257 -0.034936869521439734 0.44466197332684232 0
		 1.6087983753036406 115.47028079490164 0.93635386846764668 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "clavicle";
	setAttr ".radi" 0.7;
	setAttr ".liw" yes;
createNode transform -n "GRP_template_neck_C" -p "TPL_CTRL_scale";
	rename -uid "7741A5AE-4662-0279-4C73-63A7C5C236EB";
	setAttr ".rp" -type "double3" 0 118.13159942626953 -3.5505068302154541 ;
	setAttr ".sp" -type "double3" 0 118.13159942626953 -3.5505068302154541 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode transform -n "GRP_H_CRV_neck_C" -p "GRP_template_neck_C";
	rename -uid "FA52DCA6-49FC-B0B8-5D6F-BB89FA050AF6";
createNode transform -n "H_CRV_neck_C_for_TPL_neck_01_C" -p "GRP_H_CRV_neck_C";
	rename -uid "D43AAAD6-4F07-AA5D-A81C-61AF8685E6F8";
createNode joint -n "TPL_neck_01_C" -p "H_CRV_neck_C_for_TPL_neck_01_C";
	rename -uid "616EA55E-49FF-9317-9564-2A98A5B9F539";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.9809910497290506 0.19405298336149168 0
		 0 -0.19405298336149168 0.9809910497290506 0 0 118.03182983398438 -3.550506830215455 1;
	setAttr ".sd" 3;
createNode transform -n "H_CRV_neck_C_for_TPL_neck_02_C" -p "GRP_H_CRV_neck_C";
	rename -uid "14E945D9-431A-98EA-3ED7-71AF457FCE96";
createNode joint -n "TPL_neck_02_C" -p "H_CRV_neck_C_for_TPL_neck_02_C";
	rename -uid "F081F42F-441F-CF56-38EF-BBB8B6D3A5FA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.9809910497290506 0.19405298336149168 0
		 0 -0.19405298336149168 0.9809910497290506 0 0 118.03182983398438 -3.550506830215455 1;
	setAttr ".sd" 3;
	setAttr ".radi" 0.5;
createNode transform -n "H_CRV_neck_C_for_TPL_neck_03_C" -p "GRP_H_CRV_neck_C";
	rename -uid "209CC3F1-4FA5-6541-B764-F287651D1905";
createNode joint -n "TPL_neck_03_C" -p "H_CRV_neck_C_for_TPL_neck_03_C";
	rename -uid "799005A8-4EE4-1F9E-CABB-F9858986C174";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.9809910497290506 0.19405298336149168 0
		 0 -0.19405298336149168 0.9809910497290506 0 0 118.03182983398438 -3.550506830215455 1;
	setAttr ".sd" 3;
	setAttr ".radi" 0.5;
createNode transform -n "H_CRV_neck_C_for_TPL_neck_04_C" -p "GRP_H_CRV_neck_C";
	rename -uid "7488D046-4678-5D92-B452-D4BE1E67D958";
createNode joint -n "TPL_neck_04_C" -p "H_CRV_neck_C_for_TPL_neck_04_C";
	rename -uid "F0C01568-4258-97BA-A9F8-7C9DBFA25611";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.9809910497290506 0.19405298336149168 0
		 0 -0.19405298336149168 0.9809910497290506 0 0 118.03182983398438 -3.550506830215455 1;
	setAttr ".sd" 3;
createNode transform -n "LOC_neck_C" -p "GRP_template_neck_C";
	rename -uid "ADA1F725-479F-F1DE-088B-51A654383B5F";
createNode transform -n "LOC_neck_01_C" -p "LOC_neck_C";
	rename -uid "FCF99EF2-4188-BEFE-8CA2-7290F533CC79";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".t" -type "double3" 0 118.13152307369275 -3.550507176517856 ;
	setAttr ".r" -type "double3" 0.2598671853384103 0 0 ;
createNode locator -n "LOC_neck_01_CShape" -p "LOC_neck_01_C";
	rename -uid "E9E065EF-421C-2F07-5CC4-ACAE7473AB1E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 4 1.5 4 ;
createNode transform -n "LOC_neck_02_C" -p "LOC_neck_C";
	rename -uid "FB28151C-45F1-8CAC-BB1F-FD97ED8B0FF5";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".t" -type "double3" 0 121.267069298815 -3.5505068302154563 ;
createNode locator -n "LOC_neck_02_CShape" -p "LOC_neck_02_C";
	rename -uid "3A76DCC6-47A3-AA1E-357F-35A0C40357AE";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 2.5 1 2.5 ;
createNode transform -n "LOC_neck_03_C" -p "LOC_neck_C";
	rename -uid "A6100E3F-4E77-DB7C-9343-65B7712261C6";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".t" -type "double3" 0 124.40253914311062 -3.5505068302154621 ;
createNode locator -n "LOC_neck_03_CShape" -p "LOC_neck_03_C";
	rename -uid "0CAF59C2-4211-85A9-EBF1-2EAB6E42349B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 2.5 1 2.5 ;
createNode transform -n "LOC_neck_04_C" -p "LOC_neck_C";
	rename -uid "67A686D1-4415-352C-9F2D-EAA1344C118A";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".t" -type "double3" 0 127.53803253173874 -3.5505068302154665 ;
createNode locator -n "LOC_neck_04_CShape" -p "LOC_neck_04_C";
	rename -uid "C9952F81-497C-2B61-6E7F-5E9D66D35B2F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 4 1.5 4 ;
createNode transform -n "GRP_SKcurv_neck_C" -p "GRP_template_neck_C";
	rename -uid "6DE3E2D4-456C-525B-2524-4F9E0D143A1C";
	setAttr ".v" no;
createNode joint -n "SKcurv_neck_01_C" -p "GRP_SKcurv_neck_C";
	rename -uid "B8C5A3EC-4E89-C214-8FFD-64BEA6101B4D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.9809910497290506 0.19405298336149168 0
		 0 -0.19405298336149168 0.9809910497290506 0 0 118.03182983398438 -3.550506830215455 1;
createNode parentConstraint -n "SKcurv_neck_01_C_parentConstraint1" -p "SKcurv_neck_01_C";
	rename -uid "6839B365-4D88-5036-5F22-8EAF1EB47DEF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LOC_neck_01_CW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 0 7.625001362043804e-05 4.6872106196360619e-10 ;
	setAttr ".tg[0].tor" -type "double3" -0.2598671853384103 0 0 ;
	setAttr ".rst" -type "double3" 0 118.13159932291997 -3.550506830215491 ;
	setAttr -k on ".w0";
createNode joint -n "SKcurv_neck_02_C" -p "GRP_SKcurv_neck_C";
	rename -uid "9CAF3D5C-491A-628F-CE12-B79A71C83E7F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.9809910497290506 0.19405298336149168 0
		 0 -0.19405298336149168 0.9809910497290506 0 0 118.03182983398438 -3.550506830215455 1;
	setAttr ".radi" 0.5;
createNode parentConstraint -n "SKcurv_neck_02_C_parentConstraint1" -p "SKcurv_neck_02_C";
	rename -uid "2EFC769C-4AD0-1F86-D1FE-999E4CD55EDD";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LOC_neck_02_CW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 0 121.267069298815 -3.5505068302154563 ;
	setAttr -k on ".w0";
createNode joint -n "SKcurv_neck_03_C" -p "GRP_SKcurv_neck_C";
	rename -uid "29DAEF2D-4169-80EF-9AFC-05AFC4AC4E81";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.9809910497290506 0.19405298336149168 0
		 0 -0.19405298336149168 0.9809910497290506 0 0 118.03182983398438 -3.550506830215455 1;
	setAttr ".radi" 0.5;
createNode parentConstraint -n "SKcurv_neck_03_C_parentConstraint1" -p "SKcurv_neck_03_C";
	rename -uid "BD18086B-4CDB-FDA7-4380-C38D7E6394CF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LOC_neck_03_CW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 0 -1.4210854715202004e-14 0 ;
	setAttr ".rst" -type "double3" 0 124.4025391431106 -3.5505068302154621 ;
	setAttr -k on ".w0";
createNode joint -n "SKcurv_neck_04_C" -p "GRP_SKcurv_neck_C";
	rename -uid "9A9E3D7B-4682-9D85-C426-8DAD8CFE2495";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.9809910497290506 0.19405298336149168 0
		 0 -0.19405298336149168 0.9809910497290506 0 0 118.03182983398438 -3.550506830215455 1;
createNode parentConstraint -n "SKcurv_neck_04_C_parentConstraint1" -p "SKcurv_neck_04_C";
	rename -uid "BB439A65-4231-8EC0-7957-E4A466BFA324";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LOC_neck_04_CW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 0 127.53803253173874 -3.5505068302154665 ;
	setAttr -k on ".w0";
createNode transform -n "CRV_neck_C" -p "GRP_template_neck_C";
	rename -uid "43F7F03D-46CC-DAA4-5688-3FBC9B9B0DFC";
	setAttr ".rp" -type "double3" 0 122.83481597900413 -3.5505068302154603 ;
	setAttr ".sp" -type "double3" 0 122.83481597900413 -3.5505068302154603 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode nurbsCurve -n "CRV_neck_CShape" -p "CRV_neck_C";
	rename -uid "BC9B597D-4B23-8659-778A-53BA976D200B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 31;
	setAttr ".tw" yes;
	setAttr ".ls" 3;
createNode nurbsCurve -n "CRV_neck_CShapeOrig" -p "CRV_neck_C";
	rename -uid "653284B9-40AF-6752-987C-4AB071C3BB2B";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		0 118.13159942626953 -3.5505068302154545
		0 121.26707717046746 -3.5505068302154545
		0 124.40255478754085 -3.5505068302154643
		0 127.53803253173874 -3.5505068302154665
		;
createNode parentConstraint -n "CRV_neck_C_parentConstraint1" -p "CRV_neck_C";
	rename -uid "F35C2452-4558-1C0D-AF84-AABBB8090EEF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "GRP_template_bipedW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 0 122.83481597900413 -3.5505068302154603 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "CRV_neck_C_scaleConstraint1" -p "CRV_neck_C";
	rename -uid "C79FE29E-4077-241B-7787-A0B2F0DC4398";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "GRP_template_bipedW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "GRP_template_spine_C" -p "TPL_CTRL_scale";
	rename -uid "94273B58-44E7-8C0F-1B89-2091CB732C8E";
	setAttr ".rp" -type "double3" 0 87.590568542480469 -3.6890277862548828 ;
	setAttr ".sp" -type "double3" 0 87.590568542480469 -3.6890277862548828 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode transform -n "GRP_H_CRV_spine_C" -p "GRP_template_spine_C";
	rename -uid "396D933F-4AFA-0BAA-212C-35B5DB125CF7";
createNode transform -n "H_CRV_spine_C_for_TPL_spine_01_C" -p "GRP_H_CRV_spine_C";
	rename -uid "30A5DBFA-4497-A90C-A783-D78197797B16";
createNode joint -n "TPL_spine_01_C" -p "H_CRV_spine_C_for_TPL_spine_01_C";
	rename -uid "EC1E5278-4610-6E66-48F3-9599F33F5CA8";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".sd" 3;
createNode transform -n "H_CRV_spine_C_for_TPL_spine_02_C" -p "GRP_H_CRV_spine_C";
	rename -uid "F77DB853-4782-5482-438B-95B0185C7ABA";
createNode joint -n "TPL_spine_02_C" -p "H_CRV_spine_C_for_TPL_spine_02_C";
	rename -uid "66DA5F7D-4D70-987A-7241-02987EA8F9EF";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".sd" 3;
createNode transform -n "H_CRV_spine_C_for_TPL_spine_03_C" -p "GRP_H_CRV_spine_C";
	rename -uid "6CDE9B5D-44FB-FDD5-6A1E-47A0A485680B";
createNode joint -n "TPL_spine_03_C" -p "H_CRV_spine_C_for_TPL_spine_03_C";
	rename -uid "F8E3257B-4A4B-772E-B598-99B2B2577E9D";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".sd" 3;
createNode transform -n "H_CRV_spine_C_for_TPL_spine_04_C" -p "GRP_H_CRV_spine_C";
	rename -uid "4F783C42-4760-57FC-664A-A8A3F1FA941C";
createNode joint -n "TPL_spine_04_C" -p "H_CRV_spine_C_for_TPL_spine_04_C";
	rename -uid "9DC786C0-4B64-52E7-CB0B-15B83C7448F7";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".sd" 3;
createNode transform -n "LOC_spine_C" -p "GRP_template_spine_C";
	rename -uid "21C8D7FD-4D96-2E65-3C99-65B8B440BE5F";
createNode transform -n "LOC_spine_01_C" -p "LOC_spine_C";
	rename -uid "D1D26B08-4CF8-47A8-CB20-F68177F3EF34";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".t" -type "double3" 0 87.590568439131061 -3.6890277862548819 ;
createNode locator -n "LOC_spine_01_CShape" -p "LOC_spine_01_C";
	rename -uid "5D827A3F-4911-3872-0AD5-038A95AD3BCC";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 5 1.5 5 ;
createNode transform -n "LOC_spine_02_C" -p "LOC_spine_C";
	rename -uid "69100415-415F-56B2-CCBC-0380015E0E5D";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".t" -type "double3" 0 97.770912170410156 -3.6428542137145987 ;
createNode locator -n "LOC_spine_02_CShape" -p "LOC_spine_02_C";
	rename -uid "EE73BD51-4967-B949-34FA-A19B85723987";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 3 1.5 3 ;
createNode transform -n "LOC_spine_03_C" -p "LOC_spine_C";
	rename -uid "EA2E4667-4F0A-BB61-115D-5995CCF0BEED";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".t" -type "double3" 0 107.95125579833984 -3.5966804027557373 ;
createNode locator -n "LOC_spine_03_CShape" -p "LOC_spine_03_C";
	rename -uid "6445C2E7-4388-825B-EF21-D9B842EB11A5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 3 1.5 3 ;
createNode transform -n "LOC_spine_04_C" -p "LOC_spine_C";
	rename -uid "F9754678-4AD4-D0AD-784B-5594EF51786B";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".t" -type "double3" 0 118.13159932291995 -3.5505068302154914 ;
createNode locator -n "LOC_spine_04_CShape" -p "LOC_spine_04_C";
	rename -uid "DEA7994C-4BF8-DB98-222C-4BA3D4A864B6";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 5 2 5 ;
createNode transform -n "GRP_SKcurv_spine_C" -p "GRP_template_spine_C";
	rename -uid "4FEC38F5-482E-1237-B734-FFBB1B158EA3";
	setAttr ".v" no;
createNode joint -n "SKcurv_spine_01_C" -p "GRP_SKcurv_spine_C";
	rename -uid "7D60DAD6-4963-E091-A009-23A9DE65FAFE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 87.590568439131061 -3.6890277862548815 1;
	setAttr ".radi" 2;
createNode parentConstraint -n "SK_spine_01_C_parentConstraint1" -p "SKcurv_spine_01_C";
	rename -uid "9F716639-4E73-E0A9-346F-80A3222BDA0D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "TMP_spine_01_C1W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 0 0 8.8817841970012523e-16 ;
	setAttr ".rst" -type "double3" 0 87.590568439131061 -3.689027786254881 ;
	setAttr -k on ".w0";
createNode joint -n "SKcurv_spine_02_C" -p "GRP_SKcurv_spine_C";
	rename -uid "B968FDE7-44DB-661D-A95B-B499F56EB41F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 97.770912170410156 -3.6428542137145987 1;
createNode parentConstraint -n "SK_spine_02_C_parentConstraint1" -p "SKcurv_spine_02_C";
	rename -uid "6A2D10F2-4AC6-8E1D-BE09-629E4323528F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "TMP_spine_02_C1W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 0 97.770912170410156 -3.6428542137145987 ;
	setAttr -k on ".w0";
createNode joint -n "SKcurv_spine_03_C" -p "GRP_SKcurv_spine_C";
	rename -uid "3DEDA5DB-408F-D12F-19D3-EC942598D333";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 107.95125579833984 -3.5966804027557373 1;
createNode parentConstraint -n "SK_spine_03_C_parentConstraint1" -p "SKcurv_spine_03_C";
	rename -uid "EA31B363-4157-291D-0EDF-C9AD3FA35CA5";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "TMP_spine_03_C1W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 0 107.95125579833984 -3.5966804027557373 ;
	setAttr -k on ".w0";
createNode joint -n "SKcurv_spine_04_C" -p "GRP_SKcurv_spine_C";
	rename -uid "C2BA9752-4812-DE28-E528-DAB5E9572B93";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 118.13159932291995 -3.5505068302154914 1;
	setAttr ".radi" 2;
createNode parentConstraint -n "SK_spine_04_C_parentConstraint1" -p "SKcurv_spine_04_C";
	rename -uid "90FF0F8E-452C-5EA2-EF1A-679F597B83BC";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "TMP_spine_04_C1W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 0 118.13159932291995 -3.5505068302154914 ;
	setAttr -k on ".w0";
createNode transform -n "CRV_spine_C" -p "GRP_template_spine_C";
	rename -uid "17362170-44C6-CB08-9E44-82BF83525DA8";
	setAttr ".rp" -type "double3" 0 102.86108398437521 -3.6197673082351747 ;
	setAttr ".sp" -type "double3" 0 102.86108398437521 -3.6197673082351747 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode nurbsCurve -n "CRV_spine_CShape" -p "CRV_spine_C";
	rename -uid "9D50FD16-4A8A-E5C2-6690-69BEEB8BA0ED";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 4;
	setAttr ".tw" yes;
	setAttr ".ls" 3;
createNode nurbsCurve -n "CRV_spine_CShapeOrig" -p "CRV_spine_C";
	rename -uid "CAA98C98-4909-9FB8-4095-999191C025E5";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		0 87.590568542480469 -3.6890277862548824
		0 97.770912170410298 -3.6428541342417438
		0 107.95125579834011 -3.5966804822286056
		0 118.13159942626996 -3.5505068302154665
		;
createNode parentConstraint -n "CRV_spine_C_parentConstraint1" -p "CRV_spine_C";
	rename -uid "1F65A375-48A6-E434-797E-D9BA9B5953A3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "GRP_template_bipedW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 0 102.86108398437521 -3.6197673082351747 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "CRV_spine_C_scaleConstraint1" -p "CRV_spine_C";
	rename -uid "D38D08B8-4973-BFA0-6D22-18BCC6D8EA37";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "GRP_template_bipedW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "GRP_template_clavicles" -p "TPL_CTRL_scale";
	rename -uid "615A8A3C-4BAC-2F38-131C-30BB9408316D";
	setAttr ".rp" -type "double3" 0 118.13159942626953 -3.5505068302154541 ;
	setAttr ".sp" -type "double3" 0 118.13159942626953 -3.5505068302154541 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode transform -n "GRP_template_clavicle_L" -p "GRP_template_clavicles";
	rename -uid "42A4B2D1-459F-2CBF-77E3-35BFF2284959";
	setAttr ".rp" -type "double3" 8.6750726699829102 115.13230133056641 -2.5688729286193848 ;
	setAttr ".sp" -type "double3" 8.6750726699829102 115.13230133056641 -2.5688729286193848 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode joint -n "TPL_clavicle_01_L" -p "GRP_template_clavicle_L";
	rename -uid "69628C2D-4A85-CBAF-0AD0-57894E27B6CE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 1.6087983753036434 115.47028079490174 0.93635386846764446 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -2.4535042406694272 -63.616280211852498 -4.4732970992038872e-16 ;
	setAttr ".bps" -type "matrix" 0.44438065074382782 -0.1555606473305666 0.8822282710538053 0
		 0.038349610420078582 0.98720833675072661 0.15475466787948997 0 -0.895016840414257 -0.034936869521439734 0.44466197332684232 0
		 1.6087983753036406 115.47028079490164 0.93635386846764668 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "clavicle";
	setAttr ".liw" yes;
createNode joint -n "TPL_clavicle_02_L" -p "TPL_clavicle_01_L";
	rename -uid "67CC384F-4073-5F60-6089-9B9A6FC2836F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -1.9031331399688156e-08 3.2395186622125038e-07 -7.8951299815122873 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.44438065074382782 -0.1555606473305666 0.8822282710538053 0
		 0.038349610420078582 0.98720833675072661 0.15475466787948997 0 -0.895016840414257 -0.034936869521439734 0.44466197332684232 0
		 1.6087983753036406 115.47028079490164 0.93635386846764668 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "clavicle";
	setAttr ".liw" yes;
createNode joint -n "TPL_scapula_01_L" -p "TPL_clavicle_01_L";
	rename -uid "7737A3CB-47D0-5D99-5121-AD9C8D51F6BE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -0.85145105253149311 1.2789769243681803e-13 -8.2480366476174396 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 142.56066782036723 0 ;
	setAttr ".bps" -type "matrix" 0.44438065074382782 -0.1555606473305666 0.8822282710538053 0
		 0.038349610420078582 0.98720833675072661 0.15475466787948997 0 -0.895016840414257 -0.034936869521439734 0.44466197332684232 0
		 1.6087983753036406 115.47028079490164 0.93635386846764668 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "clavicle";
	setAttr ".liw" yes;
createNode joint -n "TPL_scapula_02_L" -p "TPL_scapula_01_L";
	rename -uid "196986C6-4937-D01A-252F-3FBFB9E6D217";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -1.903132580693967e-08 3.239517661962274e-07 -6.5663334171724674 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 0.44438065074382782 -0.1555606473305666 0.8822282710538053 0
		 0.038349610420078582 0.98720833675072661 0.15475466787948997 0 -0.895016840414257 -0.034936869521439734 0.44466197332684232 0
		 1.6087983753036406 115.47028079490164 0.93635386846764668 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "clavicle";
	setAttr ".liw" yes;
createNode transform -n "GRP_template_clavicle_R" -p "GRP_template_clavicles";
	rename -uid "D9CCAF7F-4869-443A-C3AC-74A50D71D508";
	setAttr ".rp" -type "double3" -8.6750698089599609 115.13200378417969 -2.5688700675964355 ;
	setAttr ".sp" -type "double3" -8.6750698089599609 115.13200378417969 -2.5688700675964355 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode joint -n "TPL_clavicle_01_R" -p "GRP_template_clavicle_R";
	rename -uid "06170D4B-4833-9DA0-F87F-788710BF54C2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -1.6088 115.47 0.936354 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 177.54649575933036 63.616280211852498 0 ;
	setAttr ".bps" -type "matrix" 0.44438065074382782 -0.1555606473305666 0.8822282710538053 0
		 0.038349610420078582 0.98720833675072661 0.15475466787948997 0 -0.895016840414257 -0.034936869521439734 0.44466197332684232 0
		 1.6087983753036406 115.47028079490164 0.93635386846764668 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "clavicle";
	setAttr ".liw" yes;
createNode joint -n "TPL_clavicle_02_R" -p "TPL_clavicle_01_R";
	rename -uid "F7EC04CB-4301-1D74-B21D-2CA90265C92E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -5.7823333010631472e-07 2.0410796764736006e-05 7.8951257749740176 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.44438065074382782 -0.1555606473305666 0.8822282710538053 0
		 0.038349610420078582 0.98720833675072661 0.15475466787948997 0 -0.895016840414257 -0.034936869521439734 0.44466197332684232 0
		 1.6087983753036406 115.47028079490164 0.93635386846764668 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "clavicle";
	setAttr ".liw" yes;
createNode joint -n "TPL_scapula_01_R" -p "TPL_clavicle_01_R";
	rename -uid "580027E8-45C0-8AF0-108D-8B8478DDEC00";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 0.85145596436046933 -8.7108233216781628e-05 8.2480316365205084 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -4.8344431158245452e-13 142.56066782036723 -1.526666247102488e-13 ;
	setAttr ".bps" -type "matrix" 0.44438065074382782 -0.1555606473305666 0.8822282710538053 0
		 0.038349610420078582 0.98720833675072661 0.15475466787948997 0 -0.895016840414257 -0.034936869521439734 0.44466197332684232 0
		 1.6087983753036406 115.47028079490164 0.93635386846764668 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "clavicle";
	setAttr ".liw" yes;
createNode joint -n "TPL_scapula_02_R" -p "TPL_scapula_01_R";
	rename -uid "67FDD3CC-4465-ED42-623F-15806E969D59";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -7.0094108739482408e-08 0.00018926556931830874 6.566325354745878 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".bps" -type "matrix" 0.44438065074382782 -0.1555606473305666 0.8822282710538053 0
		 0.038349610420078582 0.98720833675072661 0.15475466787948997 0 -0.895016840414257 -0.034936869521439734 0.44466197332684232 0
		 1.6087983753036406 115.47028079490164 0.93635386846764668 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "clavicle";
	setAttr ".liw" yes;
createNode transform -n "GRP_template_arms" -p "TPL_CTRL_scale";
	rename -uid "765F4092-4971-A0F1-BB1F-63A6D2F6797A";
	setAttr ".rp" -type "double3" 0 118.13159942626953 -3.5505068302154541 ;
	setAttr ".sp" -type "double3" 0 118.13159942626953 -3.5505068302154541 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode transform -n "GRP_template_arm_L" -p "GRP_template_arms";
	rename -uid "DE77F7C0-4F8E-6EA0-46DD-738D4F9D4DE7";
	setAttr ".rp" -type "double3" 8.6750726699829102 115.13230133056641 -2.5688729286193848 ;
	setAttr ".sp" -type "double3" 8.6750726699829102 115.13230133056641 -2.5688729286193848 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode joint -n "TPL_shoulder_L" -p "GRP_template_arm_L";
	rename -uid "7118A7EA-4E9A-F059-ED06-D5B7407EFFFB";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".t" -type "double3" 8.6750727174048468 115.13230100445371 -2.5688729308988814 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".jo" -type "double3" -91.416535927521196 -0.062269854238076107 -90.6713912198597 ;
	setAttr ".sd" 3;
	setAttr ".radi" 2;
createNode joint -n "TPL_elbow_L" -p "TPL_shoulder_L";
	rename -uid "5A13A671-46AC-4A29-0926-0788AFB344E0";
	setAttr ".t" -type "double3" -1.4210854715202004e-14 3.5527136788005009e-15 21.743197753392828 ;
	setAttr ".r" -type "double3" -9.4695100491374353e-13 -2.698577683629174e-26 2.9928390580521735e-27 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".jo" -type "double3" 7.6308586289615121 0 0 ;
	setAttr ".pa" -type "double3" -1.0043614437949063e-12 -2.8625852788892793e-26 3.1747136187272129e-27 ;
	setAttr ".sd" 3;
	setAttr ".radi" 2;
createNode joint -n "TPL_wrist_L" -p "TPL_elbow_L";
	rename -uid "FC5159C4-4045-1293-5B6F-CB9B4CF63474";
	setAttr ".t" -type "double3" 5.5511151231257827e-14 7.1054273576010019e-15 22.428958812274463 ;
	setAttr ".s" -type "double3" 0.99624431126765145 0.99624431126765145 0.99624431126765167 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".sd" 3;
	setAttr ".radi" 2;
createNode transform -n "LOC_pv_arm_L" -p "GRP_template_arm_L";
	rename -uid "A5DF711D-4840-1ED8-E870-768B02751B4A";
createNode locator -n "LOC_pv_arm_LShape" -p "LOC_pv_arm_L";
	rename -uid "9C9ED092-47BE-CAE1-F4F7-F1A60A62A401";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 2 2 2 ;
createNode parentConstraint -n "LOC_pv_arm_L_parentConstraint1" -p "LOC_pv_arm_L";
	rename -uid "84BF6E5B-4BAB-4214-524F-5EB9A8A47633";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "TMP_elbow_LW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 8.7974810085711397e-05 17.525550465954794 -1.9080907785925199 ;
	setAttr ".tg[0].tor" -type "double3" -6.0805707632718287 -83.75038121527875 96.17928641123035 ;
	setAttr ".lr" -type "double3" -3.8166656177562208e-14 -1.9083328088781101e-14 6.3611093629270422e-15 ;
	setAttr ".rst" -type "double3" 30.410125732421882 114.85776519775391 -20.735485076904293 ;
	setAttr ".rsrr" -type "double3" -2.5444437451708134e-14 6.3611093629270367e-15 1.2722218725854065e-14 ;
	setAttr -k on ".w0";
createNode transform -n "GRP_template_arm_R" -p "GRP_template_arms";
	rename -uid "E0B6BEDA-4AF2-01BD-28C0-E49EA37F18C4";
	setAttr ".rp" -type "double3" -8.6750698089599609 115.13200378417969 -2.5688700675964355 ;
	setAttr ".sp" -type "double3" -8.6750698089599609 115.13200378417969 -2.5688700675964355 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode joint -n "TPL_shoulder_R" -p "GRP_template_arm_R";
	rename -uid "A2F0F76E-4E6C-1D3B-2873-69ADDE4EE6A1";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".t" -type "double3" -8.67507 115.132 -2.56887 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".jo" -type "double3" 88.583464072478819 0.062269854238050662 90.6713912198597 ;
	setAttr ".sd" 3;
	setAttr ".radi" 2;
createNode joint -n "TPL_elbow_R" -p "TPL_shoulder_R";
	rename -uid "722E0709-4A6A-F1A9-89FB-128D9BE5ABEE";
	setAttr ".t" -type "double3" 0.0002866585258516352 -3.6651220494121617e-06 -21.743170675382498 ;
	setAttr ".r" -type "double3" -9.4695100491374353e-13 -2.698577683629174e-26 2.9928390580521735e-27 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".jo" -type "double3" 7.6308586289614357 -2.9523860024153171e-15 -2.5774354116508965e-16 ;
	setAttr ".pa" -type "double3" -1.0043614437949063e-12 -2.8625852788892793e-26 3.1747136187272129e-27 ;
	setAttr ".sd" 3;
	setAttr ".radi" 2;
createNode joint -n "TPL_wrist_R" -p "TPL_elbow_R";
	rename -uid "CE469D9D-4EF1-ECED-9BEF-E093E73C4628";
	setAttr ".t" -type "double3" -0.00036612795315704716 -4.2111494114038805e-06 -22.428997966581754 ;
	setAttr ".s" -type "double3" 0.99624431126765145 0.99624431126765145 0.99624431126765167 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".sd" 3;
	setAttr ".radi" 2;
createNode transform -n "LOC_pv_arm_R" -p "GRP_template_arm_R";
	rename -uid "DEC47BB1-42C3-3C00-66F6-5D9E256844D8";
createNode locator -n "LOC_pv_arm_RShape" -p "LOC_pv_arm_R";
	rename -uid "796A305A-4EF7-3997-8D32-C5B513EF3495";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 2 2 2 ;
createNode parentConstraint -n "LOC_pv_arm_R_parentConstraint1" -p "LOC_pv_arm_R";
	rename -uid "DE519AB3-4ABD-A078-CBB5-B485A03610EC";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "TMP_elbow_RW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -7.361469832289913e-05 -17.525552929768537 
		1.9080645406470289 ;
	setAttr ".tg[0].tor" -type "double3" 173.91942923672806 -83.750381215278821 96.179286411230422 ;
	setAttr ".lr" -type "double3" -3.8166656177562201e-14 -3.1805546814635168e-15 1.0593375115320381e-30 ;
	setAttr ".rst" -type "double3" -30.410125732421875 114.85776519775388 -20.735485076904293 ;
	setAttr ".rsrr" -type "double3" -3.8166656177562201e-14 -3.1805546814635168e-15 
		1.0593375115320381e-30 ;
	setAttr -k on ".w0";
createNode transform -n "GRP_template_legs" -p "TPL_CTRL_scale";
	rename -uid "62A5B979-4ABE-139C-0C6D-D0B5A604B74E";
	setAttr ".rp" -type "double3" 0 87.590568542480469 -3.6890277862548828 ;
	setAttr ".sp" -type "double3" 0 87.590568542480469 -3.6890277862548828 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode transform -n "GRP_template_leg_L" -p "GRP_template_legs";
	rename -uid "CE80825F-4E46-2838-7274-C88129E5FD6B";
	setAttr ".rp" -type "double3" 5.6032624244689941 85.27337646484375 -0.97596657276153564 ;
	setAttr ".sp" -type "double3" 5.6032624244689941 85.27337646484375 -0.97596657276153564 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode joint -n "TPL_femur_L" -p "GRP_template_leg_L";
	rename -uid "906C9976-4D14-9D7A-FBD3-E5A20610E13F";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".t" -type "double3" 5.6032622618673429 85.273375876841712 -0.97596655710508085 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".jo" -type "double3" 90 0 0 ;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "";
	setAttr ".radi" 2;
createNode joint -n "TPL_knee_L" -p "TPL_femur_L";
	rename -uid "83E098B2-49B7-13CB-6D09-9ABB72317E58";
	setAttr ".t" -type "double3" 1.1546319456101628e-14 2.19824158875781e-14 38.419522651916736 ;
	setAttr ".r" -type "double3" 0 -4.0082969751216774e-19 4.5774840621174698e-18 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".jo" -type "double3" 5.5565009880694847 0 0 ;
	setAttr ".sd" 3;
	setAttr ".radi" 2;
createNode joint -n "TPL_ankle_L" -p "TPL_knee_L";
	rename -uid "8AD1CDAE-41B5-1B2E-76CE-949ABD6D94E2";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".t" -type "double3" -1.4033219031261979e-13 8.3932860661661834e-14 37.188400034512448 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".sd" 3;
	setAttr ".radi" 2;
createNode transform -n "LOC_pv_leg_L" -p "GRP_template_leg_L";
	rename -uid "B9245BE6-4310-C806-BBFC-67B5721F610D";
createNode locator -n "LOC_pv_leg_LShape" -p "LOC_pv_leg_L";
	rename -uid "E892BF2A-469E-DC88-048C-FA85D45A55E9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 2 2 2 ;
createNode parentConstraint -n "LOC_pv_leg_L_parentConstraint1" -p "LOC_pv_leg_L";
	rename -uid "D04F0F5A-4C5E-39C5-E277-1EBE65AA1268";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "TPL_knee_LW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 0.011765179921821023 33.676761229189445 -3.2876987418153405 ;
	setAttr ".tg[0].tor" -type "double3" -95.556500988069487 0 0 ;
	setAttr ".lr" -type "double3" -1.2722218725854067e-14 0 0 ;
	setAttr ".rst" -type "double3" 5.6150274417891755 46.865274058334741 32.860893218431677 ;
	setAttr ".rsrr" -type "double3" -1.2722218725854067e-14 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "GRP_template_leg_R" -p "GRP_template_legs";
	rename -uid "DEEE0035-417F-12F8-C641-8790D94C4868";
	setAttr ".rp" -type "double3" -5.6032600402832031 85.273399353027344 -0.97596698999404907 ;
	setAttr ".sp" -type "double3" -5.6032600402832031 85.273399353027344 -0.97596698999404907 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode joint -n "TPL_femur_R" -p "GRP_template_leg_R";
	rename -uid "B40C7AE9-4898-7CD7-9D95-7588B27800AC";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".t" -type "double3" -5.60326 85.2734 -0.975967 ;
	setAttr ".r" -type "double3" 0 5.1456701612102483e-16 2.1213267794354264e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".jo" -type "double3" -90 0 0 ;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "";
	setAttr ".radi" 2;
createNode joint -n "TPL_knee_R" -p "TPL_femur_R";
	rename -uid "D4395B44-4E6E-693A-7470-389EE242DD60";
	setAttr ".t" -type "double3" -3.8240431265990082e-08 4.9504366561592406e-07 -38.419556925321558 ;
	setAttr ".r" -type "double3" 0 -4.0082969751216774e-19 4.5774840621174698e-18 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".jo" -type "double3" 5.5565009880695282 0 0 ;
	setAttr ".sd" 3;
	setAttr ".radi" 2;
createNode joint -n "TPL_ankle_R" -p "TPL_knee_R";
	rename -uid "29C7A797-4D9D-1ADF-C7E1-398FCAECDE52";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".t" -type "double3" -3.7618152974872032e-06 -4.3484702514362539e-06 -37.1883943428846 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999933 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".sd" 3;
	setAttr ".radi" 2;
createNode transform -n "LOC_pv_leg_R" -p "GRP_template_leg_R";
	rename -uid "2E6460CA-47FE-FB5B-107C-C5ABED190B8C";
createNode locator -n "LOC_pv_leg_RShape" -p "LOC_pv_leg_R";
	rename -uid "7B729B1D-46CE-464F-C372-658DBF19DDC7";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 2 2 2 ;
createNode parentConstraint -n "LOC_pv_leg_R_parentConstraint1" -p "LOC_pv_leg_R";
	rename -uid "FEC90C4C-472C-DEF2-FECB-21A7FCF9BFDE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "TPL_knee_RW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -0.01174121454406496 -33.676893995617192 3.2874465039252527 ;
	setAttr ".tg[0].tor" -type "double3" 84.44349901193047 -2.0540233193779429e-07 -2.1113590853249942e-06 ;
	setAttr ".lr" -type "double3" -3.8200373834721627e-15 1.9888552001738661e-08 -2.0443718708874376e-07 ;
	setAttr ".rst" -type "double3" -5.6150000000000011 46.865 32.861000000000004 ;
	setAttr ".rsrr" -type "double3" -3.8200373834721659e-15 1.9888552001739044e-08 -2.0443718708874376e-07 ;
	setAttr -k on ".w0";
createNode transform -n "GRP_template_feet" -p "TPL_CTRL_scale";
	rename -uid "16FB9713-4589-38A1-A328-57BC09204514";
	setAttr ".rp" -type "double3" 3.9200919843551674e-07 4.3892143498927805 3.4195464555485895 ;
	setAttr ".sp" -type "double3" 3.9200919843551674e-07 4.3892143498927805 3.4195464555485895 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode transform -n "GRP_template_foot_L" -p "GRP_template_feet";
	rename -uid "E896A065-4283-FFEC-1629-CDA28F437928";
	setAttr ".rp" -type "double3" 5.6032624244689941 9.8401937484741211 -4.5768184661865234 ;
	setAttr ".sp" -type "double3" 5.6032624244689941 9.8401937484741211 -4.5768184661865234 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode joint -n "TPL_foot_ankle_L" -p "GRP_template_foot_L";
	rename -uid "C2C331FD-4ACF-FABA-5F7F-A18522555EE8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".ovrgb" -type "float3" 1 1 0 ;
	setAttr ".t" -type "double3" 5.6032624244689941 9.8401937484741211 -4.5768184661865234 ;
	setAttr ".r" -type "double3" 8.9012228585408734e-15 -2.4085527659944856e-16 -2.4085527659944856e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 -2.1213268155406708e-06 0 ;
	setAttr ".bps" -type "matrix" 0.99703134553914252 0 -0.076996727283740116 0 0 0.99999999999999845 0 0
		 0.076996727283740143 0 0.99703134553914274 0 5.3177203082224827 9.7756842117266647 -2.9646908354821062 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "foot_ankle";
	setAttr ".radi" 1.5;
createNode joint -n "TPL_toes_01_L" -p "|GRP_template_biped|TPL_CTRL_scale|GRP_template_feet|GRP_template_foot_L|TPL_foot_ankle_L";
	rename -uid "FD6F9576-480B-A24C-A8BC-1F9DBFEE128B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0 -6.8306036675116442 10.108275656802695 ;
	setAttr ".r" -type "double3" 1.2877519247409945e-14 -1.5902772911441865e-15 5.6163339797720854e-19 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0.02023496988897627 6.6643460073994358e-06 -1.8513264841537101e-25 ;
	setAttr ".pa" -type "double3" 78.529006795194093 -1.5902765067603937e-15 5.6160487055378512e-19 ;
	setAttr ".bps" -type "matrix" 0.99703133658327858 -3.2311742677852622e-27 -0.07699684325322155 0
		 2.7192731918961372e-05 0.99999993763658845 0.00035211840778132775 0 0.07699683845143579 -0.000353166841262984 0.99703127440500383 0
		 6.0960252655397174 2.945600386293691 7.1135766675678749 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "foot_toes";
	setAttr ".radi" 1.5;
createNode joint -n "TPL_toes_02_L" -p "TPL_toes_01_L";
	rename -uid "1414B430-4B5F-66B3-34B0-209F60DE2FDC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.7763566450366364e-15 -8.8817841970012523e-16 6.2641329179667009 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999922 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.99703133658327847 -3.2311742677852618e-27 -0.076996843253221536 0
		 2.7192731918961352e-05 0.99999993763658768 0.00035211840778132748 0 0.07699683845143579 -0.000353166841262984 0.99703127440500383 0
		 6.5783437011993415 2.942868258754149 13.35911320672599 1;
	setAttr ".sd" 3;
	setAttr ".radi" 1.5;
createNode joint -n "TPL_banking_outside_L" -p "GRP_template_foot_L";
	rename -uid "AB663106-4613-3B4F-A496-ABA991E6C1C4";
	setAttr ".t" -type "double3" 10.051552821641241 0 3.5739218661814833 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 90 0 ;
	setAttr ".radi" 0.5;
createNode joint -n "TPL_banking_inside_L" -p "TPL_banking_outside_L";
	rename -uid "B7AEDA11-4324-1CB6-AA51-4BA34CFC3976";
	setAttr ".t" -type "double3" 0.0014486939939870602 -0.00017941121722806494 -8.0782531809864793 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 180 0 ;
	setAttr ".radi" 0.6189567460154427;
createNode joint -n "TPL_banking_heel_L" -p "TPL_banking_inside_L";
	rename -uid "8214E4B7-43EB-C51D-A15E-51A5B4DEE141";
	setAttr ".t" -type "double3" -11.477054550477126 -0.00035653807259777837 -3.5977582435517168 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999922 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zyx";
	setAttr ".jo" -type "double3" 180 -90 1.3728063123499524e-08 ;
	setAttr ".radi" 1.3099973640702798;
createNode joint -n "TPL_spin_L" -p "TPL_banking_heel_L";
	rename -uid "25D01E70-40EA-08D0-9741-F09127839BB8";
	setAttr ".t" -type "double3" 1.7763568394002505e-15 -1.8939363658106168e-09 7.904624844740141 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zyx";
	setAttr ".jo" -type "double3" 0 0 -90 ;
	setAttr ".radi" 1.2015125318056872;
createNode joint -n "TPL_banking_toes_L" -p "TPL_spin_L";
	rename -uid "BAA9CD7C-4CD6-4E2B-DEC9-C886438C0CE5";
	setAttr ".t" -type "double3" -1.2049822945003896e-14 -2.3041177454885542e-06 13.739799021252546 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zyx";
	setAttr ".jo" -type "double3" -90 -9.6083092892443877e-06 -90 ;
	setAttr ".radi" 0.91881911510504155;
createNode joint -n "TPL_height_toes_L" -p "TPL_banking_toes_L";
	rename -uid "0CC0B667-46B5-6831-3044-F480C24C559E";
	setAttr ".t" -type "double3" 2.3189022790859326e-07 0.0049287145729017823 2.9409318710051635 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zyx";
	setAttr ".jo" -type "double3" -90 -2.1691711132199537e-05 1.9216618596916499e-05 ;
	setAttr ".radi" 1.0005846692181937;
createNode joint -n "TPL_toes_L" -p "TPL_height_toes_L";
	rename -uid "A0424684-43C3-D454-4051-72B424692AF5";
	setAttr ".t" -type "double3" 2.6645352591003757e-15 8.8817841970012523e-16 8.2082963682285683 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zyx";
	setAttr ".jo" -type "double3" 33.575186419643138 0 -3.2163888681088933e-05 ;
	setAttr ".radi" 0.87249558989160725;
createNode joint -n "TPL_foot_ankle_L" -p "TPL_toes_L";
	rename -uid "1DB80ED7-44DB-35B1-D10F-83AEFE445D65";
	setAttr ".t" -type "double3" 8.8817841970012523e-16 -4.4408920985006262e-15 12.199769957241033 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "none";
	setAttr ".radi" 0.87249558989160725;
createNode transform -n "GRP_template_foot_R" -p "GRP_template_feet";
	rename -uid "D433375D-46A5-434A-9022-EABF04A7CDAF";
	setAttr ".rp" -type "double3" -5.6032638549804688 9.8401889801025391 -4.5768146514892578 ;
	setAttr ".sp" -type "double3" -5.6032638549804688 9.8401889801025391 -4.5768146514892578 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode joint -n "TPL_foot_ankle_R" -p "GRP_template_foot_R";
	rename -uid "EBF36A31-452A-B852-5B75-8D87893A3276";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -5.6032638549804688 9.8401889801025391 -4.5768146514892578 ;
	setAttr ".r" -type "double3" 8.9012228585408734e-15 -2.4085527659944856e-16 -2.4085527659944856e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 179.99999914622634 4.2426536310813432e-06 0 ;
	setAttr ".bps" -type "matrix" 0.99703134553914252 0 -0.076996727283740116 0 0 0.99999999999999845 0 0
		 0.076996727283740143 0 0.99703134553914274 0 5.3177203082224827 9.7756842117266647 -2.9646908354821062 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "foot_ankle";
	setAttr ".radi" 1.5;
createNode joint -n "TPL_toes_01_R" -p "|GRP_template_biped|TPL_CTRL_scale|GRP_template_feet|GRP_template_foot_R|TPL_foot_ankle_R";
	rename -uid "CCCF7090-457E-DDF0-776E-40A89C32E428";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -7.4849995712611417e-07 6.8306001506249645 -10.108269898216101 ;
	setAttr ".r" -type "double3" 1.2877519247409945e-14 -1.5902772911441865e-15 5.6163339797720854e-19 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0.020235823612407628 5.4799699476208584e-13 -3.1029392282585326e-09 ;
	setAttr ".pa" -type "double3" 78.529006795194093 -1.5902765067603937e-15 5.6160487055378512e-19 ;
	setAttr ".bps" -type "matrix" 0.99703133658327858 -3.2311742677852622e-27 -0.07699684325322155 0
		 2.7192731918961372e-05 0.99999993763658845 0.00035211840778132775 0 0.07699683845143579 -0.000353166841262984 0.99703127440500383 0
		 6.0960252655397174 2.945600386293691 7.1135766675678749 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "foot_toes";
	setAttr ".radi" 1.5;
createNode joint -n "TPL_toes_02_R" -p "TPL_toes_01_R";
	rename -uid "73806FF2-4A3B-088D-07BB-21896BBAEB58";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -4.6384653717979063e-07 -2.2760743569882891e-06 -6.2641103898474402 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999922 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.99703133658327847 -3.2311742677852618e-27 -0.076996843253221536 0
		 2.7192731918961352e-05 0.99999993763658768 0.00035211840778132748 0 0.07699683845143579 -0.000353166841262984 0.99703127440500383 0
		 6.5783437011993415 2.942868258754149 13.35911320672599 1;
	setAttr ".sd" 3;
	setAttr ".radi" 1.5;
createNode joint -n "TPL_banking_outside_R" -p "GRP_template_foot_R";
	rename -uid "83EEE3AD-45D6-E044-9544-9290C3BB9B10";
	setAttr ".t" -type "double3" -10.0516 0 3.57392 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 -90 0 ;
	setAttr ".radi" 0.5;
createNode joint -n "TPL_banking_inside_R" -p "TPL_banking_outside_R";
	rename -uid "925C6022-49DA-EB5F-21D1-28999E4587DF";
	setAttr ".t" -type "double3" -0.0014500000000001734 0.00017941100000098931 8.0783 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 180 0 ;
	setAttr ".radi" 0.6189567460154427;
createNode joint -n "TPL_banking_heel_R" -p "TPL_banking_inside_R";
	rename -uid "EB70144D-449B-F9DD-63B8-4E9358F87066";
	setAttr ".t" -type "double3" 11.47705 0.00035653799999955937 3.5977599999999987 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999922 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zyx";
	setAttr ".jo" -type "double3" 180 -90 0 ;
	setAttr ".radi" 1.3099973640702798;
createNode joint -n "TPL_spin_R" -p "TPL_banking_heel_R";
	rename -uid "109474B9-4AEE-DB47-0F9F-1EBE27BDB61F";
	setAttr ".t" -type "double3" 0 2.0000009680071901e-09 -7.9046234665000004 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zyx";
	setAttr ".jo" -type "double3" 4.2373500461281523e-30 -4.2373500461281481e-30 -90.000000000000057 ;
	setAttr ".radi" 1.2015125318056872;
createNode joint -n "TPL_banking_toes_R" -p "TPL_spin_R";
	rename -uid "444C254D-4AAB-7FD0-A4C8-6CB4EC62E999";
	setAttr ".t" -type "double3" -1.6826817716975029e-15 2.6645352591003757e-15 -13.739756533500001 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zyx";
	setAttr ".jo" -type "double3" -90.000000000000028 -9.6083093362970968e-06 -89.999999999999943 ;
	setAttr ".radi" 0.91881911510504155;
createNode joint -n "TPL_height_toes_R" -p "TPL_banking_toes_R";
	rename -uid "9E25700E-4F7C-4AB5-B2E7-74A9E1B0D7B1";
	setAttr ".t" -type "double3" 8.2171336401870576e-10 -0.0049000000000010147 -2.9409359469999998 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zyx";
	setAttr ".jo" -type "double3" 89.999999999984468 -2.4750925009482273e-06 4.0908329777476298e-05 ;
	setAttr ".radi" 1.0005846692181937;
createNode joint -n "TPL_toes_R" -p "TPL_height_toes_R";
	rename -uid "09FED87A-4DC7-4DBB-2A1E-8A864F8AAAB9";
	setAttr ".t" -type "double3" -4.4840882482688471e-06 -2.035260848742837e-12 8.2082799999987728 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "zyx";
	setAttr ".jo" -type "double3" 146.42481358028201 -1.1349393198583082e-05 0.00010618491703387052 ;
	setAttr ".radi" 0.87249558989160725;
createNode joint -n "TPL_foot_ankle_R" -p "TPL_toes_R";
	rename -uid "253F681F-4351-A89F-B8E4-328B586C3C25";
	setAttr ".t" -type "double3" -6.3344885710137078e-06 11.242412216440851 -4.7373447244401952 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jot" -type "string" "none";
	setAttr ".jo" -type "double3" 67.150372839350226 3.4080015036632969e-05 5.1418242016985914e-05 ;
	setAttr ".radi" 0.87249558989160725;
createNode transform -n "GRP_template_hands" -p "TPL_CTRL_scale";
	rename -uid "4CB27214-4C8F-F845-1671-50B173B221DD";
	setAttr ".rp" -type "double3" 0 118.13159942626953 -3.5505068302154541 ;
	setAttr ".sp" -type "double3" 0 118.13159942626953 -3.5505068302154541 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode transform -n "GRP_template_hand_L" -p "GRP_template_hands";
	rename -uid "CF845E1B-4A30-A16E-B163-FE843807A3B0";
	setAttr ".rp" -type "double3" 52.705791473388672 114.61837768554688 -0.67849409580230713 ;
	setAttr ".sp" -type "double3" 52.705791473388672 114.61837768554688 -0.67849409580230713 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode joint -n "TPL_hand_L" -p "GRP_template_hand_L";
	rename -uid "0F1B1E52-4AED-DD58-8777-8BB229682D13";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 52.705791429738746 114.61838061476345 -0.678494074620277 ;
	setAttr ".r" -type "double3" 5.7249984266343308e-14 3.816665617756222e-14 -3.8166656177562182e-14 ;
	setAttr ".s" -type "double3" 0.99999999999999978 1 0.99999999999999989 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.99999999999999989 1.7347234759768071e-18 6.9388939039072284e-17 0
		 -6.9388939039072284e-18 0.99999999999999967 9.280770596475918e-17 0 -1.5265566588595902e-16 -8.7603535536828758e-17 1.0000000000000004 0
		 52.705791429738753 114.61838061476365 -0.67849407462019995 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "hand";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_metacarp_index_L" -p "TPL_hand_L";
	rename -uid "219E97EF-47DC-2684-110D-63843E13629F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 1.5002931444767071 -0.23522734830889647 1.8603520971788172 ;
	setAttr ".r" -type "double3" 5.960567814224925 -15.860528506119177 -2.7161923340653935 ;
	setAttr ".s" -type "double3" 1.0000000000000002 0.99999999999999989 0.99999999999999989 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 5.960567814224925 -15.860528506119177 -2.7161923340653935 ;
	setAttr ".bps" -type "matrix" 0.96084910722804473 -0.045584646307762371 0.27329660290619512 0
		 0.018784217643984434 0.99482109735408308 0.099890627321688602 0 -0.27643470532220371 -0.090846157212142106 0.95672923516176422 0
		 54.206084574215453 114.38315326645488 1.181858022558627 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "metacarp_index";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_index_base_L" -p "TPL_metacarp_index_L";
	rename -uid "54DBE2B9-45D8-990C-24A2-40A7FD5A5E9C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 6.0764047222956776 -8.5265128291212022e-14 -1.4210854715202004e-14 ;
	setAttr ".r" -type "double3" 179.99999999999966 84.253534112089994 178.89487357961929 ;
	setAttr ".s" -type "double3" 0.99999999999999922 0.99999999999999978 0.99999999999999933 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 179.99999999999966 84.253534112089994 178.89487357961929 ;
	setAttr ".bps" -type "matrix" 0.17889306653184267 0.096874150598625336 -0.97908767211758352 0
		 0.037312523044092334 0.99375686469007751 0.10514309062144865 0 0.98316074289554345 -0.055341601233980367 0.17416159393488945 0
		 60.044592626789537 114.10616250636612 2.8425187910451726 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_index_base";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_index_01_L" -p "TPL_index_base_L";
	rename -uid "2A0BB299-4169-A6FD-017A-0EB7A8CA35E0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -6.0396132539608516e-14 -1.5475019728557663e-17 4.4603707573175759 ;
	setAttr ".r" -type "double3" -5.1882798241373606e-14 -1.5902773407317584e-15 7.9513867036587919e-16 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" -5.1882798241373606e-14 -1.5902773407317584e-15 7.9513867036587919e-16 ;
	setAttr ".bps" -type "matrix" 0.17889306653184284 0.096874150598625419 -0.97908767211758441 0
		 0.037312523044092348 0.99375686469007796 0.10514309062144869 0 0.98316074289554434 -0.055341601233980416 0.17416159393488961 0
		 64.429854054143419 113.85931844655894 3.6193440716802292 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_index_phalanx_1";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_index_02_L" -p "TPL_index_01_L";
	rename -uid "1DF25874-4D57-F10B-B8C8-E5B4AC3F8EBE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -6.5033368826246146e-17 -1.4235242228511846e-14 2.343074044900241 ;
	setAttr ".r" -type "double3" -5.188279824137365e-14 -3.1805546814635211e-15 1.5902773407317606e-15 ;
	setAttr ".s" -type "double3" 0.99999999999999878 0.99999999999999944 0.99999999999999956 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" -5.188279824137365e-14 -3.1805546814635211e-15 1.5902773407317606e-15 ;
	setAttr ".bps" -type "matrix" 0.17889306653184261 0.096874150598625294 -0.97908767211758319 0
		 0.03731252304409232 0.99375686469007718 0.10514309062144861 0 0.98316074289554367 -0.055341601233980381 0.1741615939348895 0
		 66.733472472786801 113.72964897710438 4.027417582047522 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_index_phalanx_2";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_index_03_L" -p "TPL_index_02_L";
	rename -uid "12C6D581-4B75-EFF5-2EC7-83B5A8A43B04";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -6.605673664824059e-16 -1.5602122109397354e-15 2.0494475643461834 ;
	setAttr ".r" -type "double3" -5.188279824137365e-14 -3.1805546814635211e-15 1.5902773407317606e-15 ;
	setAttr ".s" -type "double3" 0.99999999999999878 0.99999999999999944 0.99999999999999956 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" -5.188279824137365e-14 -3.1805546814635211e-15 1.5902773407317606e-15 ;
	setAttr ".bps" -type "matrix" 0.17889306653184261 0.096874150598625294 -0.97908767211758319 0
		 0.03731252304409232 0.99375686469007718 0.10514309062144861 0 0.98316074289554367 -0.055341601233980381 0.1741615939348895 0
		 66.733472472786801 113.72964897710438 4.027417582047522 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_index_phalanx_2";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_metacarp_thumb_L" -p "TPL_hand_L";
	rename -uid "616EA82F-46D4-061C-54BD-ACB1182B1851";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 3.1592085702612778 -1.1363806147637945 2.5524940746201921 ;
	setAttr ".r" -type "double3" 41.121999999999979 -12.908363018476718 1.3419999999999843 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.97446123945655971 0.022828316305537485 0.22339239192828353 0
		 -0.16451963300539307 0.74966346902009107 0.64104443962375479 0 -0.15283515025201574 -0.6614253935187373 0.734273699417341 0
		 55.865000000000023 113.48199999999999 1.8740000000000023 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "metacarp_thumb";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_thumb_base_L" -p "TPL_metacarp_thumb_L";
	rename -uid "894AFEAB-459E-E442-D694-B68CBBD8953F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 3.1472775667635275 0.045155290914905777 3.1705695778866811 ;
	setAttr ".r" -type "double3" 23.365354476313325 52.025306897510617 16.588477151550599 ;
	setAttr ".s" -type "double3" 1.0000000000000002 0.99999999999999989 1.0000000000000002 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".bps" -type "matrix" 0.6662199601721136 0.6665449229849959 -0.33446798099548153 0
		 -0.16014878519277453 0.56590482743447068 0.8087670201532956 0 0.72835659622848681 -0.48525209111274059 0.48376345128705883 0
		 58.439896588911871 111.49060308909502 4.9340902650770779 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_thumb_base";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_thumb_01_L" -p "TPL_thumb_base_L";
	rename -uid "D53B3AA8-4664-2967-9A59-0DAB50DBE771";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -1.2803696259681902e-13 7.815970093361102e-14 2.5088681627369542 ;
	setAttr ".r" -type "double3" 9.541664044390555e-15 0 0 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999956 0.99999999999999967 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".bps" -type "matrix" 0.66621996017211327 0.66654492298499557 -0.33446798099548136 0
		 -0.16014878519277451 0.56590482743447057 0.80876702015329538 0 0.72835659622848636 -0.48525209111274031 0.48376345128705855 0
		 60.267247264308892 110.2731695668007 6.147788986307015 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_thumb_phalanx_1";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_thumb_02_L" -p "TPL_thumb_01_L";
	rename -uid "D40C2FF8-4EFE-0F77-3ECB-48A9A3C089B5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -2.8356371061198282e-14 -2.1316282072802999e-14 2.354062841663251 ;
	setAttr ".r" -type "double3" 9.541664044390555e-15 0 0 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999956 0.99999999999999967 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".bps" -type "matrix" 0.66621996017211327 0.66654492298499557 -0.33446798099548136 0
		 -0.16014878519277451 0.56590482743447057 0.80876702015329538 0 0.72835659622848636 -0.48525209111274031 0.48376345128705855 0
		 60.267247264308892 110.2731695668007 6.147788986307015 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_thumb_phalanx_1";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_metacarp_middle_L" -p "TPL_hand_L";
	rename -uid "80ED97E9-4AF9-81D4-5D91-C8AFFE8DB080";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 1.7189820493493073 -0.16335849012979509 1.1034787210473032 ;
	setAttr ".r" -type "double3" -5.7987973254716803 11.326386550578322 2.8722707572805 ;
	setAttr ".s" -type "double3" 0.99999999999999944 0.99999999999999933 0.99999999999999911 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 5.9605678142249312 -15.86052850611919 -2.7161923340653935 ;
	setAttr ".pa" -type "double3" -5.7987973254716687 11.326386550578313 2.8722707572805057 ;
	setAttr ".bps" -type "matrix" 0.99616641703696995 0.022080486649248211 0.084645860365745812 0
		 -0.020911983824155236 0.99967373673002191 -0.01466659554127385 0 -0.084942089097591905 0.012840257067730995 0.99630315130394487 0
		 54.424773479088053 114.45502212463398 0.42498464642710754 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "metacarp_middle";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_middle_base_L" -p "TPL_metacarp_middle_L";
	rename -uid "7285950D-4020-AAB5-FE48-9CB7AC68F3C1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 6.1905342155186531 4.2632564145606011e-14 1.5543122344752192e-14 ;
	setAttr ".r" -type "double3" 2.3362162882198331e-12 89.951247990536345 -4.1986099883699293 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1 1.0000000000000007 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 5.6069190917288264e-12 89.951247990536359 -4.1986099883709658 ;
	setAttr ".bps" -type "matrix" 0.085788707341970624 -0.01288379115432596 -0.996230046534478 0
		 0.052077468662238086 0.99860746684118318 -0.0084299719316549004 0 0.99495137315867344 -0.051157942633833421 0.086340198952435138 0
		 60.59157576810604 114.59171213273152 0.94898774122328877 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_middle_base";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_middle_01_L" -p "TPL_middle_base_L";
	rename -uid "BC1B8A81-415A-99D1-40C8-EEA336E2BDFE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 7.9936057773011255e-15 -5.8262436178999862e-13 4.7688368941490813 ;
	setAttr ".r" -type "double3" 3.2473401177533912e-12 -1.5902773407317602e-15 4.9696166897867499e-16 ;
	setAttr ".s" -type "double3" 0.999999999999999 0.99999999999999922 0.99999999999999911 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 2.2151072471386484e-12 1.4113711398994362e-14 -7.9513867036587959e-16 ;
	setAttr ".bps" -type "matrix" 0.085788707341970499 -0.012883791154325941 -0.99623004653447655 0
		 0.052077468662238044 0.9986074668411824 -0.0084299719316548935 0 0.99495137315867188 -0.051157942633833345 0.086340198952434999 0
		 65.336336584309379 114.34774824846994 1.3607300674358334 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_middle_phalanx_1";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_middle_02_L" -p "TPL_middle_01_L";
	rename -uid "0FAE6A87-4605-57E4-3C3C-D08D8FD2BE34";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 1.3801584850716846e-14 1.2241176104848349e-17 2.5089982529705144 ;
	setAttr ".r" -type "double3" 3.2476879909216741e-12 -2.3854160110976364e-15 2.9817700138720455e-16 ;
	setAttr ".s" -type "double3" 1.0000000000000004 0.99999999999999989 1.0000000000000007 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 2.2151320952220938e-12 1.4312496066585818e-14 -7.951386703658788e-16 ;
	setAttr ".bps" -type "matrix" 0.085788707341970638 -0.012883791154325962 -0.99623004653447811 0
		 0.052077468662238079 0.99860746684118307 -0.0084299719316548987 0 0.99495137315867344 -0.051157942633833421 0.086340198952435138 0
		 67.832667841355118 114.21939305977608 1.577357475768606 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_middle_phalanx_2";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_middle_03_L" -p "TPL_middle_02_L";
	rename -uid "886F82EE-45A5-C2B8-DD5D-7485D4DD5A52";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 2.6960980674550212e-15 -7.1044410198399181e-14 2.274340031116004 ;
	setAttr ".r" -type "double3" 3.2476879909216741e-12 -2.3854160110976364e-15 2.9817700138720455e-16 ;
	setAttr ".s" -type "double3" 1.0000000000000004 0.99999999999999989 1.0000000000000007 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 2.2151320952220938e-12 1.4312496066585818e-14 -7.951386703658788e-16 ;
	setAttr ".bps" -type "matrix" 0.085788707341970638 -0.012883791154325962 -0.99623004653447811 0
		 0.052077468662238079 0.99860746684118307 -0.0084299719316548987 0 0.99495137315867344 -0.051157942633833421 0.086340198952435138 0
		 67.832667841355118 114.21939305977608 1.577357475768606 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_middle_phalanx_2";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_metacarp_ring_L" -p "TPL_hand_L";
	rename -uid "D59B8C9D-445C-8F65-035E-1EB6B6D8AEBF";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 1.7849836951626727 -0.17333561817252985 0.32933190627423842 ;
	setAttr ".r" -type "double3" -7.0764960938697978 10.682774927521747 -2.0889210877187181 ;
	setAttr ".s" -type "double3" 1.0000000000000002 0.99999999999999989 1.0000000000000007 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.84339121949853812 -4.8556607717288722 1.2697793727417335 ;
	setAttr ".pa" -type "double3" -7.0764960938697925 10.682774927521772 -2.0889210877187159 ;
	setAttr ".bps" -type "matrix" 0.99474576767438061 -0.016503881867032454 -0.1010370208251779 0
		 0.0028268372402334534 0.99097202606044943 -0.1340389964035256 0 0.10233702499645776 0.13304910916261767 0.98581188259520958 0
		 54.490775124901432 114.44504499659128 -0.34916216834595437 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "metacarp_ring";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_ring_base_L" -p "TPL_metacarp_ring_L";
	rename -uid "6A9C3604-41F4-8F6D-C039-769A15BD1AB6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 6.3110829948047638 -1.4210854715202004e-14 -1.4210854715202004e-14 ;
	setAttr ".r" -type "double3" 0 83.020827949486176 -3.3130060429673014 ;
	setAttr ".s" -type "double3" 0.99999999999999889 0.99999999999999956 0.99999999999999944 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 6.5438918496188701e-15 83.020827949486176 -3.3130060429673396 ;
	setAttr ".bps" -type "matrix" 0.019069489815693827 -0.14102393930161475 -0.98982251090891193 0
		 0.060309114669702048 0.98836206823832662 -0.13965397507916844 0 0.99799757777558029 -0.057032189257564578 0.027352589321003026 0
		 60.768698223425226 114.34088762839197 -0.98681519232148374 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_ring_base";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_ring_01_L" -p "TPL_ring_base_L";
	rename -uid "EF72130E-49D6-233B-E4BC-56BCA9681F24";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -2.3092638912203256e-14 1.4210854715202004e-14 4.1790498642579701 ;
	setAttr ".r" -type "double3" 1.7890620083232288e-15 1.590277340731757e-15 0 ;
	setAttr ".s" -type "double3" 1.0000000000000009 0.99999999999999967 1.0000000000000004 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" -3.0314661807699136e-14 1.6697912077683451e-14 3.975693351829394e-16 ;
	setAttr ".bps" -type "matrix" 0.019069489815693865 -0.14102393930161503 -0.98982251090891393 0
		 0.060309114669702048 0.98836206823832662 -0.13965397507916844 0 0.9979975777755814 -0.05703218925756464 0.027352589321003058 0
		 64.939379865358035 114.10254726561683 -0.8725073576324156 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_ring_phalanx_1";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_ring_02_L" -p "TPL_ring_01_L";
	rename -uid "DA8DAC9C-417B-EC31-CA05-67822D93B975";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 1.9539925233402752e-14 -9.9485598731054628e-14 2.2172351441061626 ;
	setAttr ".r" -type "double3" 2.0872390097104338e-15 1.3914926731402904e-15 -1.5902773407317606e-15 ;
	setAttr ".s" -type "double3" 0.99999999999999878 0.99999999999999956 0.99999999999999933 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 86.064839279325241 1.7493050748049363e-14 3.9756933518294004e-16 ;
	setAttr ".bps" -type "matrix" 0.019069489815693823 -0.14102393930161472 -0.98982251090891182 0
		 0.060309114669702048 0.98836206823832662 -0.13965397507916844 0 0.99799757777558029 -0.057032189257564578 0.027352589321003026 0
		 67.152175168534868 113.97609349124953 -0.81186023530758666 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_ring_phalanx_2";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_ring_03_L" -p "TPL_ring_02_L";
	rename -uid "62B193A4-4ABB-7538-8CAA-A6A97FB708E8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 1.4759244174045156e-15 -7.10528912182401e-14 2.0129021044693958 ;
	setAttr ".r" -type "double3" 2.0872390097104338e-15 1.3914926731402904e-15 -1.5902773407317606e-15 ;
	setAttr ".s" -type "double3" 0.99999999999999878 0.99999999999999956 0.99999999999999933 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 86.064839279325241 1.7493050748049363e-14 3.9756933518294004e-16 ;
	setAttr ".bps" -type "matrix" 0.019069489815693823 -0.14102393930161472 -0.98982251090891182 0
		 0.060309114669702048 0.98836206823832662 -0.13965397507916844 0 0.99799757777558029 -0.057032189257564578 0.027352589321003026 0
		 67.152175168534868 113.97609349124953 -0.81186023530758666 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_ring_phalanx_2";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_metacarp_pinky_L" -p "TPL_hand_L";
	rename -uid "B0A11880-4DFB-5FE2-DF30-4591840A627B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 1.7092464302883741 -0.27180218608670259 -0.40024466360332833 ;
	setAttr ".r" -type "double3" -3.9660494943554374 8.0528275871876893 -2.3895557486035597 ;
	setAttr ".s" -type "double3" 0.99999999999999911 0.99999999999999944 0.99999999999999878 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -7.7429175799748124 5.7988898640329847 -0.95051022927565954 ;
	setAttr ".pa" -type "double3" -3.9660494943554423 8.0528275871876733 -2.389555748603557 ;
	setAttr ".bps" -type "matrix" 0.96962775936405921 -0.075874965435504232 -0.23251881190732526 0
		 0.0275556980164464 0.97850120622961134 -0.20439195902486165 0 0.24302817074870015 0.19177689909724582 0.95087271976599708 0
		 54.415037860027127 114.34657842867713 -1.078738738223525 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "metacarp_pinky";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_pinky_base_L" -p "TPL_metacarp_pinky_L";
	rename -uid "28D86C3D-4313-49CF-4EF5-48BA73DBE329";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 6.540843359070152 1.2789769243681803e-13 1.4210854715202004e-14 ;
	setAttr ".r" -type "double3" -3.1572087324157557e-14 81.308789750746925 -1.6030492101774774 ;
	setAttr ".s" -type "double3" 1.0000000000000013 1.0000000000000002 1.0000000000000009 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 0 81.308789750746925 -1.6030492101774845 ;
	setAttr ".bps" -type "matrix" -0.093891677067360152 -0.2051720299862341 -0.97421188203019304 0
		 0.054670091698938002 0.97599565816543388 -0.21081664145852366 0 0.99408024527756855 -0.073054180945034602 -0.080421095462209879 0
		 60.757221150633598 113.85029216488873 -2.5996078649464254 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_pinky_base";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_pinky_01_L" -p "TPL_pinky_base_L";
	rename -uid "157D8FDD-46E6-F201-98A0-C3998A8C712F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 9.6445277816210636e-17 -1.1366272640216195e-13 3.4748073378778406 ;
	setAttr ".r" -type "double3" -1.9679682091555526e-14 -2.3854160110976407e-15 0 ;
	setAttr ".s" -type "double3" 0.99999999999999867 0.99999999999999911 0.99999999999999833 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" -1.7095481412866423e-14 3.1805546814635203e-15 7.9513867036588008e-16 ;
	setAttr ".bps" -type "matrix" -0.093891677067359902 -0.20517202998623355 -0.97421188203019049 0
		 0.054670091698937939 0.97599565816543277 -0.21081664145852344 0 0.994080245277566 -0.073054180945034422 -0.080421095462209671 0
		 64.211458481363508 113.59644296087819 -2.8790556775786884 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_pinky_phalanx_1";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_pinky_02_L" -p "TPL_pinky_01_L";
	rename -uid "3A372E93-4518-40AB-211D-EE822677F8BD";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 7;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -7.1054273576010034e-15 -5.6823850394279016e-14 1.8800754894562606 ;
	setAttr ".r" -type "double3" -1.9480897423964025e-14 -2.3854160110976344e-15 0 ;
	setAttr ".s" -type "double3" 1.0000000000000013 1.0000000000000007 1.0000000000000013 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" -1.6896696745274918e-14 4.7708320221952696e-15 -1.5902773407317566e-15 ;
	setAttr ".bps" -type "matrix" -0.093891677067360152 -0.2051720299862341 -0.97421188203019304 0
		 0.054670091698938023 0.97599565816543432 -0.21081664145852377 0 0.99408024527756911 -0.073054180945034644 -0.080421095462209921 0
		 66.080404385062522 113.45909558588106 -3.0302534079923884 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_pinky_phalanx_2";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_pinky_03_L" -p "TPL_pinky_02_L";
	rename -uid "64FA30D8-413F-DFE7-AD1E-3BAF56A74031";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 7;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 1.7757212433030955e-15 1.0112295721362092e-14 1.7042004744591086 ;
	setAttr ".r" -type "double3" -1.9480897423964025e-14 -2.3854160110976344e-15 0 ;
	setAttr ".s" -type "double3" 1.0000000000000013 1.0000000000000007 1.0000000000000013 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" -1.6896696745274918e-14 4.7708320221952696e-15 -1.5902773407317566e-15 ;
	setAttr ".bps" -type "matrix" -0.093891677067360152 -0.2051720299862341 -0.97421188203019304 0
		 0.054670091698938023 0.97599565816543432 -0.21081664145852377 0 0.99408024527756911 -0.073054180945034644 -0.080421095462209921 0
		 66.080404385062522 113.45909558588106 -3.0302534079923884 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_pinky_phalanx_2";
	setAttr ".radi" 0.5;
createNode transform -n "GRP_template_hand_R" -p "GRP_template_hands";
	rename -uid "949E503D-4A44-0FA9-3C07-9B9909C4AEF0";
	setAttr ".rp" -type "double3" -52.705799102783203 114.61799621582031 -0.67849397659301758 ;
	setAttr ".sp" -type "double3" -52.705799102783203 114.61799621582031 -0.67849397659301758 ;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode joint -n "TPL_hand_R" -p "GRP_template_hand_R";
	rename -uid "C7098629-42A0-6AEA-E5B5-26BEF279B8DB";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -52.7058 114.618 -0.678494 ;
	setAttr ".r" -type "double3" 5.7249984266343308e-14 3.816665617756222e-14 -3.8166656177562182e-14 ;
	setAttr ".s" -type "double3" 0.99999999999999978 1 0.99999999999999989 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".bps" -type "matrix" 0.99999999999999989 1.7347234759768071e-18 6.9388939039072284e-17 0
		 -6.9388939039072284e-18 0.99999999999999967 9.280770596475918e-17 0 -1.5265566588595902e-16 -8.7603535536828758e-17 1.0000000000000004 0
		 52.705791429738753 114.61838061476365 -0.67849407462019995 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "hand";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_metacarp_index_R" -p "TPL_hand_R";
	rename -uid "82D866C8-435D-3646-0E54-33967B9DFB70";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -1.5002999999999957 0.23500000000001364 -1.8603540000000005 ;
	setAttr ".r" -type "double3" 5.960567814224925 -15.860528506119177 -2.7161923340653935 ;
	setAttr ".s" -type "double3" 1.0000000000000002 0.99999999999999989 0.99999999999999989 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".pa" -type "double3" 5.960567814224925 -15.860528506119177 -2.7161923340653935 ;
	setAttr ".bps" -type "matrix" 0.96084910722804473 -0.045584646307762371 0.27329660290619512 0
		 0.018784217643984434 0.99482109735408308 0.099890627321688602 0 -0.27643470532220371 -0.090846157212142106 0.95672923516176422 0
		 54.206084574215453 114.38315326645488 1.181858022558627 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "metacarp_index";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_index_base_R" -p "TPL_metacarp_index_R";
	rename -uid "3DE44009-402C-B528-49DC-59A878A7E843";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -6.0763971961604 9.4200846234571145e-06 -2.3301878080417282e-06 ;
	setAttr ".r" -type "double3" 179.99999999999966 84.253534112089994 178.89487357961929 ;
	setAttr ".s" -type "double3" 0.99999999999999922 0.99999999999999978 0.99999999999999933 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 179.99999999999966 84.253534112089994 178.89487357961929 ;
	setAttr ".bps" -type "matrix" 0.17889306653184267 0.096874150598625336 -0.97908767211758352 0
		 0.037312523044092334 0.99375686469007751 0.10514309062144865 0 0.98316074289554345 -0.055341601233980367 0.17416159393488945 0
		 60.044592626789537 114.10616250636612 2.8425187910451726 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_index_base";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_index_01_R" -p "TPL_index_base_R";
	rename -uid "1C3B474E-4AA7-E56C-1532-C8803141AE01";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 3.0359901543874912e-06 0.00015408261664619384 -4.4604163907250998 ;
	setAttr ".r" -type "double3" -5.1882798241373606e-14 -1.5902773407317584e-15 7.9513867036587919e-16 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1.0000000000000002 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" -5.1882798241373606e-14 -1.5902773407317584e-15 7.9513867036587919e-16 ;
	setAttr ".bps" -type "matrix" 0.17889306653184284 0.096874150598625419 -0.97908767211758441 0
		 0.037312523044092348 0.99375686469007796 0.10514309062144869 0 0.98316074289554434 -0.055341601233980416 0.17416159393488961 0
		 64.429854054143419 113.85931844655894 3.6193440716802292 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_index_phalanx_1";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_index_02_R" -p "TPL_index_01_R";
	rename -uid "C02B6248-4893-CEE9-F2C9-B6A057DBD44E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -5.5205397789137585e-05 -0.00066528496017781436 -2.3430200171463298 ;
	setAttr ".r" -type "double3" -5.188279824137365e-14 -3.1805546814635211e-15 1.5902773407317606e-15 ;
	setAttr ".s" -type "double3" 0.99999999999999878 0.99999999999999944 0.99999999999999956 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".jo" -type "double3" 1.2074182697257333e-06 0 0 ;
	setAttr ".pa" -type "double3" -5.188279824137365e-14 -3.1805546814635211e-15 1.5902773407317606e-15 ;
	setAttr ".bps" -type "matrix" 0.17889306653184261 0.096874150598625294 -0.97908767211758319 0
		 0.03731252304409232 0.99375686469007718 0.10514309062144861 0 0.98316074289554367 -0.055341601233980381 0.1741615939348895 0
		 66.733472472786801 113.72964897710438 4.027417582047522 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_index_phalanx_2";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_index_03_R" -p "TPL_index_02_R";
	rename -uid "424339E2-441E-8892-425D-3E806847BBAE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 5.7776222156746826e-05 0.00057851336886471927 -2.0494430211362697 ;
	setAttr ".r" -type "double3" -5.188279824137365e-14 -3.1805546814635211e-15 1.5902773407317606e-15 ;
	setAttr ".s" -type "double3" 0.99999999999999878 0.99999999999999944 0.99999999999999956 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" -5.188279824137365e-14 -3.1805546814635211e-15 1.5902773407317606e-15 ;
	setAttr ".bps" -type "matrix" 0.17889306653184261 0.096874150598625294 -0.97908767211758319 0
		 0.03731252304409232 0.99375686469007718 0.10514309062144861 0 0.98316074289554367 -0.055341601233980381 0.1741615939348895 0
		 66.733472472786801 113.72964897710438 4.027417582047522 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_index_phalanx_2";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_metacarp_thumb_R" -p "TPL_hand_R";
	rename -uid "67FFB62F-4411-3851-6830-F9AD62F3EDE0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -3.1591999999999985 1.1360000000000099 -2.5524940000000007 ;
	setAttr ".r" -type "double3" 41.121999999999979 -12.908363018476718 1.3419999999999843 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.97446123945655971 0.022828316305537485 0.22339239192828353 0
		 -0.16451963300539307 0.74966346902009107 0.64104443962375479 0 -0.15283515025201574 -0.6614253935187373 0.734273699417341 0
		 55.865000000000023 113.48199999999999 1.8740000000000023 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "metacarp_thumb";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_thumb_base_R" -p "TPL_metacarp_thumb_R";
	rename -uid "32F66944-427B-0155-3F4A-5E9EC3438D54";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -3.147289892328196 -0.045452109403683494 -3.1703063349619072 ;
	setAttr ".r" -type "double3" 23.365354476313325 52.025306897510617 16.588477151550599 ;
	setAttr ".s" -type "double3" 1.0000000000000002 0.99999999999999989 1.0000000000000002 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".bps" -type "matrix" 0.6662199601721136 0.6665449229849959 -0.33446798099548153 0
		 -0.16014878519277453 0.56590482743447068 0.8087670201532956 0 0.72835659622848681 -0.48525209111274059 0.48376345128705883 0
		 58.439896588911871 111.49060308909502 4.9340902650770779 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_thumb_base";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_thumb_01_R" -p "TPL_thumb_base_R";
	rename -uid "DCF4E6D0-4BD6-FACD-DB5D-0DAEFC68E912";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 0.00041177150745845521 0.00031142263789973867 -2.5091067560907345 ;
	setAttr ".r" -type "double3" 9.541664044390555e-15 0 0 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999956 0.99999999999999967 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".bps" -type "matrix" 0.66621996017211327 0.66654492298499557 -0.33446798099548136 0
		 -0.16014878519277451 0.56590482743447057 0.80876702015329538 0 0.72835659622848636 -0.48525209111274031 0.48376345128705855 0
		 60.267247264308892 110.2731695668007 6.147788986307015 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_thumb_phalanx_1";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_thumb_02_R" -p "TPL_thumb_01_R";
	rename -uid "D6D48312-4866-198E-1873-74B1FA3CB6CE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -0.00021096022477700278 -0.00017755019909060366 -2.3539127639043387 ;
	setAttr ".r" -type "double3" 9.541664044390555e-15 0 0 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999956 0.99999999999999967 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".bps" -type "matrix" 0.66621996017211327 0.66654492298499557 -0.33446798099548136 0
		 -0.16014878519277451 0.56590482743447057 0.80876702015329538 0 0.72835659622848636 -0.48525209111274031 0.48376345128705855 0
		 60.267247264308892 110.2731695668007 6.147788986307015 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_thumb_phalanx_1";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_metacarp_middle_R" -p "TPL_hand_R";
	rename -uid "A6E3468C-4756-7E96-9620-E4BE272C521B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -1.7189999999999941 0.16300000000001091 -1.103479000000001 ;
	setAttr ".r" -type "double3" -5.7987973254716803 11.326386550578322 2.8722707572805 ;
	setAttr ".s" -type "double3" 0.99999999999999944 0.99999999999999933 0.99999999999999911 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 5.9605678142249312 -15.86052850611919 -2.7161923340653935 ;
	setAttr ".pa" -type "double3" -5.7987973254716687 11.326386550578313 2.8722707572805057 ;
	setAttr ".bps" -type "matrix" 0.99616641703696995 0.022080486649248211 0.084645860365745812 0
		 -0.020911983824155236 0.99967373673002191 -0.01466659554127385 0 -0.084942089097591905 0.012840257067730995 0.99630315130394487 0
		 54.424773479088053 114.45502212463398 0.42498464642710754 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "metacarp_middle";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_middle_base_R" -p "TPL_metacarp_middle_R";
	rename -uid "F6AF786B-47E3-0161-2119-5FB04F02C94A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -6.1905387720237712 -0.0003099400217791981 -4.080363970704326e-06 ;
	setAttr ".r" -type "double3" 2.3362162882198331e-12 89.951247990536345 -4.1986099883699293 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1 1.0000000000000007 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 5.6069190917288264e-12 89.951247990536359 -4.1986099883709658 ;
	setAttr ".bps" -type "matrix" 0.085788707341970624 -0.01288379115432596 -0.996230046534478 0
		 0.052077468662238086 0.99860746684118318 -0.0084299719316549004 0 0.99495137315867344 -0.051157942633833421 0.086340198952435138 0
		 60.59157576810604 114.59171213273152 0.94898774122328877 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_middle_base";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_middle_01_R" -p "TPL_middle_base_R";
	rename -uid "951F7A60-460E-3C75-829B-C591FB132244";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 4.4270530974443992e-06 3.9229850614180898e-05 -4.7687782044256499 ;
	setAttr ".r" -type "double3" 3.2473401177533912e-12 -1.5902773407317602e-15 4.9696166897867499e-16 ;
	setAttr ".s" -type "double3" 0.999999999999999 0.99999999999999922 0.99999999999999911 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 2.2151072471386484e-12 1.4113711398994362e-14 -7.9513867036587959e-16 ;
	setAttr ".bps" -type "matrix" 0.085788707341970499 -0.012883791154325941 -0.99623004653447655 0
		 0.052077468662238044 0.9986074668411824 -0.0084299719316548935 0 0.99495137315867188 -0.051157942633833345 0.086340198952434999 0
		 65.336336584309379 114.34774824846994 1.3607300674358334 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_middle_phalanx_1";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_middle_02_R" -p "TPL_middle_01_R";
	rename -uid "12AE6CFC-4F6C-FCB5-9665-169429BFFBA6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -1.1623086642077859e-05 0.00064035527366001631 -2.5090998598521783 ;
	setAttr ".r" -type "double3" 3.2476879909216741e-12 -2.3854160110976364e-15 2.9817700138720455e-16 ;
	setAttr ".s" -type "double3" 1.0000000000000004 0.99999999999999989 1.0000000000000007 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 2.2151320952220938e-12 1.4312496066585818e-14 -7.951386703658788e-16 ;
	setAttr ".bps" -type "matrix" 0.085788707341970638 -0.012883791154325962 -0.99623004653447811 0
		 0.052077468662238079 0.99860746684118307 -0.0084299719316548987 0 0.99495137315867344 -0.051157942633833421 0.086340198952435138 0
		 67.832667841355118 114.21939305977608 1.577357475768606 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_middle_phalanx_2";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_middle_03_R" -p "TPL_middle_02_R";
	rename -uid "05044BA0-4620-DA56-F801-E88CF7B46C8B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 2.5251901986895435e-06 -0.00034712064685040307 -2.2742640499952453 ;
	setAttr ".r" -type "double3" 3.2476879909216741e-12 -2.3854160110976364e-15 2.9817700138720455e-16 ;
	setAttr ".s" -type "double3" 1.0000000000000004 0.99999999999999989 1.0000000000000007 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 2.2151320952220938e-12 1.4312496066585818e-14 -7.951386703658788e-16 ;
	setAttr ".bps" -type "matrix" 0.085788707341970638 -0.012883791154325962 -0.99623004653447811 0
		 0.052077468662238079 0.99860746684118307 -0.0084299719316548987 0 0.99495137315867344 -0.051157942633833421 0.086340198952435138 0
		 67.832667841355118 114.21939305977608 1.577357475768606 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_middle_phalanx_2";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_metacarp_ring_R" -p "TPL_hand_R";
	rename -uid "2AC5163D-4A6E-0303-1D6E-26A55D8F60A2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -1.7849999999999966 0.17300000000004445 -0.32933200000000123 ;
	setAttr ".r" -type "double3" -7.0764960938697978 10.682774927521747 -2.0889210877187181 ;
	setAttr ".s" -type "double3" 1.0000000000000002 0.99999999999999989 1.0000000000000007 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.84339121949853812 -4.8556607717288722 1.2697793727417335 ;
	setAttr ".pa" -type "double3" -7.0764960938697925 10.682774927521772 -2.0889210877187159 ;
	setAttr ".bps" -type "matrix" 0.99474576767438061 -0.016503881867032454 -0.1010370208251779 0
		 0.0028268372402334534 0.99097202606044943 -0.1340389964035256 0 0.10233702499645776 0.13304910916261767 0.98581188259520958 0
		 54.490775124901432 114.44504499659128 -0.34916216834595437 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "metacarp_ring";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_ring_base_R" -p "TPL_metacarp_ring_R";
	rename -uid "73315C26-47E4-2A77-DF35-E093006E680A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -6.3110574180373931 -0.00015587897388513738 -1.8597499870764977e-05 ;
	setAttr ".r" -type "double3" 0 83.020827949486176 -3.3130060429673014 ;
	setAttr ".s" -type "double3" 0.99999999999999889 0.99999999999999956 0.99999999999999944 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 6.5438918496188701e-15 83.020827949486176 -3.3130060429673396 ;
	setAttr ".bps" -type "matrix" 0.019069489815693827 -0.14102393930161475 -0.98982251090891193 0
		 0.060309114669702048 0.98836206823832662 -0.13965397507916844 0 0.99799757777558029 -0.057032189257564578 0.027352589321003026 0
		 60.768698223425226 114.34088762839197 -0.98681519232148374 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_ring_base";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_ring_01_R" -p "TPL_ring_base_R";
	rename -uid "FEBAD4A9-40CD-DFC6-6D85-6BA131650F81";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 4.7812848876560558e-05 -0.00033748572884916667 -4.1790487784520352 ;
	setAttr ".r" -type "double3" 1.7890620083232288e-15 1.590277340731757e-15 0 ;
	setAttr ".s" -type "double3" 1.0000000000000009 0.99999999999999967 1.0000000000000004 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" -3.0314661807699136e-14 1.6697912077683451e-14 3.975693351829394e-16 ;
	setAttr ".bps" -type "matrix" 0.019069489815693865 -0.14102393930161503 -0.98982251090891393 0
		 0.060309114669702048 0.98836206823832662 -0.13965397507916844 0 0.9979975777755814 -0.05703218925756464 0.027352589321003058 0
		 64.939379865358035 114.10254726561683 -0.8725073576324156 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_ring_phalanx_1";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_ring_02_R" -p "TPL_ring_01_R";
	rename -uid "DB7ECED5-49F6-BD80-5A7C-42B5075E65D4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -7.7241536379446516e-05 0.0005395683517832729 -2.2172709806220543 ;
	setAttr ".r" -type "double3" 2.0872390097104338e-15 1.3914926731402904e-15 -1.5902773407317606e-15 ;
	setAttr ".s" -type "double3" 0.99999999999999878 0.99999999999999956 0.99999999999999933 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 86.064839279325241 1.7493050748049363e-14 3.9756933518294004e-16 ;
	setAttr ".bps" -type "matrix" 0.019069489815693823 -0.14102393930161472 -0.98982251090891182 0
		 0.060309114669702048 0.98836206823832662 -0.13965397507916844 0 0.99799757777558029 -0.057032189257564578 0.027352589321003026 0
		 67.152175168534868 113.97609349124953 -0.81186023530758666 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_ring_phalanx_2";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_ring_03_R" -p "TPL_ring_02_R";
	rename -uid "28CD69E9-4673-B27E-4B2B-11ADEB411450";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -2.6896355828753826e-05 0.00020175685878598765 -2.0128422148630354 ;
	setAttr ".r" -type "double3" 2.0872390097104338e-15 1.3914926731402904e-15 -1.5902773407317606e-15 ;
	setAttr ".s" -type "double3" 0.99999999999999878 0.99999999999999956 0.99999999999999933 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 86.064839279325241 1.7493050748049363e-14 3.9756933518294004e-16 ;
	setAttr ".bps" -type "matrix" 0.019069489815693823 -0.14102393930161472 -0.98982251090891182 0
		 0.060309114669702048 0.98836206823832662 -0.13965397507916844 0 0.99799757777558029 -0.057032189257564578 0.027352589321003026 0
		 67.152175168534868 113.97609349124953 -0.81186023530758666 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_ring_phalanx_2";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_metacarp_pinky_R" -p "TPL_hand_R";
	rename -uid "C489687A-4772-1EB6-4E05-EBB464FEB833";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -1.7091999999999956 0.27100000000005764 0.40024599999999622 ;
	setAttr ".r" -type "double3" -3.9660494943554374 8.0528275871876893 -2.3895557486035597 ;
	setAttr ".s" -type "double3" 0.99999999999999911 0.99999999999999944 0.99999999999999878 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -7.7429175799748124 5.7988898640329847 -0.95051022927565954 ;
	setAttr ".pa" -type "double3" -3.9660494943554423 8.0528275871876733 -2.389555748603557 ;
	setAttr ".bps" -type "matrix" 0.96962775936405921 -0.075874965435504232 -0.23251881190732526 0
		 0.0275556980164464 0.97850120622961134 -0.20439195902486165 0 0.24302817074870015 0.19177689909724582 0.95087271976599708 0
		 54.415037860027127 114.34657842867713 -1.078738738223525 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "metacarp_pinky";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_pinky_base_R" -p "TPL_metacarp_pinky_R";
	rename -uid "AAE6BC4B-441C-CA0F-48CE-1E9D24A9D539";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -6.5409139187256784 0.00069775281403394729 0.00013364763943002345 ;
	setAttr ".r" -type "double3" -3.1572087324157557e-14 81.308789750746925 -1.6030492101774774 ;
	setAttr ".s" -type "double3" 1.0000000000000013 1.0000000000000002 1.0000000000000009 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" 0 81.308789750746925 -1.6030492101774845 ;
	setAttr ".bps" -type "matrix" -0.093891677067360152 -0.2051720299862341 -0.97421188203019304 0
		 0.054670091698938002 0.97599565816543388 -0.21081664145852366 0 0.99408024527756855 -0.073054180945034602 -0.080421095462209879 0
		 60.757221150633598 113.85029216488873 -2.5996078649464254 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_pinky_base";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_pinky_01_R" -p "TPL_pinky_base_R";
	rename -uid "293EF5E5-4998-659E-E835-6EBAC504D0CE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" -2.7185956064101898e-05 0.00014328896281766605 -3.4748808283492565 ;
	setAttr ".r" -type "double3" -1.9679682091555526e-14 -2.3854160110976407e-15 0 ;
	setAttr ".s" -type "double3" 0.99999999999999867 0.99999999999999911 0.99999999999999833 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" -1.7095481412866423e-14 3.1805546814635203e-15 7.9513867036588008e-16 ;
	setAttr ".bps" -type "matrix" -0.093891677067359902 -0.20517202998623355 -0.97421188203019049 0
		 0.054670091698937939 0.97599565816543277 -0.21081664145852344 0 0.994080245277566 -0.073054180945034422 -0.080421095462209671 0
		 64.211458481363508 113.59644296087819 -2.8790556775786884 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_pinky_phalanx_1";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_pinky_02_R" -p "TPL_pinky_01_R";
	rename -uid "0EC61D77-4A8A-8B45-6806-4F8AE6CD36F9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 7;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 7.4492718926677526e-05 -0.0003348972295782721 -1.8800038586116585 ;
	setAttr ".r" -type "double3" -1.9480897423964025e-14 -2.3854160110976344e-15 0 ;
	setAttr ".s" -type "double3" 1.0000000000000013 1.0000000000000007 1.0000000000000013 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".pa" -type "double3" -1.6896696745274918e-14 4.7708320221952696e-15 -1.5902773407317566e-15 ;
	setAttr ".bps" -type "matrix" -0.093891677067360152 -0.2051720299862341 -0.97421188203019304 0
		 0.054670091698938023 0.97599565816543432 -0.21081664145852377 0 0.99408024527756911 -0.073054180945034644 -0.080421095462209921 0
		 66.080404385062522 113.45909558588106 -3.0302534079923884 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_pinky_phalanx_2";
	setAttr ".radi" 0.5;
createNode joint -n "TPL_pinky_03_R" -p "TPL_pinky_02_R";
	rename -uid "69B6A8E5-4039-456B-BFF8-18A7051DD42C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 7;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".t" -type "double3" 9.5077850467338519e-05 -0.00048766961296563472 -1.7041525773059545 ;
	setAttr ".r" -type "double3" -1.9480897423964025e-14 -2.3854160110976344e-15 0 ;
	setAttr ".s" -type "double3" 1.0000000000000013 1.0000000000000007 1.0000000000000013 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "zxy";
	setAttr ".jo" -type "double3" 1.9090959104164203e-06 0 0 ;
	setAttr ".pa" -type "double3" -1.6896696745274918e-14 4.7708320221952696e-15 -1.5902773407317566e-15 ;
	setAttr ".bps" -type "matrix" -0.093891677067360152 -0.2051720299862341 -0.97421188203019304 0
		 0.054670091698938023 0.97599565816543432 -0.21081664145852377 0 0.99408024527756911 -0.073054180945034644 -0.080421095462209921 0
		 66.080404385062522 113.45909558588106 -3.0302534079923884 1;
	setAttr ".sd" 3;
	setAttr ".otp" -type "string" "fing_pinky_phalanx_2";
	setAttr ".radi" 0.5;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "EB411AFD-4279-2325-7059-91BCE82B9640";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "32EF29BE-492A-EC4D-E2E0-6FA91D9AA94D";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "2E0618E2-4C2A-AEF9-5E52-199AE00D9943";
createNode displayLayerManager -n "layerManager";
	rename -uid "97FEC985-48C3-7B67-917F-2B80D7E071AC";
createNode displayLayer -n "defaultLayer";
	rename -uid "B7E2B01F-4A7F-E0A8-AE8B-BAAB69F7968C";
	setAttr ".ufem" -type "stringArray" 0  ;
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "37AF27F7-4DBE-C007-759C-D39B1B955383";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "9ABAEF53-4C61-C11C-F057-06AD252AC080";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "0FBD78B3-4151-768A-8A5D-998F81E37A90";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 0\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n"
		+ "            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 0\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n"
		+ "            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n"
		+ "            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 0\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n"
		+ "            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n"
		+ "            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n"
		+ "            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n"
		+ "            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1589\n            -height 1071\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n"
		+ "            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -showUfeItems 1\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -selectCommand \"print(\\\"\\\")\" \n            -showNamespace 1\n            -showPinIcons 0\n"
		+ "            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            -ufeFilter \"USD\" \"InactivePrims\" -ufeFilterValue 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n"
		+ "            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -showUfeItems 1\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n"
		+ "            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -ufeFilter \"USD\" \"InactivePrims\" -ufeFilterValue 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n"
		+ "                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n"
		+ "                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -showUfeItems 1\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n"
		+ "                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showPlayRangeShades \"on\" \n                -lockPlayRangeShades \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -keyMinScale 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -valueLinesToggle 0\n                -highlightAffectedCurves 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n"
		+ "                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -showUfeItems 1\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n"
		+ "                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n"
		+ "                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n"
		+ "                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n"
		+ "                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -connectedGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -showUnitConversions 0\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -connectedGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n"
		+ "                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -showUnitConversions 0\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n{ string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"|persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n"
		+ "                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n"
		+ "                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n"
		+ "                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -bluePencil 1\n                -greasePencils 0\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n"
		+ "                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName; };\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1589\\n    -height 1071\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1589\\n    -height 1071\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "5221041D-489F-7B3C-5349-C1B756CF22A5";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode pointOnCurveInfo -n "poci_CRV_spine_C_for_TMP_spine_01_C";
	rename -uid "8DA8B40F-4A71-22DF-040C-E4BEC8864A58";
createNode fourByFourMatrix -n "fbfmx_CRV_spine_C_for_TMP_spine_01_C";
	rename -uid "C03687A1-4E47-D690-750B-F7A67C26333D";
createNode multMatrix -n "mmx_CRV_spine_C_for_TMP_spine_01_C";
	rename -uid "EDE3B310-4BBE-0CD4-BFDF-069ADF5F5BE1";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "dmx_CRV_spine_C_for_TMP_spine_01_C";
	rename -uid "F2588201-463C-972A-FF79-1CB4A2045C6B";
createNode pointOnCurveInfo -n "poci_CRV_spine_C_for_TMP_spine_02_C";
	rename -uid "4DE3831E-463B-8892-4D0A-C8AA5FD27BC3";
	setAttr ".pr" 0.33333249999999998;
createNode fourByFourMatrix -n "fbfmx_CRV_spine_C_for_TMP_spine_02_C";
	rename -uid "FF93C67D-4AE5-CAE7-CB1F-12AA9D2587F7";
createNode multMatrix -n "mmx_CRV_spine_C_for_TMP_spine_02_C";
	rename -uid "2DE303EA-41AE-FF9F-DF4E-6FA1F86944E9";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "dmx_CRV_spine_C_for_TMP_spine_02_C";
	rename -uid "EAF83BA9-4886-2814-C462-059982A9DD4C";
createNode pointOnCurveInfo -n "poci_CRV_spine_C_for_TMP_spine_03_C";
	rename -uid "E9F9DA3B-47CC-30FE-FB09-CEB3C0EE7770";
	setAttr ".pr" 0.666665;
createNode fourByFourMatrix -n "fbfmx_CRV_spine_C_for_TMP_spine_03_C";
	rename -uid "37831740-4A21-8741-EF76-D786A93A4B26";
createNode multMatrix -n "mmx_CRV_spine_C_for_TMP_spine_03_C";
	rename -uid "38C112B5-4E87-AC2B-0053-E099675BE2D8";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "dmx_CRV_spine_C_for_TMP_spine_03_C";
	rename -uid "A9550006-4BB6-31B2-7766-17882F429D5F";
createNode pointOnCurveInfo -n "poci_CRV_spine_C_for_TMP_spine_04_C";
	rename -uid "A43C3BCD-4D3D-E4EF-1EED-948C82E4A385";
	setAttr ".pr" 0.99999749999999987;
createNode fourByFourMatrix -n "fbfmx_CRV_spine_C_for_TMP_spine_04_C";
	rename -uid "4CA356CF-4381-2655-4EE7-A88CB09C25C2";
createNode multMatrix -n "mmx_CRV_spine_C_for_TMP_spine_04_C";
	rename -uid "4A776E29-4A27-5A25-DA36-ECBA0F90ABE7";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "dmx_CRV_spine_C_for_TMP_spine_04_C";
	rename -uid "5AEFD141-44A8-A179-E5EB-CB98C37788FB";
createNode pointOnCurveInfo -n "poci_CRV_neck_C_for_TMP_neck_01_C";
	rename -uid "D68C5F6E-4275-464B-6CAD-B5B7943A697A";
createNode fourByFourMatrix -n "fbfmx_CRV_neck_C_for_TMP_neck_01_C";
	rename -uid "941D7EFD-4584-30FB-9D1C-AEB7FA9C04E9";
createNode multMatrix -n "mmx_CRV_neck_C_for_TMP_neck_01_C";
	rename -uid "3C31FD48-4891-EFCA-4D7E-43B9155BF32D";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "dmx_CRV_neck_C_for_TMP_neck_01_C";
	rename -uid "EFF4E621-4A5B-E20B-66BD-C6B18B722C94";
createNode pointOnCurveInfo -n "poci_CRV_neck_C_for_TMP_neck_02_C";
	rename -uid "169AF377-4EB2-4E92-B74E-9FA14B010429";
	setAttr ".pr" 0.33333249999999998;
createNode fourByFourMatrix -n "fbfmx_CRV_neck_C_for_TMP_neck_02_C";
	rename -uid "52B2DC56-4C0F-6FCD-622B-65AB62CDD8F9";
createNode multMatrix -n "mmx_CRV_neck_C_for_TMP_neck_02_C";
	rename -uid "6D7D5647-46E5-F875-CB7A-D083688E0728";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "dmx_CRV_neck_C_for_TMP_neck_02_C";
	rename -uid "57E58FA6-4F0E-078F-6F8A-408F2A7EE391";
createNode pointOnCurveInfo -n "poci_CRV_neck_C_for_TMP_neck_03_C";
	rename -uid "7E17DBB6-429B-E6E7-E119-D8B2BEDB373F";
	setAttr ".pr" 0.666665;
createNode fourByFourMatrix -n "fbfmx_CRV_neck_C_for_TMP_neck_03_C";
	rename -uid "DF7A51EA-46F8-EDBA-CFFE-5D91F63164C0";
createNode multMatrix -n "mmx_CRV_neck_C_for_TMP_neck_03_C";
	rename -uid "F2D79B14-45F9-8C53-8343-8D9059957026";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "dmx_CRV_neck_C_for_TMP_neck_03_C";
	rename -uid "C9EA03DC-468C-EFF8-49FA-0C908CB35CF6";
createNode pointOnCurveInfo -n "poci_CRV_neck_C_for_TMP_neck_04_C";
	rename -uid "4B78DE20-4EDB-A71C-8120-5390F3937B3B";
	setAttr ".pr" 0.99999749999999987;
createNode fourByFourMatrix -n "fbfmx_CRV_neck_C_for_TMP_neck_04_C";
	rename -uid "BD3E3325-41DB-6E7A-BA6A-E793CBD9506B";
createNode multMatrix -n "mmx_CRV_neck_C_for_TMP_neck_04_C";
	rename -uid "47DBC27B-4085-809F-E69F-209367417ACC";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "dmx_CRV_neck_C_for_TMP_neck_04_C";
	rename -uid "86AFC5D3-491C-34EB-C32D-F496E5317E9E";
createNode skinCluster -n "skinCluster1";
	rename -uid "E5229B91-4599-B4A9-CC3E-C0BAB8830B71";
	setAttr -s 4 ".wl";
	setAttr ".wl[0:3].w"
		1 0 1
		1 1 1
		1 2 1
		1 3 1;
	setAttr -s 4 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -118.13159932291997 3.550506830215491 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -121.267069298815 3.5505068302154563 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -124.4025391431106 3.5505068302154621 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -127.53803253173874 3.5505068302154665 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 4 ".ma";
	setAttr -s 4 ".dpf[0:3]"  4 4 4 4;
	setAttr -s 4 ".lw";
	setAttr -s 4 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 3;
	setAttr ".ucm" yes;
	setAttr -s 4 ".ifcl";
	setAttr -s 4 ".ifcl";
createNode dagPose -n "bindPose3";
	rename -uid "629982AB-486A-DC6A-92B1-33B5BAC6DBDE";
	setAttr -s 7 ".wm";
	setAttr ".wm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 118.13159932291997 -3.550506830215491 1;
	setAttr ".wm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 121.267069298815 -3.5505068302154563 1;
	setAttr ".wm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 124.4025391431106 -3.5505068302154621 1;
	setAttr ".wm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 127.53803253173874 -3.5505068302154665 1;
	setAttr -s 7 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 118.13159942626953
		 -3.5505068302154541 0 0 0 0 118.13159942626953 -3.5505068302154541 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 118.13159932291997 -3.550506830215491 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 121.267069298815 -3.5505068302154563 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 124.4025391431106 -3.5505068302154621 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 127.53803253173874 -3.5505068302154665 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr -s 7 ".m";
	setAttr -s 7 ".p";
	setAttr -s 7 ".g[0:6]" yes yes yes no no no no;
	setAttr ".bp" yes;
createNode skinCluster -n "skinCluster2";
	rename -uid "27EEC23A-46AD-0524-3625-E4AE125B117C";
	setAttr -s 4 ".wl";
	setAttr ".wl[0:3].w"
		1 0 1
		1 1 1
		1 2 1
		1 3 1;
	setAttr -s 4 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -87.590568439131061 3.689027786254881 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -97.770912170410156 3.6428542137145987 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -107.95125579833984 3.5966804027557373 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -118.13159932291995 3.5505068302154914 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 4 ".ma";
	setAttr -s 4 ".dpf[0:3]"  4 4 4 4;
	setAttr -s 4 ".lw";
	setAttr -s 4 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 3;
	setAttr ".ucm" yes;
	setAttr -s 4 ".ifcl";
	setAttr -s 4 ".ifcl";
createNode dagPose -n "bindPose4";
	rename -uid "F76EBF6B-4940-FC9B-E9D5-32BCA95BB64C";
	setAttr -s 7 ".wm";
	setAttr ".wm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 87.590568439131061 -3.689027786254881 1;
	setAttr ".wm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 97.770912170410156 -3.6428542137145987 1;
	setAttr ".wm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 107.95125579833984 -3.5966804027557373 1;
	setAttr ".wm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 118.13159932291995 -3.5505068302154914 1;
	setAttr -s 7 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 87.590568542480469
		 -3.6890277862548828 0 0 0 0 87.590568542480469 -3.6890277862548828 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 87.590568439131061 -3.689027786254881 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 97.770912170410156 -3.6428542137145987 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 107.95125579833984 -3.5966804027557373 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 118.13159932291995 -3.5505068302154914 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr -s 7 ".m";
	setAttr -s 7 ".p";
	setAttr -s 7 ".g[0:6]" yes yes yes no no no no;
	setAttr ".bp" yes;
createNode rmanGlobals -s -n "rmanGlobals";
	rename -uid "9E6039FC-437C-344E-2EE6-90B33A67227B";
	setAttr ".hider_minSamples" 0;
	setAttr ".hider_maxSamples" 128;
	setAttr ".ri_pixelVariance" 0.014999999664723873;
	setAttr ".hider_incremental" 1;
	setAttr ".ipr_hider_maxSamples" 64;
	setAttr ".ipr_ri_pixelVariance" 0.05000000074505806;
	setAttr ".ipr_ri_decidither" 0;
	setAttr ".ri_maxSpecularDepth" 4;
	setAttr ".ri_maxDiffuseDepth" 1;
	setAttr ".ri_displayFilter" -type "string" "gaussian";
	setAttr ".ri_displayFilterSize" -type "float2" 2 2 ;
	setAttr ".pixelFilterMode" -type "string" "importance";
	setAttr ".renderVariant" -type "string" "ris";
	setAttr ".xpuMode" -type "long2" 1 1 ;
	setAttr ".motionBlur" 0;
	setAttr ".cameraBlur" 0;
	setAttr ".shutterAngle" 180;
	setAttr ".shutterOpenEnd" 0;
	setAttr ".shutterCloseStart" 1;
	setAttr ".shutterTiming" 0;
	setAttr ".motionSamples" 2;
	setAttr ".ocioConfig" 0;
	setAttr ".ocioConfigPath" -type "string" "";
	setAttr ".ocioColorSpaceName" -type "string" "";
	setAttr ".ocioEnabled" 0;
	setAttr ".enableStylizedLooks" 0;
	setAttr ".displayFilters[0]" -type "string" "";
	setAttr ".sampleFilters[0]" -type "string" "";
	setAttr ".outputAllShaders" 0;
	setAttr ".reentrantProcedurals" 1;
	setAttr ".outputShadowAOV" 0;
	setAttr ".enableImagePlaneFilter" 1;
	setAttr ".learnLightSelection" 1;
	setAttr ".shadowBumpTerminator" 1;
	setAttr ".blueNoise" 1;
	setAttr ".geomShadowTermBias" 1;
	setAttr ".roughnessMollification" 1;
	setAttr ".opt_bucket_order" -type "string" "circle";
	setAttr ".limits_bucketsize" -type "long2" 16 16 ;
	setAttr ".limits_othreshold" -type "float3" 0.99599999 0.99599999 0.99599999 ;
	setAttr ".rfm_referenceFrame" 0;
	setAttr ".adaptiveMetric" -type "string" "variance";
	setAttr ".hider_darkfalloff" 0.02500000037252903;
	setAttr ".hider_exposurebracket" -type "float2" -1 1 ;
	setAttr ".ri_hider_adaptAll" 0;
	setAttr ".dice_micropolygonlength" 1;
	setAttr ".dice_watertight" 0;
	setAttr ".dice_referenceCameraType" 0;
	setAttr ".dice_referenceCamera" -type "string" "";
	setAttr ".hair_minWidth" 0.5;
	setAttr ".trace_autobias" 1;
	setAttr ".trace_bias" 0.0010000000474974513;
	setAttr ".trace_worldorigin" -type "string" "camera";
	setAttr ".trace_worldoffset" -type "float3" 0 0 0 ;
	setAttr ".opt_oslmatchcpp" 0;
	setAttr ".opt_oslSIMDEnable" 1;
	setAttr ".opt_oslVerbosity" 0;
	setAttr ".opt_oslStatistics" 0;
	setAttr ".volume_aggregatespace" -type "string" "world";
	setAttr ".deep_quality" 0.75;
	setAttr ".opt_cropWindowEnable" 0;
	setAttr ".opt_cropWindowTopLeft" -type "float2" 0 0 ;
	setAttr ".opt_cropWindowBottomRight" -type "float2" 1 1 ;
	setAttr ".user_sceneUnits" 1;
	setAttr ".user_iesIgnoreWatts" 1;
	setAttr ".limits_texturememory" 4096;
	setAttr ".limits_geocachememory" 4096;
	setAttr ".limits_opacitycachememory" 2048;
	setAttr ".statistics_level" 1;
	setAttr ".statistics_xmlfilename" -type "string" "";
	setAttr ".lpe_reload_definitions" -type "string" "";
	setAttr ".lpe_diffuse2" -type "string" "Diffuse,HairDiffuse,diffuse,translucent,hair4,irradiance";
	setAttr ".lpe_diffuse3" -type "string" "Subsurface,subsurface";
	setAttr ".lpe_specular2" -type "string" "Specular,HairSpecularR,specular,hair1";
	setAttr ".lpe_specular3" -type "string" "RoughSpecular,HairSpecularTRT,hair3";
	setAttr ".lpe_specular4" -type "string" "Clearcoat";
	setAttr ".lpe_specular5" -type "string" "Iridescence";
	setAttr ".lpe_specular6" -type "string" "Fuzz,HairSpecularGLINTS";
	setAttr ".lpe_specular7" -type "string" "SingleScatter,HairSpecularTT,hair2";
	setAttr ".lpe_specular8" -type "string" "Glass,specular";
	setAttr ".lpe_user2" -type "string" "Albedo,DiffuseAlbedo,SubsurfaceAlbedo,HairAlbedo";
	setAttr ".lpe_user3" -type "string" "Position";
	setAttr ".lpe_user4" -type "string" "UserColor";
	setAttr ".lpe_user5" -type "string" "";
	setAttr ".lpe_user6" -type "string" "Normal,DiffuseNormal,HairTangent,SubsurfaceNormal,SpecularNormal,RoughSpecularNormal,SingleScatterNormal,FuzzNormal,IridescenceNormal,GlassNormal";
	setAttr ".lpe_user7" -type "string" "";
	setAttr ".lpe_user8" -type "string" "";
	setAttr ".lpe_user9" -type "string" "";
	setAttr ".lpe_user10" -type "string" "";
	setAttr ".lpe_user11" -type "string" "";
	setAttr ".lpe_user12" -type "string" "";
	setAttr ".imageFileFormat" -type "string" "<scene>_<layer>_<camera>_<aov>.<f4>.<ext>";
	setAttr ".ribFileFormat" -type "string" "<camera><layer>.<f4>.rib";
	setAttr ".version" 1;
	setAttr ".take" 1;
	setAttr ".imageOutputDir" -type "string" "<ws>/images/<scene>_v<version>_t<take>";
	setAttr ".ribOutputDir" -type "string" "<ws>/renderman/rib/<scene>/v<version>_t<take>";
	setAttr ".UserTokens[0].userTokenKeys" -type "string" "";
	setAttr ".UserTokens[0].userTokenValues" -type "string" "";
	setAttr ".UserTokens[1].userTokenKeys" -type "string" "";
	setAttr ".UserTokens[1].userTokenValues" -type "string" "";
	setAttr ".UserTokens[2].userTokenKeys" -type "string" "";
	setAttr ".UserTokens[2].userTokenValues" -type "string" "";
	setAttr ".UserTokens[3].userTokenKeys" -type "string" "";
	setAttr ".UserTokens[3].userTokenValues" -type "string" "";
	setAttr ".UserTokens[4].userTokenKeys" -type "string" "";
	setAttr ".UserTokens[4].userTokenValues" -type "string" "";
	setAttr ".UserTokens[5].userTokenKeys" -type "string" "";
	setAttr ".UserTokens[5].userTokenValues" -type "string" "";
	setAttr ".UserTokens[6].userTokenKeys" -type "string" "";
	setAttr ".UserTokens[6].userTokenValues" -type "string" "";
	setAttr ".UserTokens[7].userTokenKeys" -type "string" "";
	setAttr ".UserTokens[7].userTokenValues" -type "string" "";
	setAttr ".UserTokens[8].userTokenKeys" -type "string" "";
	setAttr ".UserTokens[8].userTokenValues" -type "string" "";
	setAttr ".UserTokens[9].userTokenKeys" -type "string" "";
	setAttr ".UserTokens[9].userTokenValues" -type "string" "";
	setAttr ".rlfData" -type "string" "init";
	setAttr ".jobid" -type "string" "";
	setAttr ".txmanagerData" -type "string" "";
	setAttr ".rmanVersion" -type "string" "";
createNode PxrPathTracer -s -n "PxrPathTracer";
	rename -uid "B6AE1C5B-48C1-3E0A-59B6-2B9BCA055383";
	setAttr ".maxIndirectBounces" 8;
	setAttr ".maxContinuationLength" -1;
	setAttr ".maxNonStochasticOpacityEvents" 0;
	setAttr ".sampleMode" -type "string" "bxdf";
	setAttr ".numLightSamples" 1;
	setAttr ".numBxdfSamples" 1;
	setAttr ".numVolumeAggregateSamples" 1;
	setAttr ".numIndirectSamples" 1;
	setAttr ".numDiffuseSamples" 1;
	setAttr ".numSpecularSamples" 1;
	setAttr ".numSubsurfaceSamples" 1;
	setAttr ".numRefractionSamples" 1;
	setAttr ".allowCaustics" 0;
	setAttr ".accumOpacity" 0;
	setAttr ".risPathGuiding" 0;
	setAttr ".rouletteDepth" 4;
	setAttr ".rouletteThreshold" 0.20000000298023224;
	setAttr ".clampDepth" 2;
	setAttr ".clampLuminance" 10;
	setAttr ".volumeAggregate" -type "string" "globalVolumeAggregate";
	setAttr ".volumeAggregateCamera" -type "string" "";
	setAttr ".volumeAggregateIndirect" -type "string" "";
	setAttr ".volumeAggregateTransmission" -type "string" "";
	setAttr ".jointSampling" 0;
	setAttr ".jointScatteringBias" 0.5;
createNode rmanBakingGlobals -s -n "rmanBakingGlobals";
	rename -uid "B1C5030D-40BD-83B7-B44C-129C6AA8C1ED";
	setAttr ".bakeMode" 0;
	setAttr ".bakingImageFileFormat" -type "string" "<scene>_<user:bakingIdentifier>_<aov>.<ext>";
	setAttr ".resolution" 512;
	setAttr ".rman_bakeudimstride" 1;
	setAttr ".rman_bakeudimoffset" 0;
	setAttr ".rman_diceDistanceLength" 0.05000000074505806;
	setAttr ".rman_bakebboxmin" -type "float3" 1e+30 1e+30 1e+30 ;
	setAttr ".rman_bakebboxmax" -type "float3" -1e+30 -1e+30 -1e+30 ;
	setAttr ".ri_maxSpecularDepth" 4;
	setAttr ".ri_maxDiffuseDepth" 1;
	setAttr ".init" 0;
createNode rmanDisplay -n "rmanDefaultBakeDisplay";
	rename -uid "1B648E19-453D-06B8-F224-DCAEA9EA0E63";
	setAttr ".enable" 1;
	setAttr ".denoise" 0;
	setAttr ".frameMode" 0;
	setAttr ".opticalFlow" 0;
	setAttr ".remapBreakPoint" 0;
	setAttr ".remapMaxValue" 0;
	setAttr ".remapSmoothness" 0;
	setAttr -s 2 ".displayChannels";
	setAttr ".name" -type "string" "";
createNode rmanDisplayChannel -n "diffuse";
	rename -uid "C5CAEBE4-470C-7C39-0017-B9A222410C5D";
	setAttr ".enable" 1;
	setAttr ".channelType" -type "string" "color";
	setAttr ".channelSource" -type "string" "lpe:C(D[DS]*[LO])|[LO]";
	setAttr ".lpeLightGroup" -type "string" "";
	setAttr ".filter" -type "string" "inherit from display";
	setAttr ".filterwidth" -type "float2" -1 -1 ;
	setAttr ".statistics" -type "string" "";
	setAttr ".relativepixelvariance" -1;
	setAttr ".shadowthreshold" 0.0099999997764825821;
	setAttr ".remapBreakPoint" 0;
	setAttr ".remapMaxValue" 0;
	setAttr ".remapSmoothness" 0;
	setAttr ".name" -type "string" "diffuse";
createNode rmanDisplayChannel -n "a";
	rename -uid "0D0E58DB-49F6-6D1E-56EB-448C87B370E7";
	setAttr ".enable" 1;
	setAttr ".channelType" -type "string" "float";
	setAttr ".channelSource" -type "string" "a";
	setAttr ".lpeLightGroup" -type "string" "";
	setAttr ".filter" -type "string" "inherit from display";
	setAttr ".filterwidth" -type "float2" -1 -1 ;
	setAttr ".statistics" -type "string" "";
	setAttr ".relativepixelvariance" -1;
	setAttr ".shadowthreshold" 0.0099999997764825821;
	setAttr ".remapBreakPoint" 0;
	setAttr ".remapMaxValue" 0;
	setAttr ".remapSmoothness" 0;
	setAttr ".name" -type "string" "a";
createNode PxrPathTracer -s -n "bake_PxrPathTracer";
	rename -uid "6A5ACD33-4A9E-6CA5-69EE-A3B6E32D39CF";
	setAttr ".maxIndirectBounces" 8;
	setAttr ".maxContinuationLength" -1;
	setAttr ".maxNonStochasticOpacityEvents" 0;
	setAttr ".sampleMode" -type "string" "bxdf";
	setAttr ".numLightSamples" 1;
	setAttr ".numBxdfSamples" 1;
	setAttr ".numVolumeAggregateSamples" 1;
	setAttr ".numIndirectSamples" 1;
	setAttr ".numDiffuseSamples" 1;
	setAttr ".numSpecularSamples" 1;
	setAttr ".numSubsurfaceSamples" 1;
	setAttr ".numRefractionSamples" 1;
	setAttr ".allowCaustics" 0;
	setAttr ".accumOpacity" 0;
	setAttr ".risPathGuiding" 0;
	setAttr ".rouletteDepth" 4;
	setAttr ".rouletteThreshold" 0.20000000298023224;
	setAttr ".clampDepth" 2;
	setAttr ".clampLuminance" 10;
	setAttr ".volumeAggregate" -type "string" "globalVolumeAggregate";
	setAttr ".volumeAggregateCamera" -type "string" "";
	setAttr ".volumeAggregateIndirect" -type "string" "";
	setAttr ".volumeAggregateTransmission" -type "string" "";
	setAttr ".jointSampling" 0;
	setAttr ".jointScatteringBias" 0.5;
createNode rmanVolumeAggregateSet -s -n "globalVolumeAggregate";
	rename -uid "103A0D8D-44A2-E40F-BC59-E6AA352BAE09";
lockNode -l 1 ;
createNode d_openexr -n "d_openexr";
	rename -uid "FB7333D9-4AE1-0790-3A59-7BBA7C3230A4";
	setAttr ".asrgba" 1;
	setAttr ".autocrop" -type "string" "false";
	setAttr ".storage" -type "string" "scanline";
	setAttr ".exrpixeltype" -type "string" "half";
	setAttr ".compression" -type "string" "zips";
	setAttr ".compressionlevel" 45;
	setAttr ".forcepar" 0;
	setAttr ".metadatacount" 0;
createNode aiOptions -s -n "defaultArnoldRenderOptions";
	rename -uid "B6D57136-4AD6-0EFC-7CB4-7290CA1A17B9";
	setAttr ".version" -type "string" "5.2.1.1";
createNode aiAOVFilter -s -n "defaultArnoldFilter";
	rename -uid "493F7824-4471-AB6E-9E7A-6793B3B385ED";
	setAttr ".ai_translator" -type "string" "gaussian";
createNode aiAOVDriver -s -n "defaultArnoldDriver";
	rename -uid "EE335BAA-4728-6BBC-2BE0-81A11A68F54B";
	setAttr ".ai_translator" -type "string" "exr";
createNode aiAOVDriver -s -n "defaultArnoldDisplayDriver";
	rename -uid "FE14B868-45D4-2832-47DA-7BB4596D098E";
	setAttr ".output_mode" 0;
	setAttr ".ai_translator" -type "string" "maya";
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "1230EC44-40B8-9446-1AC6-9C86FEEA713D";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -44.047617297323995 -615.47616601936511 ;
	setAttr ".tgi[0].vh" -type "double2" 604.76188073082676 44.047617297323995 ;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "74E6AB76-407F-FA0E-8422-A6AB5068E031";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1014.8809120532082 -1061.3094816368741 ;
	setAttr ".tgi[0].vh" -type "double2" 233.92856213308556 -98.214281811600756 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -308.55905151367188;
	setAttr ".tgi[0].ni[0].y" -341.15130615234375;
	setAttr ".tgi[0].ni[0].nvs" 18306;
	setAttr ".tgi[0].ni[1].x" -646.6007080078125;
	setAttr ".tgi[0].ni[1].y" -325.58236694335938;
	setAttr ".tgi[0].ni[1].nvs" 18306;
select -ne :time1;
	setAttr ".o" 0;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".msaa" yes;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
	setAttr -s 6 ".r";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr ".ren" -type "string" "arnold";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya2022-default/config.ocio";
	setAttr ".vtn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".vn" -type "string" "ACES 1.0 SDR-video";
	setAttr ".dn" -type "string" "sRGB";
	setAttr ".wsn" -type "string" "ACEScg";
	setAttr ".otn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".potn" -type "string" "ACES 1.0 SDR-video (sRGB)";
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "TPL_head_01_C.s" "TPL_head_02_C.is";
connectAttr "TPL_eye_01_L.s" "TPL_eye_02_L.is";
connectAttr "TPL_eye_01_R.s" "TPL_eye_02_R.is";
connectAttr "TPL_jaw_01_C.s" "TPL_jaw_02_C.is";
connectAttr "TPL_jaw_01_C.s" "TPL_upper_jaw_01_C.is";
connectAttr "TPL_upper_jaw_01_C.s" "TPL_upper_jaw_02_C.is";
connectAttr "dmx_CRV_neck_C_for_TMP_neck_01_C.ot" "H_CRV_neck_C_for_TPL_neck_01_C.t"
		;
connectAttr "dmx_CRV_neck_C_for_TMP_neck_01_C.or" "H_CRV_neck_C_for_TPL_neck_01_C.r"
		;
connectAttr "dmx_CRV_neck_C_for_TMP_neck_02_C.ot" "H_CRV_neck_C_for_TPL_neck_02_C.t"
		;
connectAttr "dmx_CRV_neck_C_for_TMP_neck_02_C.or" "H_CRV_neck_C_for_TPL_neck_02_C.r"
		;
connectAttr "dmx_CRV_neck_C_for_TMP_neck_03_C.ot" "H_CRV_neck_C_for_TPL_neck_03_C.t"
		;
connectAttr "dmx_CRV_neck_C_for_TMP_neck_03_C.or" "H_CRV_neck_C_for_TPL_neck_03_C.r"
		;
connectAttr "dmx_CRV_neck_C_for_TMP_neck_04_C.ot" "H_CRV_neck_C_for_TPL_neck_04_C.t"
		;
connectAttr "dmx_CRV_neck_C_for_TMP_neck_04_C.or" "H_CRV_neck_C_for_TPL_neck_04_C.r"
		;
connectAttr "SKcurv_neck_01_C_parentConstraint1.ctx" "SKcurv_neck_01_C.tx";
connectAttr "SKcurv_neck_01_C_parentConstraint1.cty" "SKcurv_neck_01_C.ty";
connectAttr "SKcurv_neck_01_C_parentConstraint1.ctz" "SKcurv_neck_01_C.tz";
connectAttr "SKcurv_neck_01_C_parentConstraint1.crx" "SKcurv_neck_01_C.rx";
connectAttr "SKcurv_neck_01_C_parentConstraint1.cry" "SKcurv_neck_01_C.ry";
connectAttr "SKcurv_neck_01_C_parentConstraint1.crz" "SKcurv_neck_01_C.rz";
connectAttr "SKcurv_neck_01_C.ro" "SKcurv_neck_01_C_parentConstraint1.cro";
connectAttr "SKcurv_neck_01_C.pim" "SKcurv_neck_01_C_parentConstraint1.cpim";
connectAttr "SKcurv_neck_01_C.rp" "SKcurv_neck_01_C_parentConstraint1.crp";
connectAttr "SKcurv_neck_01_C.rpt" "SKcurv_neck_01_C_parentConstraint1.crt";
connectAttr "SKcurv_neck_01_C.jo" "SKcurv_neck_01_C_parentConstraint1.cjo";
connectAttr "LOC_neck_01_C.t" "SKcurv_neck_01_C_parentConstraint1.tg[0].tt";
connectAttr "LOC_neck_01_C.rp" "SKcurv_neck_01_C_parentConstraint1.tg[0].trp";
connectAttr "LOC_neck_01_C.rpt" "SKcurv_neck_01_C_parentConstraint1.tg[0].trt";
connectAttr "LOC_neck_01_C.r" "SKcurv_neck_01_C_parentConstraint1.tg[0].tr";
connectAttr "LOC_neck_01_C.ro" "SKcurv_neck_01_C_parentConstraint1.tg[0].tro";
connectAttr "LOC_neck_01_C.s" "SKcurv_neck_01_C_parentConstraint1.tg[0].ts";
connectAttr "LOC_neck_01_C.pm" "SKcurv_neck_01_C_parentConstraint1.tg[0].tpm";
connectAttr "SKcurv_neck_01_C_parentConstraint1.w0" "SKcurv_neck_01_C_parentConstraint1.tg[0].tw"
		;
connectAttr "SKcurv_neck_02_C_parentConstraint1.ctx" "SKcurv_neck_02_C.tx";
connectAttr "SKcurv_neck_02_C_parentConstraint1.cty" "SKcurv_neck_02_C.ty";
connectAttr "SKcurv_neck_02_C_parentConstraint1.ctz" "SKcurv_neck_02_C.tz";
connectAttr "SKcurv_neck_02_C_parentConstraint1.crx" "SKcurv_neck_02_C.rx";
connectAttr "SKcurv_neck_02_C_parentConstraint1.cry" "SKcurv_neck_02_C.ry";
connectAttr "SKcurv_neck_02_C_parentConstraint1.crz" "SKcurv_neck_02_C.rz";
connectAttr "SKcurv_neck_02_C.ro" "SKcurv_neck_02_C_parentConstraint1.cro";
connectAttr "SKcurv_neck_02_C.pim" "SKcurv_neck_02_C_parentConstraint1.cpim";
connectAttr "SKcurv_neck_02_C.rp" "SKcurv_neck_02_C_parentConstraint1.crp";
connectAttr "SKcurv_neck_02_C.rpt" "SKcurv_neck_02_C_parentConstraint1.crt";
connectAttr "SKcurv_neck_02_C.jo" "SKcurv_neck_02_C_parentConstraint1.cjo";
connectAttr "LOC_neck_02_C.t" "SKcurv_neck_02_C_parentConstraint1.tg[0].tt";
connectAttr "LOC_neck_02_C.rp" "SKcurv_neck_02_C_parentConstraint1.tg[0].trp";
connectAttr "LOC_neck_02_C.rpt" "SKcurv_neck_02_C_parentConstraint1.tg[0].trt";
connectAttr "LOC_neck_02_C.r" "SKcurv_neck_02_C_parentConstraint1.tg[0].tr";
connectAttr "LOC_neck_02_C.ro" "SKcurv_neck_02_C_parentConstraint1.tg[0].tro";
connectAttr "LOC_neck_02_C.s" "SKcurv_neck_02_C_parentConstraint1.tg[0].ts";
connectAttr "LOC_neck_02_C.pm" "SKcurv_neck_02_C_parentConstraint1.tg[0].tpm";
connectAttr "SKcurv_neck_02_C_parentConstraint1.w0" "SKcurv_neck_02_C_parentConstraint1.tg[0].tw"
		;
connectAttr "SKcurv_neck_03_C_parentConstraint1.ctx" "SKcurv_neck_03_C.tx";
connectAttr "SKcurv_neck_03_C_parentConstraint1.cty" "SKcurv_neck_03_C.ty";
connectAttr "SKcurv_neck_03_C_parentConstraint1.ctz" "SKcurv_neck_03_C.tz";
connectAttr "SKcurv_neck_03_C_parentConstraint1.crx" "SKcurv_neck_03_C.rx";
connectAttr "SKcurv_neck_03_C_parentConstraint1.cry" "SKcurv_neck_03_C.ry";
connectAttr "SKcurv_neck_03_C_parentConstraint1.crz" "SKcurv_neck_03_C.rz";
connectAttr "SKcurv_neck_03_C.ro" "SKcurv_neck_03_C_parentConstraint1.cro";
connectAttr "SKcurv_neck_03_C.pim" "SKcurv_neck_03_C_parentConstraint1.cpim";
connectAttr "SKcurv_neck_03_C.rp" "SKcurv_neck_03_C_parentConstraint1.crp";
connectAttr "SKcurv_neck_03_C.rpt" "SKcurv_neck_03_C_parentConstraint1.crt";
connectAttr "SKcurv_neck_03_C.jo" "SKcurv_neck_03_C_parentConstraint1.cjo";
connectAttr "LOC_neck_03_C.t" "SKcurv_neck_03_C_parentConstraint1.tg[0].tt";
connectAttr "LOC_neck_03_C.rp" "SKcurv_neck_03_C_parentConstraint1.tg[0].trp";
connectAttr "LOC_neck_03_C.rpt" "SKcurv_neck_03_C_parentConstraint1.tg[0].trt";
connectAttr "LOC_neck_03_C.r" "SKcurv_neck_03_C_parentConstraint1.tg[0].tr";
connectAttr "LOC_neck_03_C.ro" "SKcurv_neck_03_C_parentConstraint1.tg[0].tro";
connectAttr "LOC_neck_03_C.s" "SKcurv_neck_03_C_parentConstraint1.tg[0].ts";
connectAttr "LOC_neck_03_C.pm" "SKcurv_neck_03_C_parentConstraint1.tg[0].tpm";
connectAttr "SKcurv_neck_03_C_parentConstraint1.w0" "SKcurv_neck_03_C_parentConstraint1.tg[0].tw"
		;
connectAttr "SKcurv_neck_04_C_parentConstraint1.ctx" "SKcurv_neck_04_C.tx";
connectAttr "SKcurv_neck_04_C_parentConstraint1.cty" "SKcurv_neck_04_C.ty";
connectAttr "SKcurv_neck_04_C_parentConstraint1.ctz" "SKcurv_neck_04_C.tz";
connectAttr "SKcurv_neck_04_C_parentConstraint1.crx" "SKcurv_neck_04_C.rx";
connectAttr "SKcurv_neck_04_C_parentConstraint1.cry" "SKcurv_neck_04_C.ry";
connectAttr "SKcurv_neck_04_C_parentConstraint1.crz" "SKcurv_neck_04_C.rz";
connectAttr "SKcurv_neck_04_C.ro" "SKcurv_neck_04_C_parentConstraint1.cro";
connectAttr "SKcurv_neck_04_C.pim" "SKcurv_neck_04_C_parentConstraint1.cpim";
connectAttr "SKcurv_neck_04_C.rp" "SKcurv_neck_04_C_parentConstraint1.crp";
connectAttr "SKcurv_neck_04_C.rpt" "SKcurv_neck_04_C_parentConstraint1.crt";
connectAttr "SKcurv_neck_04_C.jo" "SKcurv_neck_04_C_parentConstraint1.cjo";
connectAttr "LOC_neck_04_C.t" "SKcurv_neck_04_C_parentConstraint1.tg[0].tt";
connectAttr "LOC_neck_04_C.rp" "SKcurv_neck_04_C_parentConstraint1.tg[0].trp";
connectAttr "LOC_neck_04_C.rpt" "SKcurv_neck_04_C_parentConstraint1.tg[0].trt";
connectAttr "LOC_neck_04_C.r" "SKcurv_neck_04_C_parentConstraint1.tg[0].tr";
connectAttr "LOC_neck_04_C.ro" "SKcurv_neck_04_C_parentConstraint1.tg[0].tro";
connectAttr "LOC_neck_04_C.s" "SKcurv_neck_04_C_parentConstraint1.tg[0].ts";
connectAttr "LOC_neck_04_C.pm" "SKcurv_neck_04_C_parentConstraint1.tg[0].tpm";
connectAttr "SKcurv_neck_04_C_parentConstraint1.w0" "SKcurv_neck_04_C_parentConstraint1.tg[0].tw"
		;
connectAttr "CRV_neck_C_parentConstraint1.ctx" "CRV_neck_C.tx";
connectAttr "CRV_neck_C_parentConstraint1.cty" "CRV_neck_C.ty";
connectAttr "CRV_neck_C_parentConstraint1.ctz" "CRV_neck_C.tz";
connectAttr "CRV_neck_C_parentConstraint1.crx" "CRV_neck_C.rx";
connectAttr "CRV_neck_C_parentConstraint1.cry" "CRV_neck_C.ry";
connectAttr "CRV_neck_C_parentConstraint1.crz" "CRV_neck_C.rz";
connectAttr "CRV_neck_C_scaleConstraint1.csx" "CRV_neck_C.sx";
connectAttr "CRV_neck_C_scaleConstraint1.csy" "CRV_neck_C.sy";
connectAttr "CRV_neck_C_scaleConstraint1.csz" "CRV_neck_C.sz";
connectAttr "skinCluster1.og[0]" "CRV_neck_CShape.cr";
connectAttr "CRV_neck_C.ro" "CRV_neck_C_parentConstraint1.cro";
connectAttr "CRV_neck_C.pim" "CRV_neck_C_parentConstraint1.cpim";
connectAttr "CRV_neck_C.rp" "CRV_neck_C_parentConstraint1.crp";
connectAttr "CRV_neck_C.rpt" "CRV_neck_C_parentConstraint1.crt";
connectAttr "GRP_template_biped.t" "CRV_neck_C_parentConstraint1.tg[0].tt";
connectAttr "GRP_template_biped.rp" "CRV_neck_C_parentConstraint1.tg[0].trp";
connectAttr "GRP_template_biped.rpt" "CRV_neck_C_parentConstraint1.tg[0].trt";
connectAttr "GRP_template_biped.r" "CRV_neck_C_parentConstraint1.tg[0].tr";
connectAttr "GRP_template_biped.ro" "CRV_neck_C_parentConstraint1.tg[0].tro";
connectAttr "GRP_template_biped.s" "CRV_neck_C_parentConstraint1.tg[0].ts";
connectAttr "GRP_template_biped.pm" "CRV_neck_C_parentConstraint1.tg[0].tpm";
connectAttr "CRV_neck_C_parentConstraint1.w0" "CRV_neck_C_parentConstraint1.tg[0].tw"
		;
connectAttr "CRV_neck_C.pim" "CRV_neck_C_scaleConstraint1.cpim";
connectAttr "GRP_template_biped.s" "CRV_neck_C_scaleConstraint1.tg[0].ts";
connectAttr "GRP_template_biped.pm" "CRV_neck_C_scaleConstraint1.tg[0].tpm";
connectAttr "CRV_neck_C_scaleConstraint1.w0" "CRV_neck_C_scaleConstraint1.tg[0].tw"
		;
connectAttr "dmx_CRV_spine_C_for_TMP_spine_01_C.ot" "H_CRV_spine_C_for_TPL_spine_01_C.t"
		;
connectAttr "dmx_CRV_spine_C_for_TMP_spine_01_C.or" "H_CRV_spine_C_for_TPL_spine_01_C.r"
		;
connectAttr "dmx_CRV_spine_C_for_TMP_spine_02_C.ot" "H_CRV_spine_C_for_TPL_spine_02_C.t"
		;
connectAttr "dmx_CRV_spine_C_for_TMP_spine_02_C.or" "H_CRV_spine_C_for_TPL_spine_02_C.r"
		;
connectAttr "dmx_CRV_spine_C_for_TMP_spine_03_C.ot" "H_CRV_spine_C_for_TPL_spine_03_C.t"
		;
connectAttr "dmx_CRV_spine_C_for_TMP_spine_03_C.or" "H_CRV_spine_C_for_TPL_spine_03_C.r"
		;
connectAttr "dmx_CRV_spine_C_for_TMP_spine_04_C.ot" "H_CRV_spine_C_for_TPL_spine_04_C.t"
		;
connectAttr "dmx_CRV_spine_C_for_TMP_spine_04_C.or" "H_CRV_spine_C_for_TPL_spine_04_C.r"
		;
connectAttr "SK_spine_01_C_parentConstraint1.ctx" "SKcurv_spine_01_C.tx";
connectAttr "SK_spine_01_C_parentConstraint1.cty" "SKcurv_spine_01_C.ty";
connectAttr "SK_spine_01_C_parentConstraint1.ctz" "SKcurv_spine_01_C.tz";
connectAttr "SK_spine_01_C_parentConstraint1.crx" "SKcurv_spine_01_C.rx";
connectAttr "SK_spine_01_C_parentConstraint1.cry" "SKcurv_spine_01_C.ry";
connectAttr "SK_spine_01_C_parentConstraint1.crz" "SKcurv_spine_01_C.rz";
connectAttr "SKcurv_spine_01_C.ro" "SK_spine_01_C_parentConstraint1.cro";
connectAttr "SKcurv_spine_01_C.pim" "SK_spine_01_C_parentConstraint1.cpim";
connectAttr "SKcurv_spine_01_C.rp" "SK_spine_01_C_parentConstraint1.crp";
connectAttr "SKcurv_spine_01_C.rpt" "SK_spine_01_C_parentConstraint1.crt";
connectAttr "SKcurv_spine_01_C.jo" "SK_spine_01_C_parentConstraint1.cjo";
connectAttr "LOC_spine_01_C.t" "SK_spine_01_C_parentConstraint1.tg[0].tt";
connectAttr "LOC_spine_01_C.rp" "SK_spine_01_C_parentConstraint1.tg[0].trp";
connectAttr "LOC_spine_01_C.rpt" "SK_spine_01_C_parentConstraint1.tg[0].trt";
connectAttr "LOC_spine_01_C.r" "SK_spine_01_C_parentConstraint1.tg[0].tr";
connectAttr "LOC_spine_01_C.ro" "SK_spine_01_C_parentConstraint1.tg[0].tro";
connectAttr "LOC_spine_01_C.s" "SK_spine_01_C_parentConstraint1.tg[0].ts";
connectAttr "LOC_spine_01_C.pm" "SK_spine_01_C_parentConstraint1.tg[0].tpm";
connectAttr "SK_spine_01_C_parentConstraint1.w0" "SK_spine_01_C_parentConstraint1.tg[0].tw"
		;
connectAttr "SK_spine_02_C_parentConstraint1.ctx" "SKcurv_spine_02_C.tx";
connectAttr "SK_spine_02_C_parentConstraint1.cty" "SKcurv_spine_02_C.ty";
connectAttr "SK_spine_02_C_parentConstraint1.ctz" "SKcurv_spine_02_C.tz";
connectAttr "SK_spine_02_C_parentConstraint1.crx" "SKcurv_spine_02_C.rx";
connectAttr "SK_spine_02_C_parentConstraint1.cry" "SKcurv_spine_02_C.ry";
connectAttr "SK_spine_02_C_parentConstraint1.crz" "SKcurv_spine_02_C.rz";
connectAttr "SKcurv_spine_02_C.ro" "SK_spine_02_C_parentConstraint1.cro";
connectAttr "SKcurv_spine_02_C.pim" "SK_spine_02_C_parentConstraint1.cpim";
connectAttr "SKcurv_spine_02_C.rp" "SK_spine_02_C_parentConstraint1.crp";
connectAttr "SKcurv_spine_02_C.rpt" "SK_spine_02_C_parentConstraint1.crt";
connectAttr "SKcurv_spine_02_C.jo" "SK_spine_02_C_parentConstraint1.cjo";
connectAttr "LOC_spine_02_C.t" "SK_spine_02_C_parentConstraint1.tg[0].tt";
connectAttr "LOC_spine_02_C.rp" "SK_spine_02_C_parentConstraint1.tg[0].trp";
connectAttr "LOC_spine_02_C.rpt" "SK_spine_02_C_parentConstraint1.tg[0].trt";
connectAttr "LOC_spine_02_C.r" "SK_spine_02_C_parentConstraint1.tg[0].tr";
connectAttr "LOC_spine_02_C.ro" "SK_spine_02_C_parentConstraint1.tg[0].tro";
connectAttr "LOC_spine_02_C.s" "SK_spine_02_C_parentConstraint1.tg[0].ts";
connectAttr "LOC_spine_02_C.pm" "SK_spine_02_C_parentConstraint1.tg[0].tpm";
connectAttr "SK_spine_02_C_parentConstraint1.w0" "SK_spine_02_C_parentConstraint1.tg[0].tw"
		;
connectAttr "SK_spine_03_C_parentConstraint1.ctx" "SKcurv_spine_03_C.tx";
connectAttr "SK_spine_03_C_parentConstraint1.cty" "SKcurv_spine_03_C.ty";
connectAttr "SK_spine_03_C_parentConstraint1.ctz" "SKcurv_spine_03_C.tz";
connectAttr "SK_spine_03_C_parentConstraint1.crx" "SKcurv_spine_03_C.rx";
connectAttr "SK_spine_03_C_parentConstraint1.cry" "SKcurv_spine_03_C.ry";
connectAttr "SK_spine_03_C_parentConstraint1.crz" "SKcurv_spine_03_C.rz";
connectAttr "SKcurv_spine_03_C.ro" "SK_spine_03_C_parentConstraint1.cro";
connectAttr "SKcurv_spine_03_C.pim" "SK_spine_03_C_parentConstraint1.cpim";
connectAttr "SKcurv_spine_03_C.rp" "SK_spine_03_C_parentConstraint1.crp";
connectAttr "SKcurv_spine_03_C.rpt" "SK_spine_03_C_parentConstraint1.crt";
connectAttr "SKcurv_spine_03_C.jo" "SK_spine_03_C_parentConstraint1.cjo";
connectAttr "LOC_spine_03_C.t" "SK_spine_03_C_parentConstraint1.tg[0].tt";
connectAttr "LOC_spine_03_C.rp" "SK_spine_03_C_parentConstraint1.tg[0].trp";
connectAttr "LOC_spine_03_C.rpt" "SK_spine_03_C_parentConstraint1.tg[0].trt";
connectAttr "LOC_spine_03_C.r" "SK_spine_03_C_parentConstraint1.tg[0].tr";
connectAttr "LOC_spine_03_C.ro" "SK_spine_03_C_parentConstraint1.tg[0].tro";
connectAttr "LOC_spine_03_C.s" "SK_spine_03_C_parentConstraint1.tg[0].ts";
connectAttr "LOC_spine_03_C.pm" "SK_spine_03_C_parentConstraint1.tg[0].tpm";
connectAttr "SK_spine_03_C_parentConstraint1.w0" "SK_spine_03_C_parentConstraint1.tg[0].tw"
		;
connectAttr "SK_spine_04_C_parentConstraint1.ctx" "SKcurv_spine_04_C.tx";
connectAttr "SK_spine_04_C_parentConstraint1.cty" "SKcurv_spine_04_C.ty";
connectAttr "SK_spine_04_C_parentConstraint1.ctz" "SKcurv_spine_04_C.tz";
connectAttr "SK_spine_04_C_parentConstraint1.crx" "SKcurv_spine_04_C.rx";
connectAttr "SK_spine_04_C_parentConstraint1.cry" "SKcurv_spine_04_C.ry";
connectAttr "SK_spine_04_C_parentConstraint1.crz" "SKcurv_spine_04_C.rz";
connectAttr "SKcurv_spine_04_C.ro" "SK_spine_04_C_parentConstraint1.cro";
connectAttr "SKcurv_spine_04_C.pim" "SK_spine_04_C_parentConstraint1.cpim";
connectAttr "SKcurv_spine_04_C.rp" "SK_spine_04_C_parentConstraint1.crp";
connectAttr "SKcurv_spine_04_C.rpt" "SK_spine_04_C_parentConstraint1.crt";
connectAttr "SKcurv_spine_04_C.jo" "SK_spine_04_C_parentConstraint1.cjo";
connectAttr "LOC_spine_04_C.t" "SK_spine_04_C_parentConstraint1.tg[0].tt";
connectAttr "LOC_spine_04_C.rp" "SK_spine_04_C_parentConstraint1.tg[0].trp";
connectAttr "LOC_spine_04_C.rpt" "SK_spine_04_C_parentConstraint1.tg[0].trt";
connectAttr "LOC_spine_04_C.r" "SK_spine_04_C_parentConstraint1.tg[0].tr";
connectAttr "LOC_spine_04_C.ro" "SK_spine_04_C_parentConstraint1.tg[0].tro";
connectAttr "LOC_spine_04_C.s" "SK_spine_04_C_parentConstraint1.tg[0].ts";
connectAttr "LOC_spine_04_C.pm" "SK_spine_04_C_parentConstraint1.tg[0].tpm";
connectAttr "SK_spine_04_C_parentConstraint1.w0" "SK_spine_04_C_parentConstraint1.tg[0].tw"
		;
connectAttr "CRV_spine_C_parentConstraint1.ctx" "CRV_spine_C.tx";
connectAttr "CRV_spine_C_parentConstraint1.cty" "CRV_spine_C.ty";
connectAttr "CRV_spine_C_parentConstraint1.ctz" "CRV_spine_C.tz";
connectAttr "CRV_spine_C_parentConstraint1.crx" "CRV_spine_C.rx";
connectAttr "CRV_spine_C_parentConstraint1.cry" "CRV_spine_C.ry";
connectAttr "CRV_spine_C_parentConstraint1.crz" "CRV_spine_C.rz";
connectAttr "CRV_spine_C_scaleConstraint1.csx" "CRV_spine_C.sx";
connectAttr "CRV_spine_C_scaleConstraint1.csy" "CRV_spine_C.sy";
connectAttr "CRV_spine_C_scaleConstraint1.csz" "CRV_spine_C.sz";
connectAttr "skinCluster2.og[0]" "CRV_spine_CShape.cr";
connectAttr "CRV_spine_C.ro" "CRV_spine_C_parentConstraint1.cro";
connectAttr "CRV_spine_C.pim" "CRV_spine_C_parentConstraint1.cpim";
connectAttr "CRV_spine_C.rp" "CRV_spine_C_parentConstraint1.crp";
connectAttr "CRV_spine_C.rpt" "CRV_spine_C_parentConstraint1.crt";
connectAttr "GRP_template_biped.t" "CRV_spine_C_parentConstraint1.tg[0].tt";
connectAttr "GRP_template_biped.rp" "CRV_spine_C_parentConstraint1.tg[0].trp";
connectAttr "GRP_template_biped.rpt" "CRV_spine_C_parentConstraint1.tg[0].trt";
connectAttr "GRP_template_biped.r" "CRV_spine_C_parentConstraint1.tg[0].tr";
connectAttr "GRP_template_biped.ro" "CRV_spine_C_parentConstraint1.tg[0].tro";
connectAttr "GRP_template_biped.s" "CRV_spine_C_parentConstraint1.tg[0].ts";
connectAttr "GRP_template_biped.pm" "CRV_spine_C_parentConstraint1.tg[0].tpm";
connectAttr "CRV_spine_C_parentConstraint1.w0" "CRV_spine_C_parentConstraint1.tg[0].tw"
		;
connectAttr "CRV_spine_C.pim" "CRV_spine_C_scaleConstraint1.cpim";
connectAttr "GRP_template_biped.s" "CRV_spine_C_scaleConstraint1.tg[0].ts";
connectAttr "GRP_template_biped.pm" "CRV_spine_C_scaleConstraint1.tg[0].tpm";
connectAttr "CRV_spine_C_scaleConstraint1.w0" "CRV_spine_C_scaleConstraint1.tg[0].tw"
		;
connectAttr "TPL_clavicle_01_L.s" "TPL_clavicle_02_L.is";
connectAttr "TPL_clavicle_01_L.s" "TPL_scapula_01_L.is";
connectAttr "TPL_scapula_01_L.s" "TPL_scapula_02_L.is";
connectAttr "TPL_clavicle_01_R.s" "TPL_clavicle_02_R.is";
connectAttr "TPL_clavicle_01_R.s" "TPL_scapula_01_R.is";
connectAttr "TPL_scapula_01_R.s" "TPL_scapula_02_R.is";
connectAttr "TPL_shoulder_L.s" "TPL_elbow_L.is";
connectAttr "TPL_elbow_L.s" "TPL_wrist_L.is";
connectAttr "LOC_pv_arm_L_parentConstraint1.ctx" "LOC_pv_arm_L.tx";
connectAttr "LOC_pv_arm_L_parentConstraint1.cty" "LOC_pv_arm_L.ty";
connectAttr "LOC_pv_arm_L_parentConstraint1.ctz" "LOC_pv_arm_L.tz";
connectAttr "LOC_pv_arm_L_parentConstraint1.crx" "LOC_pv_arm_L.rx";
connectAttr "LOC_pv_arm_L_parentConstraint1.cry" "LOC_pv_arm_L.ry";
connectAttr "LOC_pv_arm_L_parentConstraint1.crz" "LOC_pv_arm_L.rz";
connectAttr "LOC_pv_arm_L.ro" "LOC_pv_arm_L_parentConstraint1.cro";
connectAttr "LOC_pv_arm_L.pim" "LOC_pv_arm_L_parentConstraint1.cpim";
connectAttr "LOC_pv_arm_L.rp" "LOC_pv_arm_L_parentConstraint1.crp";
connectAttr "LOC_pv_arm_L.rpt" "LOC_pv_arm_L_parentConstraint1.crt";
connectAttr "TPL_elbow_L.t" "LOC_pv_arm_L_parentConstraint1.tg[0].tt";
connectAttr "TPL_elbow_L.rp" "LOC_pv_arm_L_parentConstraint1.tg[0].trp";
connectAttr "TPL_elbow_L.rpt" "LOC_pv_arm_L_parentConstraint1.tg[0].trt";
connectAttr "TPL_elbow_L.r" "LOC_pv_arm_L_parentConstraint1.tg[0].tr";
connectAttr "TPL_elbow_L.ro" "LOC_pv_arm_L_parentConstraint1.tg[0].tro";
connectAttr "TPL_elbow_L.s" "LOC_pv_arm_L_parentConstraint1.tg[0].ts";
connectAttr "TPL_elbow_L.pm" "LOC_pv_arm_L_parentConstraint1.tg[0].tpm";
connectAttr "TPL_elbow_L.jo" "LOC_pv_arm_L_parentConstraint1.tg[0].tjo";
connectAttr "TPL_elbow_L.ssc" "LOC_pv_arm_L_parentConstraint1.tg[0].tsc";
connectAttr "TPL_elbow_L.is" "LOC_pv_arm_L_parentConstraint1.tg[0].tis";
connectAttr "LOC_pv_arm_L_parentConstraint1.w0" "LOC_pv_arm_L_parentConstraint1.tg[0].tw"
		;
connectAttr "TPL_shoulder_R.s" "TPL_elbow_R.is";
connectAttr "TPL_elbow_R.s" "TPL_wrist_R.is";
connectAttr "LOC_pv_arm_R_parentConstraint1.ctx" "LOC_pv_arm_R.tx";
connectAttr "LOC_pv_arm_R_parentConstraint1.cty" "LOC_pv_arm_R.ty";
connectAttr "LOC_pv_arm_R_parentConstraint1.ctz" "LOC_pv_arm_R.tz";
connectAttr "LOC_pv_arm_R_parentConstraint1.crx" "LOC_pv_arm_R.rx";
connectAttr "LOC_pv_arm_R_parentConstraint1.cry" "LOC_pv_arm_R.ry";
connectAttr "LOC_pv_arm_R_parentConstraint1.crz" "LOC_pv_arm_R.rz";
connectAttr "LOC_pv_arm_R.ro" "LOC_pv_arm_R_parentConstraint1.cro";
connectAttr "LOC_pv_arm_R.pim" "LOC_pv_arm_R_parentConstraint1.cpim";
connectAttr "LOC_pv_arm_R.rp" "LOC_pv_arm_R_parentConstraint1.crp";
connectAttr "LOC_pv_arm_R.rpt" "LOC_pv_arm_R_parentConstraint1.crt";
connectAttr "TPL_elbow_R.t" "LOC_pv_arm_R_parentConstraint1.tg[0].tt";
connectAttr "TPL_elbow_R.rp" "LOC_pv_arm_R_parentConstraint1.tg[0].trp";
connectAttr "TPL_elbow_R.rpt" "LOC_pv_arm_R_parentConstraint1.tg[0].trt";
connectAttr "TPL_elbow_R.r" "LOC_pv_arm_R_parentConstraint1.tg[0].tr";
connectAttr "TPL_elbow_R.ro" "LOC_pv_arm_R_parentConstraint1.tg[0].tro";
connectAttr "TPL_elbow_R.s" "LOC_pv_arm_R_parentConstraint1.tg[0].ts";
connectAttr "TPL_elbow_R.pm" "LOC_pv_arm_R_parentConstraint1.tg[0].tpm";
connectAttr "TPL_elbow_R.jo" "LOC_pv_arm_R_parentConstraint1.tg[0].tjo";
connectAttr "TPL_elbow_R.ssc" "LOC_pv_arm_R_parentConstraint1.tg[0].tsc";
connectAttr "TPL_elbow_R.is" "LOC_pv_arm_R_parentConstraint1.tg[0].tis";
connectAttr "LOC_pv_arm_R_parentConstraint1.w0" "LOC_pv_arm_R_parentConstraint1.tg[0].tw"
		;
connectAttr "TPL_femur_L.s" "TPL_knee_L.is";
connectAttr "TPL_knee_L.s" "TPL_ankle_L.is";
connectAttr "LOC_pv_leg_L_parentConstraint1.ctx" "LOC_pv_leg_L.tx";
connectAttr "LOC_pv_leg_L_parentConstraint1.cty" "LOC_pv_leg_L.ty";
connectAttr "LOC_pv_leg_L_parentConstraint1.ctz" "LOC_pv_leg_L.tz";
connectAttr "LOC_pv_leg_L_parentConstraint1.crx" "LOC_pv_leg_L.rx";
connectAttr "LOC_pv_leg_L_parentConstraint1.cry" "LOC_pv_leg_L.ry";
connectAttr "LOC_pv_leg_L_parentConstraint1.crz" "LOC_pv_leg_L.rz";
connectAttr "LOC_pv_leg_L.ro" "LOC_pv_leg_L_parentConstraint1.cro";
connectAttr "LOC_pv_leg_L.pim" "LOC_pv_leg_L_parentConstraint1.cpim";
connectAttr "LOC_pv_leg_L.rp" "LOC_pv_leg_L_parentConstraint1.crp";
connectAttr "LOC_pv_leg_L.rpt" "LOC_pv_leg_L_parentConstraint1.crt";
connectAttr "TPL_knee_L.t" "LOC_pv_leg_L_parentConstraint1.tg[0].tt";
connectAttr "TPL_knee_L.rp" "LOC_pv_leg_L_parentConstraint1.tg[0].trp";
connectAttr "TPL_knee_L.rpt" "LOC_pv_leg_L_parentConstraint1.tg[0].trt";
connectAttr "TPL_knee_L.r" "LOC_pv_leg_L_parentConstraint1.tg[0].tr";
connectAttr "TPL_knee_L.ro" "LOC_pv_leg_L_parentConstraint1.tg[0].tro";
connectAttr "TPL_knee_L.s" "LOC_pv_leg_L_parentConstraint1.tg[0].ts";
connectAttr "TPL_knee_L.pm" "LOC_pv_leg_L_parentConstraint1.tg[0].tpm";
connectAttr "TPL_knee_L.jo" "LOC_pv_leg_L_parentConstraint1.tg[0].tjo";
connectAttr "TPL_knee_L.ssc" "LOC_pv_leg_L_parentConstraint1.tg[0].tsc";
connectAttr "TPL_knee_L.is" "LOC_pv_leg_L_parentConstraint1.tg[0].tis";
connectAttr "LOC_pv_leg_L_parentConstraint1.w0" "LOC_pv_leg_L_parentConstraint1.tg[0].tw"
		;
connectAttr "TPL_femur_R.s" "TPL_knee_R.is";
connectAttr "TPL_knee_R.s" "TPL_ankle_R.is";
connectAttr "LOC_pv_leg_R_parentConstraint1.ctx" "LOC_pv_leg_R.tx";
connectAttr "LOC_pv_leg_R_parentConstraint1.cty" "LOC_pv_leg_R.ty";
connectAttr "LOC_pv_leg_R_parentConstraint1.ctz" "LOC_pv_leg_R.tz";
connectAttr "LOC_pv_leg_R_parentConstraint1.crx" "LOC_pv_leg_R.rx";
connectAttr "LOC_pv_leg_R_parentConstraint1.cry" "LOC_pv_leg_R.ry";
connectAttr "LOC_pv_leg_R_parentConstraint1.crz" "LOC_pv_leg_R.rz";
connectAttr "LOC_pv_leg_R.ro" "LOC_pv_leg_R_parentConstraint1.cro";
connectAttr "LOC_pv_leg_R.pim" "LOC_pv_leg_R_parentConstraint1.cpim";
connectAttr "LOC_pv_leg_R.rp" "LOC_pv_leg_R_parentConstraint1.crp";
connectAttr "LOC_pv_leg_R.rpt" "LOC_pv_leg_R_parentConstraint1.crt";
connectAttr "TPL_knee_R.t" "LOC_pv_leg_R_parentConstraint1.tg[0].tt";
connectAttr "TPL_knee_R.rp" "LOC_pv_leg_R_parentConstraint1.tg[0].trp";
connectAttr "TPL_knee_R.rpt" "LOC_pv_leg_R_parentConstraint1.tg[0].trt";
connectAttr "TPL_knee_R.r" "LOC_pv_leg_R_parentConstraint1.tg[0].tr";
connectAttr "TPL_knee_R.ro" "LOC_pv_leg_R_parentConstraint1.tg[0].tro";
connectAttr "TPL_knee_R.s" "LOC_pv_leg_R_parentConstraint1.tg[0].ts";
connectAttr "TPL_knee_R.pm" "LOC_pv_leg_R_parentConstraint1.tg[0].tpm";
connectAttr "TPL_knee_R.jo" "LOC_pv_leg_R_parentConstraint1.tg[0].tjo";
connectAttr "TPL_knee_R.ssc" "LOC_pv_leg_R_parentConstraint1.tg[0].tsc";
connectAttr "TPL_knee_R.is" "LOC_pv_leg_R_parentConstraint1.tg[0].tis";
connectAttr "LOC_pv_leg_R_parentConstraint1.w0" "LOC_pv_leg_R_parentConstraint1.tg[0].tw"
		;
connectAttr "|GRP_template_biped|TPL_CTRL_scale|GRP_template_feet|GRP_template_foot_L|TPL_foot_ankle_L.s" "TPL_toes_01_L.is"
		;
connectAttr "TPL_toes_01_L.s" "TPL_toes_02_L.is";
connectAttr "TPL_banking_outside_L.s" "TPL_banking_inside_L.is";
connectAttr "TPL_banking_inside_L.s" "TPL_banking_heel_L.is";
connectAttr "TPL_banking_heel_L.s" "TPL_spin_L.is";
connectAttr "TPL_spin_L.s" "TPL_banking_toes_L.is";
connectAttr "TPL_banking_toes_L.s" "TPL_height_toes_L.is";
connectAttr "TPL_height_toes_L.s" "TPL_toes_L.is";
connectAttr "TPL_toes_L.s" "|GRP_template_biped|TPL_CTRL_scale|GRP_template_feet|GRP_template_foot_L|TPL_banking_outside_L|TPL_banking_inside_L|TPL_banking_heel_L|TPL_spin_L|TPL_banking_toes_L|TPL_height_toes_L|TPL_toes_L|TPL_foot_ankle_L.is"
		;
connectAttr "|GRP_template_biped|TPL_CTRL_scale|GRP_template_feet|GRP_template_foot_R|TPL_foot_ankle_R.s" "TPL_toes_01_R.is"
		;
connectAttr "TPL_toes_01_R.s" "TPL_toes_02_R.is";
connectAttr "TPL_banking_outside_R.s" "TPL_banking_inside_R.is";
connectAttr "TPL_banking_inside_R.s" "TPL_banking_heel_R.is";
connectAttr "TPL_banking_heel_R.s" "TPL_spin_R.is";
connectAttr "TPL_spin_R.s" "TPL_banking_toes_R.is";
connectAttr "TPL_banking_toes_R.s" "TPL_height_toes_R.is";
connectAttr "TPL_height_toes_R.s" "TPL_toes_R.is";
connectAttr "TPL_toes_R.s" "|GRP_template_biped|TPL_CTRL_scale|GRP_template_feet|GRP_template_foot_R|TPL_banking_outside_R|TPL_banking_inside_R|TPL_banking_heel_R|TPL_spin_R|TPL_banking_toes_R|TPL_height_toes_R|TPL_toes_R|TPL_foot_ankle_R.is"
		;
connectAttr "TPL_hand_L.s" "TPL_metacarp_index_L.is";
connectAttr "TPL_metacarp_index_L.s" "TPL_index_base_L.is";
connectAttr "TPL_index_base_L.s" "TPL_index_01_L.is";
connectAttr "TPL_index_01_L.s" "TPL_index_02_L.is";
connectAttr "TPL_index_02_L.s" "TPL_index_03_L.is";
connectAttr "TPL_hand_L.s" "TPL_metacarp_thumb_L.is";
connectAttr "TPL_metacarp_thumb_L.s" "TPL_thumb_base_L.is";
connectAttr "TPL_thumb_base_L.s" "TPL_thumb_01_L.is";
connectAttr "TPL_thumb_01_L.s" "TPL_thumb_02_L.is";
connectAttr "TPL_hand_L.s" "TPL_metacarp_middle_L.is";
connectAttr "TPL_metacarp_middle_L.s" "TPL_middle_base_L.is";
connectAttr "TPL_middle_base_L.s" "TPL_middle_01_L.is";
connectAttr "TPL_middle_01_L.s" "TPL_middle_02_L.is";
connectAttr "TPL_middle_02_L.s" "TPL_middle_03_L.is";
connectAttr "TPL_hand_L.s" "TPL_metacarp_ring_L.is";
connectAttr "TPL_metacarp_ring_L.s" "TPL_ring_base_L.is";
connectAttr "TPL_ring_base_L.s" "TPL_ring_01_L.is";
connectAttr "TPL_ring_01_L.s" "TPL_ring_02_L.is";
connectAttr "TPL_ring_02_L.s" "TPL_ring_03_L.is";
connectAttr "TPL_hand_L.s" "TPL_metacarp_pinky_L.is";
connectAttr "TPL_metacarp_pinky_L.s" "TPL_pinky_base_L.is";
connectAttr "TPL_pinky_base_L.s" "TPL_pinky_01_L.is";
connectAttr "TPL_pinky_01_L.s" "TPL_pinky_02_L.is";
connectAttr "TPL_pinky_02_L.s" "TPL_pinky_03_L.is";
connectAttr "TPL_hand_R.s" "TPL_metacarp_index_R.is";
connectAttr "TPL_metacarp_index_R.s" "TPL_index_base_R.is";
connectAttr "TPL_index_base_R.s" "TPL_index_01_R.is";
connectAttr "TPL_index_01_R.s" "TPL_index_02_R.is";
connectAttr "TPL_index_02_R.s" "TPL_index_03_R.is";
connectAttr "TPL_hand_R.s" "TPL_metacarp_thumb_R.is";
connectAttr "TPL_metacarp_thumb_R.s" "TPL_thumb_base_R.is";
connectAttr "TPL_thumb_base_R.s" "TPL_thumb_01_R.is";
connectAttr "TPL_thumb_01_R.s" "TPL_thumb_02_R.is";
connectAttr "TPL_hand_R.s" "TPL_metacarp_middle_R.is";
connectAttr "TPL_metacarp_middle_R.s" "TPL_middle_base_R.is";
connectAttr "TPL_middle_base_R.s" "TPL_middle_01_R.is";
connectAttr "TPL_middle_01_R.s" "TPL_middle_02_R.is";
connectAttr "TPL_middle_02_R.s" "TPL_middle_03_R.is";
connectAttr "TPL_hand_R.s" "TPL_metacarp_ring_R.is";
connectAttr "TPL_metacarp_ring_R.s" "TPL_ring_base_R.is";
connectAttr "TPL_ring_base_R.s" "TPL_ring_01_R.is";
connectAttr "TPL_ring_01_R.s" "TPL_ring_02_R.is";
connectAttr "TPL_ring_02_R.s" "TPL_ring_03_R.is";
connectAttr "TPL_hand_R.s" "TPL_metacarp_pinky_R.is";
connectAttr "TPL_metacarp_pinky_R.s" "TPL_pinky_base_R.is";
connectAttr "TPL_pinky_base_R.s" "TPL_pinky_01_R.is";
connectAttr "TPL_pinky_01_R.s" "TPL_pinky_02_R.is";
connectAttr "TPL_pinky_02_R.s" "TPL_pinky_03_R.is";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "CRV_spine_CShape.ws" "poci_CRV_spine_C_for_TMP_spine_01_C.ic";
connectAttr "poci_CRV_spine_C_for_TMP_spine_01_C.px" "fbfmx_CRV_spine_C_for_TMP_spine_01_C.i30"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_01_C.py" "fbfmx_CRV_spine_C_for_TMP_spine_01_C.i31"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_01_C.pz" "fbfmx_CRV_spine_C_for_TMP_spine_01_C.i32"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_01_C.nnx" "fbfmx_CRV_spine_C_for_TMP_spine_01_C.i00"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_01_C.nny" "fbfmx_CRV_spine_C_for_TMP_spine_01_C.i01"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_01_C.nnz" "fbfmx_CRV_spine_C_for_TMP_spine_01_C.i02"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_01_C.ntx" "fbfmx_CRV_spine_C_for_TMP_spine_01_C.i10"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_01_C.nty" "fbfmx_CRV_spine_C_for_TMP_spine_01_C.i11"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_01_C.ntz" "fbfmx_CRV_spine_C_for_TMP_spine_01_C.i12"
		;
connectAttr "fbfmx_CRV_spine_C_for_TMP_spine_01_C.o" "mmx_CRV_spine_C_for_TMP_spine_01_C.i[0]"
		;
connectAttr "H_CRV_spine_C_for_TPL_spine_01_C.pim" "mmx_CRV_spine_C_for_TMP_spine_01_C.i[1]"
		;
connectAttr "mmx_CRV_spine_C_for_TMP_spine_01_C.o" "dmx_CRV_spine_C_for_TMP_spine_01_C.imat"
		;
connectAttr "CRV_spine_CShape.ws" "poci_CRV_spine_C_for_TMP_spine_02_C.ic";
connectAttr "poci_CRV_spine_C_for_TMP_spine_02_C.px" "fbfmx_CRV_spine_C_for_TMP_spine_02_C.i30"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_02_C.py" "fbfmx_CRV_spine_C_for_TMP_spine_02_C.i31"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_02_C.pz" "fbfmx_CRV_spine_C_for_TMP_spine_02_C.i32"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_02_C.nnx" "fbfmx_CRV_spine_C_for_TMP_spine_02_C.i00"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_02_C.nny" "fbfmx_CRV_spine_C_for_TMP_spine_02_C.i01"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_02_C.nnz" "fbfmx_CRV_spine_C_for_TMP_spine_02_C.i02"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_02_C.ntx" "fbfmx_CRV_spine_C_for_TMP_spine_02_C.i10"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_02_C.nty" "fbfmx_CRV_spine_C_for_TMP_spine_02_C.i11"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_02_C.ntz" "fbfmx_CRV_spine_C_for_TMP_spine_02_C.i12"
		;
connectAttr "fbfmx_CRV_spine_C_for_TMP_spine_02_C.o" "mmx_CRV_spine_C_for_TMP_spine_02_C.i[0]"
		;
connectAttr "H_CRV_spine_C_for_TPL_spine_02_C.pim" "mmx_CRV_spine_C_for_TMP_spine_02_C.i[1]"
		;
connectAttr "mmx_CRV_spine_C_for_TMP_spine_02_C.o" "dmx_CRV_spine_C_for_TMP_spine_02_C.imat"
		;
connectAttr "CRV_spine_CShape.ws" "poci_CRV_spine_C_for_TMP_spine_03_C.ic";
connectAttr "poci_CRV_spine_C_for_TMP_spine_03_C.px" "fbfmx_CRV_spine_C_for_TMP_spine_03_C.i30"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_03_C.py" "fbfmx_CRV_spine_C_for_TMP_spine_03_C.i31"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_03_C.pz" "fbfmx_CRV_spine_C_for_TMP_spine_03_C.i32"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_03_C.nnx" "fbfmx_CRV_spine_C_for_TMP_spine_03_C.i00"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_03_C.nny" "fbfmx_CRV_spine_C_for_TMP_spine_03_C.i01"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_03_C.nnz" "fbfmx_CRV_spine_C_for_TMP_spine_03_C.i02"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_03_C.ntx" "fbfmx_CRV_spine_C_for_TMP_spine_03_C.i10"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_03_C.nty" "fbfmx_CRV_spine_C_for_TMP_spine_03_C.i11"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_03_C.ntz" "fbfmx_CRV_spine_C_for_TMP_spine_03_C.i12"
		;
connectAttr "fbfmx_CRV_spine_C_for_TMP_spine_03_C.o" "mmx_CRV_spine_C_for_TMP_spine_03_C.i[0]"
		;
connectAttr "H_CRV_spine_C_for_TPL_spine_03_C.pim" "mmx_CRV_spine_C_for_TMP_spine_03_C.i[1]"
		;
connectAttr "mmx_CRV_spine_C_for_TMP_spine_03_C.o" "dmx_CRV_spine_C_for_TMP_spine_03_C.imat"
		;
connectAttr "CRV_spine_CShape.ws" "poci_CRV_spine_C_for_TMP_spine_04_C.ic";
connectAttr "poci_CRV_spine_C_for_TMP_spine_04_C.px" "fbfmx_CRV_spine_C_for_TMP_spine_04_C.i30"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_04_C.py" "fbfmx_CRV_spine_C_for_TMP_spine_04_C.i31"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_04_C.pz" "fbfmx_CRV_spine_C_for_TMP_spine_04_C.i32"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_04_C.nnx" "fbfmx_CRV_spine_C_for_TMP_spine_04_C.i00"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_04_C.nny" "fbfmx_CRV_spine_C_for_TMP_spine_04_C.i01"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_04_C.nnz" "fbfmx_CRV_spine_C_for_TMP_spine_04_C.i02"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_04_C.ntx" "fbfmx_CRV_spine_C_for_TMP_spine_04_C.i10"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_04_C.nty" "fbfmx_CRV_spine_C_for_TMP_spine_04_C.i11"
		;
connectAttr "poci_CRV_spine_C_for_TMP_spine_04_C.ntz" "fbfmx_CRV_spine_C_for_TMP_spine_04_C.i12"
		;
connectAttr "fbfmx_CRV_spine_C_for_TMP_spine_04_C.o" "mmx_CRV_spine_C_for_TMP_spine_04_C.i[0]"
		;
connectAttr "H_CRV_spine_C_for_TPL_spine_04_C.pim" "mmx_CRV_spine_C_for_TMP_spine_04_C.i[1]"
		;
connectAttr "mmx_CRV_spine_C_for_TMP_spine_04_C.o" "dmx_CRV_spine_C_for_TMP_spine_04_C.imat"
		;
connectAttr "CRV_neck_CShape.ws" "poci_CRV_neck_C_for_TMP_neck_01_C.ic";
connectAttr "poci_CRV_neck_C_for_TMP_neck_01_C.px" "fbfmx_CRV_neck_C_for_TMP_neck_01_C.i30"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_01_C.py" "fbfmx_CRV_neck_C_for_TMP_neck_01_C.i31"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_01_C.pz" "fbfmx_CRV_neck_C_for_TMP_neck_01_C.i32"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_01_C.nnx" "fbfmx_CRV_neck_C_for_TMP_neck_01_C.i00"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_01_C.nny" "fbfmx_CRV_neck_C_for_TMP_neck_01_C.i01"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_01_C.nnz" "fbfmx_CRV_neck_C_for_TMP_neck_01_C.i02"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_01_C.ntx" "fbfmx_CRV_neck_C_for_TMP_neck_01_C.i10"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_01_C.nty" "fbfmx_CRV_neck_C_for_TMP_neck_01_C.i11"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_01_C.ntz" "fbfmx_CRV_neck_C_for_TMP_neck_01_C.i12"
		;
connectAttr "fbfmx_CRV_neck_C_for_TMP_neck_01_C.o" "mmx_CRV_neck_C_for_TMP_neck_01_C.i[0]"
		;
connectAttr "H_CRV_neck_C_for_TPL_neck_01_C.pim" "mmx_CRV_neck_C_for_TMP_neck_01_C.i[1]"
		;
connectAttr "mmx_CRV_neck_C_for_TMP_neck_01_C.o" "dmx_CRV_neck_C_for_TMP_neck_01_C.imat"
		;
connectAttr "CRV_neck_CShape.ws" "poci_CRV_neck_C_for_TMP_neck_02_C.ic";
connectAttr "poci_CRV_neck_C_for_TMP_neck_02_C.px" "fbfmx_CRV_neck_C_for_TMP_neck_02_C.i30"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_02_C.py" "fbfmx_CRV_neck_C_for_TMP_neck_02_C.i31"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_02_C.pz" "fbfmx_CRV_neck_C_for_TMP_neck_02_C.i32"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_02_C.nnx" "fbfmx_CRV_neck_C_for_TMP_neck_02_C.i00"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_02_C.nny" "fbfmx_CRV_neck_C_for_TMP_neck_02_C.i01"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_02_C.nnz" "fbfmx_CRV_neck_C_for_TMP_neck_02_C.i02"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_02_C.ntx" "fbfmx_CRV_neck_C_for_TMP_neck_02_C.i10"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_02_C.nty" "fbfmx_CRV_neck_C_for_TMP_neck_02_C.i11"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_02_C.ntz" "fbfmx_CRV_neck_C_for_TMP_neck_02_C.i12"
		;
connectAttr "fbfmx_CRV_neck_C_for_TMP_neck_02_C.o" "mmx_CRV_neck_C_for_TMP_neck_02_C.i[0]"
		;
connectAttr "H_CRV_neck_C_for_TPL_neck_02_C.pim" "mmx_CRV_neck_C_for_TMP_neck_02_C.i[1]"
		;
connectAttr "mmx_CRV_neck_C_for_TMP_neck_02_C.o" "dmx_CRV_neck_C_for_TMP_neck_02_C.imat"
		;
connectAttr "CRV_neck_CShape.ws" "poci_CRV_neck_C_for_TMP_neck_03_C.ic";
connectAttr "poci_CRV_neck_C_for_TMP_neck_03_C.px" "fbfmx_CRV_neck_C_for_TMP_neck_03_C.i30"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_03_C.py" "fbfmx_CRV_neck_C_for_TMP_neck_03_C.i31"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_03_C.pz" "fbfmx_CRV_neck_C_for_TMP_neck_03_C.i32"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_03_C.nnx" "fbfmx_CRV_neck_C_for_TMP_neck_03_C.i00"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_03_C.nny" "fbfmx_CRV_neck_C_for_TMP_neck_03_C.i01"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_03_C.nnz" "fbfmx_CRV_neck_C_for_TMP_neck_03_C.i02"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_03_C.ntx" "fbfmx_CRV_neck_C_for_TMP_neck_03_C.i10"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_03_C.nty" "fbfmx_CRV_neck_C_for_TMP_neck_03_C.i11"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_03_C.ntz" "fbfmx_CRV_neck_C_for_TMP_neck_03_C.i12"
		;
connectAttr "fbfmx_CRV_neck_C_for_TMP_neck_03_C.o" "mmx_CRV_neck_C_for_TMP_neck_03_C.i[0]"
		;
connectAttr "H_CRV_neck_C_for_TPL_neck_03_C.pim" "mmx_CRV_neck_C_for_TMP_neck_03_C.i[1]"
		;
connectAttr "mmx_CRV_neck_C_for_TMP_neck_03_C.o" "dmx_CRV_neck_C_for_TMP_neck_03_C.imat"
		;
connectAttr "CRV_neck_CShape.ws" "poci_CRV_neck_C_for_TMP_neck_04_C.ic";
connectAttr "poci_CRV_neck_C_for_TMP_neck_04_C.px" "fbfmx_CRV_neck_C_for_TMP_neck_04_C.i30"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_04_C.py" "fbfmx_CRV_neck_C_for_TMP_neck_04_C.i31"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_04_C.pz" "fbfmx_CRV_neck_C_for_TMP_neck_04_C.i32"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_04_C.nnx" "fbfmx_CRV_neck_C_for_TMP_neck_04_C.i00"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_04_C.nny" "fbfmx_CRV_neck_C_for_TMP_neck_04_C.i01"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_04_C.nnz" "fbfmx_CRV_neck_C_for_TMP_neck_04_C.i02"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_04_C.ntx" "fbfmx_CRV_neck_C_for_TMP_neck_04_C.i10"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_04_C.nty" "fbfmx_CRV_neck_C_for_TMP_neck_04_C.i11"
		;
connectAttr "poci_CRV_neck_C_for_TMP_neck_04_C.ntz" "fbfmx_CRV_neck_C_for_TMP_neck_04_C.i12"
		;
connectAttr "fbfmx_CRV_neck_C_for_TMP_neck_04_C.o" "mmx_CRV_neck_C_for_TMP_neck_04_C.i[0]"
		;
connectAttr "H_CRV_neck_C_for_TPL_neck_04_C.pim" "mmx_CRV_neck_C_for_TMP_neck_04_C.i[1]"
		;
connectAttr "mmx_CRV_neck_C_for_TMP_neck_04_C.o" "dmx_CRV_neck_C_for_TMP_neck_04_C.imat"
		;
connectAttr "CRV_neck_CShapeOrig.ws" "skinCluster1.ip[0].ig";
connectAttr "CRV_neck_CShapeOrig.l" "skinCluster1.orggeom[0]";
connectAttr "bindPose3.msg" "skinCluster1.bp";
connectAttr "SKcurv_neck_01_C.wm" "skinCluster1.ma[0]";
connectAttr "SKcurv_neck_02_C.wm" "skinCluster1.ma[1]";
connectAttr "SKcurv_neck_03_C.wm" "skinCluster1.ma[2]";
connectAttr "SKcurv_neck_04_C.wm" "skinCluster1.ma[3]";
connectAttr "SKcurv_neck_01_C.liw" "skinCluster1.lw[0]";
connectAttr "SKcurv_neck_02_C.liw" "skinCluster1.lw[1]";
connectAttr "SKcurv_neck_03_C.liw" "skinCluster1.lw[2]";
connectAttr "SKcurv_neck_04_C.liw" "skinCluster1.lw[3]";
connectAttr "SKcurv_neck_01_C.obcc" "skinCluster1.ifcl[0]";
connectAttr "SKcurv_neck_02_C.obcc" "skinCluster1.ifcl[1]";
connectAttr "SKcurv_neck_03_C.obcc" "skinCluster1.ifcl[2]";
connectAttr "SKcurv_neck_04_C.obcc" "skinCluster1.ifcl[3]";
connectAttr "GRP_template_biped.msg" "bindPose3.m[0]";
connectAttr "GRP_template_neck_C.msg" "bindPose3.m[1]";
connectAttr "GRP_SKcurv_neck_C.msg" "bindPose3.m[2]";
connectAttr "SKcurv_neck_01_C.msg" "bindPose3.m[3]";
connectAttr "SKcurv_neck_02_C.msg" "bindPose3.m[4]";
connectAttr "SKcurv_neck_03_C.msg" "bindPose3.m[5]";
connectAttr "SKcurv_neck_04_C.msg" "bindPose3.m[6]";
connectAttr "bindPose3.w" "bindPose3.p[0]";
connectAttr "bindPose3.m[0]" "bindPose3.p[1]";
connectAttr "bindPose3.m[1]" "bindPose3.p[2]";
connectAttr "bindPose3.m[2]" "bindPose3.p[3]";
connectAttr "bindPose3.m[2]" "bindPose3.p[4]";
connectAttr "bindPose3.m[2]" "bindPose3.p[5]";
connectAttr "bindPose3.m[2]" "bindPose3.p[6]";
connectAttr "CRV_spine_CShapeOrig.ws" "skinCluster2.ip[0].ig";
connectAttr "CRV_spine_CShapeOrig.l" "skinCluster2.orggeom[0]";
connectAttr "bindPose4.msg" "skinCluster2.bp";
connectAttr "SKcurv_spine_01_C.wm" "skinCluster2.ma[0]";
connectAttr "SKcurv_spine_02_C.wm" "skinCluster2.ma[1]";
connectAttr "SKcurv_spine_03_C.wm" "skinCluster2.ma[2]";
connectAttr "SKcurv_spine_04_C.wm" "skinCluster2.ma[3]";
connectAttr "SKcurv_spine_01_C.liw" "skinCluster2.lw[0]";
connectAttr "SKcurv_spine_02_C.liw" "skinCluster2.lw[1]";
connectAttr "SKcurv_spine_03_C.liw" "skinCluster2.lw[2]";
connectAttr "SKcurv_spine_04_C.liw" "skinCluster2.lw[3]";
connectAttr "SKcurv_spine_01_C.obcc" "skinCluster2.ifcl[0]";
connectAttr "SKcurv_spine_02_C.obcc" "skinCluster2.ifcl[1]";
connectAttr "SKcurv_spine_03_C.obcc" "skinCluster2.ifcl[2]";
connectAttr "SKcurv_spine_04_C.obcc" "skinCluster2.ifcl[3]";
connectAttr "GRP_template_biped.msg" "bindPose4.m[0]";
connectAttr "GRP_template_spine_C.msg" "bindPose4.m[1]";
connectAttr "GRP_SKcurv_spine_C.msg" "bindPose4.m[2]";
connectAttr "SKcurv_spine_01_C.msg" "bindPose4.m[3]";
connectAttr "SKcurv_spine_02_C.msg" "bindPose4.m[4]";
connectAttr "SKcurv_spine_03_C.msg" "bindPose4.m[5]";
connectAttr "SKcurv_spine_04_C.msg" "bindPose4.m[6]";
connectAttr "bindPose4.w" "bindPose4.p[0]";
connectAttr "bindPose4.m[0]" "bindPose4.p[1]";
connectAttr "bindPose4.m[1]" "bindPose4.p[2]";
connectAttr "bindPose4.m[2]" "bindPose4.p[3]";
connectAttr "bindPose4.m[2]" "bindPose4.p[4]";
connectAttr "bindPose4.m[2]" "bindPose4.p[5]";
connectAttr "bindPose4.m[2]" "bindPose4.p[6]";
connectAttr ":PxrPathTracer.msg" ":rmanGlobals.ri_integrator";
connectAttr "rmanDefaultBakeDisplay.msg" ":rmanBakingGlobals.displays[0]";
connectAttr ":bake_PxrPathTracer.msg" ":rmanBakingGlobals.ri_integrator";
connectAttr "diffuse.msg" "rmanDefaultBakeDisplay.displayChannels[0]";
connectAttr "a.msg" "rmanDefaultBakeDisplay.displayChannels[1]";
connectAttr "d_openexr.msg" "rmanDefaultBakeDisplay.displayType";
connectAttr ":defaultArnoldDisplayDriver.msg" ":defaultArnoldRenderOptions.drivers"
		 -na;
connectAttr ":defaultArnoldFilter.msg" ":defaultArnoldRenderOptions.filt";
connectAttr ":defaultArnoldDriver.msg" ":defaultArnoldRenderOptions.drvr";
connectAttr "TPL_banking_inside_L.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "TPL_banking_outside_L.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr ":rmanGlobals.msg" ":defaultRenderingList1.r" -na;
connectAttr ":PxrPathTracer.msg" ":defaultRenderingList1.r" -na;
connectAttr ":rmanBakingGlobals.msg" ":defaultRenderingList1.r" -na;
connectAttr ":bake_PxrPathTracer.msg" ":defaultRenderingList1.r" -na;
connectAttr "d_openexr.msg" ":defaultRenderingList1.r" -na;
// End of template_publish.ma
