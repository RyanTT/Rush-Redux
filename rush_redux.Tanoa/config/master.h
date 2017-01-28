class GeneralConfig {
	// Debugging
	debug = 1;

	// Database information
	// DB Name: RushRedux

	// Time after round
	lobbyTime = 20;

	// Should the server restart the mission after x rounds have been played?
	// This option should ALWAYS be turned on as it helps improve performance MASSIVLY
	// Only available on dedicated servers
	PerformanceRestart = 1;

	// After how many matches?
	MatchCount = 10;

	// (or) After how many seconds?
	MatchTime = 18000;

	// Load weather of specific map?
	LoadWeather = 0;

	// Should the auto team balancer be running?
	AutoTeamBalancer = 1;

	// At what team difference should the team balancer force switches?
	AutoTeamBalanceAtDifference = 5;

	// Fall back time for defenders
	FallBackSeconds = 45;

	// ServerCommandPassword
	commandPassword = "kei29fsd9cm3idm";

	// Use post processing in menus
	PostProcessing = 1;
};

class Soldiers {
	class Attackers {
		uniform = "U_I_C_Soldier_Bandit_3_F";
		goggles = "G_Bandanna_blk";
		headgear = "H_MilCap_gry";
		vest = "V_TacVest_brn";
	};
	class Defenders {
		uniform = "U_B_GEN_Soldier_F";
		goggles = "G_Aviator";
		headgear = "H_MilCap_gen_F";
		vest = "V_TacVest_blk";
	};
};