scriptName "fn_initHoldActions";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_initHoldActions.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_initHoldActions.sqf"
if (isServer && !hasInterface) exitWith {};

removeAllActions player;

mg_conditionShowOnMyself = {
	_currentAmmo = 0;
	_reserveAmmo = 0;

	{
		if ((_x select 0) == (currentMagazine player) AND (_x select 2)) then
		{
			_currentAmmo = (_x select 1);
		};
		if ((_x select 0) == (currentMagazine player) AND !(_x select 2)) then
		{
			_reserveAmmo = _reserveAmmo + (_x select 1);
		};
	} forEach (magazinesAmmoFull player);

	((_currentAmmo + _reserveAmmo) <= 10) && !(player getVariable ["ammo_restored",false])
};
_mg_code = {
	[player] remoteExec ["client_fnc_restoreAmmo", cl_lastActionTarget];

	// Pointsssss
	if (cl_lastActionTarget != player) then {
		["<t size='1.3' color='#FFFFFF'>AMMUNITION REPLENISHED</t>", 30] spawn client_fnc_pointfeed_add;
		[30] spawn client_fnc_addPoints;
	};

	// Make sure we cant spam it
	cl_lastActionTarget setVariable ["ammo_restored",true];

	[cl_lastActionTarget] spawn {
		if ((_this select 0) == player) then {
			sleep 60;
		} else {
			sleep 13;
		};

		// allow us to restore ammo again
		(_this select 0) setVariable ["ammo_restored",false];
	};
};

diag_log "Setting up handlers... 1";

// Ammunition for myself
_id = [
/* 0 object */							player,
/* 1 action title */					"Replenish Own Ammunition",
/* 2 idle icon */						"pictures\machinegunner.paa",
/* 3 progress icon */					"pictures\machinegunner.paa",
/* 4 condition to show */				"cl_classPerk == 'ammo' && [] call mg_conditionShowOnMyself",
/* 5 condition for action */			"true",
/* 6 code executed on start */			{cl_lastActionTarget = player;},
/* 7 code executed per tick */			{},
/* 8 code executed on completion */		_mg_code,
/* 9 code executed on interruption */	{},
/* 10 arguments */						[],
/* 11 action duration */				1,
/* 12 priority */						500,
/* 13 remove on completion */			false,
/* 14 show unconscious */				false
] call BIS_fnc_holdActionAdd;
cl_actionIDs pushBack _id;

diag_log "Setting up handlers... 2";

// Ammunition for others
_id = [
/* 0 object */							player,
/* 1 action title */					"Replenish Ammunition",
/* 2 idle icon */						"pictures\machinegunner.paa",
/* 3 progress icon */					"pictures\machinegunner.paa",
/* 4 condition to show */				"cl_classPerk == 'ammo' && (cursorObject distance _this) < 3 && alive cursorObject && !(cursorObject getVariable ['ammo_restored',false]) && (side cursorObject) == playerSide && (cursorObject isKindOf 'Man')",
/* 5 condition for action */			"!(cursorObject getVariable ['ammo_restored',false])",
/* 6 code executed on start */			{cl_lastActionTarget = cursorObject;},
/* 7 code executed per tick */			{},
/* 8 code executed on completion */		_mg_code,
/* 9 code executed on interruption */	{},
/* 10 arguments */						[],
/* 11 action duration */				1,
/* 12 priority */						500,
/* 13 remove on completion */			false,
/* 14 show unconscious */				false
] call BIS_fnc_holdActionAdd;
cl_actionIDs pushBack _id;

diag_log "Setting up handlers... 3";

// Planting and defusing objectives
_cond = "";
_text = "";
_completion = {};
if ((player getVariable ["side", sideUnknown]) == WEST) then {
	_text = "Disarm MCOM";
	_cond = "(cursorObject distance _this) < 2 && (cursorObject getVariable ['armed',false]) && (cursorObject == sv_cur_obj)";
	_completion = {if (cursorObject distance player < 2) then {[] spawn client_fnc_disarmMCOM;};};
} else {
	_text = "Arm MCOM";
	_cond = "(cursorObject distance _this) < 2 && !(cursorObject getVariable ['armed',false]) && (cursorObject == sv_cur_obj)";
	_completion = {if (cursorObject distance player < 2) then {[] spawn client_fnc_armMCOM;};};
};

diag_log "Setting up handlers... 4";

// Add action to current objective
_id = [
/* 0 object */							player,
/* 1 action title */					_text,
/* 2 idle icon */						"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\upload_ca.paa",
/* 3 progress icon */					"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\upload_ca.paa",
/* 4 condition to show */				_cond,
/* 5 condition for action */			"true",
/* 6 code executed on start */			{[sv_cur_obj, "arm"] remoteExec ["client_fnc_say3D",0]},
/* 7 code executed per tick */			{},
/* 8 code executed on completion */		_completion,
/* 9 code executed on interruption */	{},
/* 10 arguments */						[],
/* 11 action duration */				4,
/* 12 priority */						10000,
/* 13 remove on completion */			false,
/* 14 show unconscious */				false
] call bis_fnc_holdActionAdd;
cl_actionIDs pushBack _id;

diag_log "Setting up handlers... 5";

// Vehicle ammunition
_completed = {
	if (player distance cl_lastActionTarget > 5) exitWith {};

	["<t size='1.3' color='#FFFFFF'>AMMUNITION REPLENISHED</t>", 50] spawn client_fnc_pointfeed_add;
	[50] spawn client_fnc_addPoints;

	// Make sure we cant spam it
	cl_lastActionTarget setVariable ["ammo_restored",true];

	// Restore ammo depending on type of vehicle
	switch (typeOf cl_lastActionTarget) do
	{
		case "B_Heli_Light_01_armed_F":
		{
			cl_lastActionTarget setAmmo ["M134_minigun", 2000];
			//_target addMagazine "120Rnd_CMFlare_Chaff_Magazine";
		};
	};

	[cl_lastActionTarget] spawn {
		sleep 120;

		// allow us to restore ammo again
		(_this select 0) setVariable ["ammo_restored",false];
	};
};
cl_vehicleAmmoTypes = [] call client_fnc_getAllAmmoVehicles;
_completedEngineer = {
	if (player distance cl_lastActionTarget > 5) exitWith {};
	["<t size='1.3' color='#FFFFFF'>VEHICLE REPAIRED</t>", 50] spawn client_fnc_pointfeed_add;
	[50] spawn client_fnc_addPoints;

	// Make sure we cant spam it
	cl_lastActionTarget setVariable ["repaired",true];
	cl_lastActionTarget setDamage 0;
	cl_lastActionTarget setFuel 1;

	[cl_lastActionTarget] spawn {
		sleep 120;

		// allow us to restore ammo again
		(_this select 0) setVariable ["repaired",false];
	};
};

diag_log "Setting up handlers... 6";

_id = [
/* 0 object */							player,
/* 1 action title */					"Replenish Vehicle Ammunition",
/* 2 idle icon */						"pictures\machinegunner.paa",
/* 3 progress icon */					"pictures\machinegunner.paa",
/* 4 condition to show */				"cl_classPerk == 'ammo' && (cursorObject distance _this) < 3 && alive cursorObject && !(cursorObject getVariable ['ammo_restored',false]) && ((typeOf cursorObject) in cl_vehicleAmmoTypes)",
/* 5 condition for action */			"!(cursorObject getVariable ['ammo_restored',false])",
/* 6 code executed on start */			{cl_lastActionTarget = cursorObject;},
/* 7 code executed per tick */			{},
/* 8 code executed on completion */		_completed,
/* 9 code executed on interruption */	{},
/* 10 arguments */						[],
/* 11 action duration */				8,
/* 12 priority */						500,
/* 13 remove on completion */			false,
/* 14 show unconscious */				false
] call BIS_fnc_holdActionAdd;
cl_actionIDs pushBack _id;

diag_log "Setting up handlers... 7";

// Engineer repair option
_id = [
	player,
	"Repair Vehicle",
	"pictures\engineer.paa",
	"pictures\engineer.paa",
	"cl_classPerk == 'repair' && (cursorObject distance player) < 5 && alive cursorObject && !(cursorObject getVariable ['repaired',false]) && (cursorObject isKindOf 'Air' || cursorObject isKindOf 'LandVehicle' || cursorObject isKindOf 'Ship')",
	"!(cursorObject getVariable ['repaired',false])",
	{cl_lastActionTarget = cursorObject;},
	{},
	_completedEngineer,
	{},
	[],
	10,
	500,
	false,
	false
] call BIS_fnc_holdActionAdd;
cl_actionIDs pushBack _id;

diag_log "Setting up handlers... 8";