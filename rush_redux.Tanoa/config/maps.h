class Maps {
	/*class TestingEnvironment {
		tickets = 100;

		class Stages {
			class Stage1 {
				class Spawns {
					defenders[] = {8559.26,11433.3,0.00109863};
					attackers[] = {8142.21,10590.3,0.00143433};
				};
				class Objective {
					positionATL[] = {8256.23,11154.5,1.37199};
					dir = 3.656;
					classname = "Land_DataTerminal_01_F";
				};
			};
			class Stage2 {
				class Spawns {
					defenders[] = {8684.14,12406.4,0.0015564};
					attackers[] = {9116.5,11204.2,0.00122833};
				};
				class Objective {
					positionATL[] = {8864.77,11949.1,0.289886};
					dir = 146.224;
					classname = "Land_DataTerminal_01_F";
				};
			};
			class Stage3 {
				class Spawns {
					defenders[] = {7964.54,12437.2,0.00177002};
					attackers[] = {8850.74,11931.5,0.00143433};
				};
				class Objective {
					positionATL[] = {8141.48,12010.1,2.67311};
					dir = 209.1677;
					classname = "Land_DataTerminal_01_F";
				};
			};
		};
	};*/

	class TestingEnvironment2 {
		tickets = 100;
		roundTime = 600;

		date[] = {2035,6,6,18,7};
		fog = 0;
		rain = 0;
		overcast = 0;

		class PersistentVehicles {
			class Attacker {
				class attack_chopper {
					displayName = "Little Bird";
					classname = "B_Heli_Light_01_armed_F";
					respawnTime = 150;
					positionATL[] = {12560,6798.53,0.00149536};
					dir = 86.4821;
					script = "_vehicle setAmmo [""missiles_DAR"", 0];_vehicle setAmmo [""M134_minigun"", 2000];";
				};
			};
			class Defender {
				class defend_chopper {
					displayName = "Little Bird";
					classname = "B_Heli_Light_01_armed_F";
					respawnTime = 150;
					positionATL[] = {12346.9,8447.58,0.00147629};
					dir = 210.409;
					script = "_vehicle setAmmo [""missiles_DAR"", 0];_vehicle setAmmo [""M134_minigun"", 2000];";
				};
			};
		};

		class Stages {
			class Stage1 {
				class Spawns {
					defenders[] = {12698.4,7576.14,0.00129938};
					attackers[] = {12793.9,6998.93,0.00209045};
				};
				class Objective {
					positionATL[] = {12838.3,7350.8,0.393736};
					dir = 32.9604;
					classname = "Land_DataTerminal_01_F";
				};
				class Vehicles {
					class Attacker {
						class a_quad_1_1 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12743.7,6962.35,0.0016861};
							dir = 20.4821;
							script = "";
						};
						class a_quad_1_2 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12747.9,6960.81,0.00172234};
							dir = 20.4821;
							script = "";
						};
						class a_quad_1_3 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12744,6956.65,0.00165939};
							dir = 20.4821;
							script = "";
						};
					};
					class Defender {
						class d_quad_1_1 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12707.1,7610.36,0.00153255};
							dir = 129;
							script = "";
						};
						class d_quad_1_2 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12705.3,7608.26,0.00165272};
							dir = 129;
							script = "";
						};
						class d_quad_1_3 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12703,7605.32,0.0015564};
							dir = 129;
							script = "";
						};
					};
				};
			};
			class Stage2 {
				class Spawns {
					defenders[] = {12500.4,7785.69,0.00154114};
					attackers[] = {12888.3,7428.48,0.00157213};
				};
				class Objective {
					positionATL[] = {12625.8,7607.69,0.069994};
					dir = 31.5;
					classname = "Land_DataTerminal_01_F";
				};
				class Vehicles {
					class Attacker {
						class a_quad_2_1 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12898.1,7369.26,0.00140738};
							dir = 323;
							script = "";
						};
						class a_quad_2_2 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12895.6,7367.24,0.00614715};
							dir = 323;
							script = "";
						};
						class a_quad_2_3 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12893,7364.97,0.00133872};
							dir = 323;
							script = "";
						};
					};
					class Defender {
						class d_quad_2_1 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12523.1,7791.24,0.00161362};
							dir = 165;
							script = "";
						};
						class d_quad_2_2 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12519.3,7790.31,0.00156593};
							dir = 165;
							script = "";
						};
						class d_quad_2_3 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12519.8,7798.17,0.00156593};
							dir = 165;
							script = "";
						};
					};
				};
			};
			class Stage3 {
				class Spawns {
					defenders[] = {12345.5,8122.17,0.00156403};
					attackers[] = {12771.3,7624.25,0.00111723};
				};
				class Objective {
					positionATL[] = {12500,7846.74,0.34059};
					dir = 88;
					classname = "Land_DataTerminal_01_F";
				};
				class Vehicles {
					class Attacker {
						class a_quad_3_1 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12869.5,7554.27,0.00138044};
							dir = 219;
							script = "";
						};
						class a_quad_3_2 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12872.2,7557.74,0.0014534};
							dir = 323;
							script = "";
						};
						class a_quad_3_3 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12875.9,7557.04,0.00149274};
							dir = 323;
							script = "";
						};
					};
					class Defender {
						class d_quad_3_1 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12244.8,8083.51,0.00160217};
							dir = 141;
							script = "";
						};
						class d_quad_3_2 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12239.8,8079.39,0.00166702};
							dir = 141;
							script = "";
						};
						class d_quad_3_3 {
							displayName = "Quadbike";
							classname = "I_Quadbike_01_F";
							respawnTime = 30;
							positionATL[] = {12236,8084.73,0.00164795};
							dir = 141;
							script = "";
						};
					};
				};
			};
		};
	};

	class TestingEnvironment3 {
		tickets = 100;
		roundTime = 600;

		date[] = {2035,6,6,7,40};
		fog = 0;
		rain = 0;
		overcast = 0;

		class PersistentVehicles {
			class Attacker {
				class attack_chopper {
					displayName = "Little Bird";
					classname = "B_Heli_Light_01_armed_F";
					respawnTime = 150;
					positionATL[] = {12301,2304.33,0.00144386};
					dir = 270;
					script = "_vehicle setAmmo [""missiles_DAR"", 0];_vehicle setAmmo [""M134_minigun"", 2000];";
				};
			};
			class Defender {
				class defend_chopper {
					displayName = "Little Bird";
					classname = "B_Heli_Light_01_armed_F";
					respawnTime = 150;
					positionATL[] = {11746.4,3019.76,0.00155497};
					dir = 219;
					script = "_vehicle setAmmo [""missiles_DAR"", 0];_vehicle setAmmo [""M134_minigun"", 2000];";
				};
			};
		};

		class Stages {
			class Stage1 {
				class Spawns {
					defenders[] = {11686.2,2439.55,0.00143909};
					attackers[] = {12012.3,2191.71,0.00153732};
				};
				class Objective {
					positionATL[] = {11671.7,2255.03,0.335453};
					dir = 241.5;
					classname = "Land_DataTerminal_01_F";
				};
			};
			class Stage2 {
				class Spawns {
					defenders[] = {11730.5,2734.52,0.00143886};
					attackers[] = {11768.8,2312.34,0.00143874};
				};
				class Objective {
					positionATL[] = {11704,2559.91,0.152637};
					dir = 358.3
					classname = "Land_DataTerminal_01_F";
				};
			};
			class Stage3 {
				class Spawns {
					defenders[] = {11594.6,2907.03,0.00113535};
					attackers[] = {11751,2552.97,0.00172386};
				};
				class Objective {
					positionATL[] = {11608.5,2713.94,0};
					dir = 359.1;
					classname = "Land_DataTerminal_01_F";
				};
			};
		};
	};

	class TestingEnvironment4 {
		tickets = 100;
		roundTime = 600;

		date[] = {2035,6,6,18,0};
		fog = 0;
		rain = 0;
		overcast = 1;

		class PersistentVehicles {
			class Attacker {
				class attack_chopper {
					displayName = "Little Bird";
					classname = "B_Heli_Light_01_armed_F";
					respawnTime = 150;
					positionATL[] = {9704.24,9962.31,0.00155258};
					dir = 300;
					script = "_vehicle setAmmo [""missiles_DAR"", 0];_vehicle setAmmo [""M134_minigun"", 2000];";
				};
			};
			class Defender {
				class defend_chopper {
					displayName = "Little Bird";
					classname = "B_Heli_Light_01_armed_F";
					respawnTime = 150;
					positionATL[] = {8327.22,9723.96,0.00138664};
					dir = 32;
					script = "_vehicle setAmmo [""missiles_DAR"", 0];_vehicle setAmmo [""M134_minigun"", 2000];";
				};
			};
		};

		class Stages {
			class Stage1 {
				class Spawns {
					defenders[] = {8975.66,10243.9,0.00144577};
					attackers[] = {9461.56,10050.4,0.00122452};
				};
				class Objective {
					positionATL[] = {9150.29,10156.3,0.177006};
					dir = 112.8;
					classname = "Land_DataTerminal_01_F";
				};
				class Vehicles {
					class Attacker {
						class a_prowler_1_1 {
							displayName = "Prowler";
							classname = "B_T_LSV_01_unarmed_F";
							respawnTime = 20;
							positionATL[] = {9831.28,9705.5,0.00169373};
							dir = 298;
							script = "";
						};
					};
				};
			};
			class Stage2 {
				class Spawns {
					defenders[] = {8724.67,10190.4,0.00144196};
					attackers[] = {8960.28,10355.8,0.00143814};
				};
				class Objective {
					positionATL[] = {8868.22,10174,-0.000123978};
					dir = 299.8;
					classname = "Land_DataTerminal_01_F";
				};
			};
			class Stage3 {
				class Spawns {
					defenders[] = {8498.27,10156.9,0.00143814};
					attackers[] = {8842.61,10017.9,0.0014801};
				};
				class Objective {
					positionATL[] = {8628.1,10049.1,0.186518};
					dir = 313.9;
					classname = "Land_DataTerminal_01_F";
				};
			};
		};
	};

	class TestingEnvironment5 {
		tickets = 100;
		roundTime = 600;

		date[] = {2035,6,6,17,53};
		fog = 0;
		rain = 0;
		overcast = 0;

		class PersistentVehicles {
			class Attacker {
				class attack_chopper {
					displayName = "Little Bird";
					classname = "B_Heli_Light_01_armed_F";
					respawnTime = 150;
					positionATL[] = {10368.2,13430.6,0.00144672};
					dir = 266.86;
					script = "_vehicle setAmmo [""missiles_DAR"", 0];_vehicle setAmmo [""M134_minigun"", 2000];";
				};
			};
			class Defender {
				class defend_chopper {
					displayName = "Little Bird";
					classname = "B_Heli_Light_01_armed_F";
					respawnTime = 150;
					positionATL[] = {9058.6,13798,0.00143886};
					dir = 90;
					script = "_vehicle setAmmo [""missiles_DAR"", 0];_vehicle setAmmo [""M134_minigun"", 2000];";
				};
			};
		};

		class Stages {
			class Stage1 {
				class Spawns {
					defenders[] = {9645.03,13567,0.00138998};
					attackers[] = {9985.26,13589.4,0.00143886};
				};
				class Objective {
					positionATL[] = {9800.49,13523.3,0.000486135};
					dir = 88.5;
					classname = "Land_DataTerminal_01_F";
				};
			};
			class Stage2 {
				class Spawns {
					defenders[] = {9400.14,13595.8,0.00144005};
					attackers[] = {9657.84,13387.8,0.00139999};
				};
				class Objective {
					positionATL[] = {9570.79,13586.3,0.276511};
					dir = 183.511;
					classname = "Land_DataTerminal_01_F";
				};
			};
			class Stage3 {
				class Spawns {
					defenders[] = {9489.39,13089.4,0.00134277};
					attackers[] = {9585.66,13418.6,0.00183964};
				};
				class Objective {
					positionATL[] = {9486.69,13249.3,2.54244};
					dir = 89;
					classname = "Land_DataTerminal_01_F";
				};
			};
		};
	};

	class TestingEnvironment7 {
		tickets = 100;
		roundTime = 720;

		date[] = {2035,6,6,17,53};
		fog = 0;
		rain = 0;
		overcast = 0;

		class PersistentVehicles {
			class Attacker {
				class attack_chopper {
					displayName = "Little Bird";
					classname = "B_Heli_Light_01_armed_F";
					respawnTime = 150;
					positionATL[] = {13351,12150.7,0.00143886};
					dir = 203;
					script = "_vehicle setAmmo [""missiles_DAR"", 0];_vehicle setAmmo [""M134_minigun"", 2000];";
				};
				class attack_transport_chopper {
					displayName = "Transport Helicopter";
					classname = "B_Heli_Transport_01_F";
					respawnTime = 150;
					positionATL[] = {13376.7,12139.8,0.00143886};
					dir = 203;
					script = "";
				};
			};
			class Defender {
				class defend_chopper {
					displayName = "Little Bird";
					classname = "B_Heli_Light_01_armed_F";
					respawnTime = 150;
					positionATL[] = {14466.3,11236.7,0.0011158};
					dir = 260;
					script = "_vehicle setAmmo [""missiles_DAR"", 0];_vehicle setAmmo [""M134_minigun"", 2000];";
				};
			};
		};

		class Stages {
			class Stage1 {
				class Spawns {
					defenders[] = {13900,11898.3,0.00143886};
					attackers[] = {13552.2,11758.3,0.00143886};
				};
				class Objective {
					positionATL[] = {13810.2,11758.4,0.193147};
					dir = 165.6;
					classname = "Land_DataTerminal_01_F";
				};
			};
			class Stage2 {
				class Spawns {
					defenders[] = {13934.6,11878.6,0.00143886};
					attackers[] = {14063.7,12266.9,0.00143886};
				};
				class Objective {
					positionATL[] = {14024.3,12019.3,1.50464};
					dir = 135.511;
					classname = "Land_DataTerminal_01_F";
				};
			};
			class Stage3 {
				class Spawns {
					defenders[] = {14154.4,11527,0.00153923};
					attackers[] = {14205,11887.4,0.00117528};
				};
				class Objective {
					positionATL[] = {14299.3,11638.9,0.638178};
					dir = 316;
					classname = "Land_DataTerminal_01_F";
				};
			};
		};
	};
};