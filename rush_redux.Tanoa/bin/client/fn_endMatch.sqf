scriptName "fn_endMatch";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_endMatch.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_endMatch.sqf"
if (isServer && !hasInterface) exitWith {};

_winners = param[0,"",[""]];

// Huh?
if (_winners == "") exitWith {};

// Make people hear the explosion :)
sleep 1;

// Close dialogs
while {dialog} do {
	closeDialog 0;
};

// Play sound!
playSound "ending";

// Save stats
[] spawn client_fnc_saveStatistics;

// No damage
player allowDamage false;

// black out
60000 cutRsc ["rr_black", "PLAIN"];
((uiNamespace getVariable ["rr_black",displayNull]) displayCtrl 0) ctrlSetPosition [1 * safezoneW + safezoneX, 0 * safezoneH + safezoneY];
((uiNamespace getVariable ["rr_black",displayNull]) displayCtrl 0) ctrlCommit 0;

// Move in
((uiNamespace getVariable ["rr_black",displayNull]) displayCtrl 0) ctrlSetPosition [0 * safezoneW + safezoneX, 0 * safezoneH + safezoneY];
((uiNamespace getVariable ["rr_black",displayNull]) displayCtrl 0) ctrlCommit 0.2;

sleep 0.25;

// Delete spawn cam if it exists
if (!isNil "cl_spawnmenu_cam") then {
	if (!isNull cl_spawnmenu_cam) then {
		camDestroy cl_spawnmenu_cam;
	};
};

// Switch to cam that hovers above the arena
cl_exitcam_object = "camera" camCreate (getPos player);
cl_exitcam_object cameraEffect ["Internal", "Back"];
cl_exitcam_object camSetFOV .65;
cl_exitcam_object camSetFocus [150, 1];
cl_exitcam_object camCommit 0;
sleep .05;
showCinemaBorder false;

// Display message
if (_winners == "attackers") then {
	if (playerSide == WEST) then {
		["THE ENEMY TEAM HAS WON THE GAME"] spawn client_fnc_displayObjectiveMessage;
	} else {
		["YOUR TEAM HAS WON THE GAME"] spawn client_fnc_displayObjectiveMessage;
	};
} else {
	if (playerSide != WEST) then {
		["THE ENEMY TEAM HAS WON THE GAME"] spawn client_fnc_displayObjectiveMessage;
	} else {
		["YOUR TEAM HAS WON THE GAME"] spawn client_fnc_displayObjectiveMessage;
	};
};

// Hide icons
//["rr_spawn_iconrenderer", "onEachFrame"] call bis_fnc_removeStackedEventHandler;

// Disable hud
//["rr_spawn_bottom_right_hud_renderer", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
300 cutRsc ["default","PLAIN"];

// Proper cam animation
cl_exitcam_object camPreparePos [((getPos sv_stage1_obj) select 0) - 200,((getPos sv_stage1_obj) select 1) - 200, 100];
cl_exitcam_object camPrepareTarget sv_stage2_obj;
cl_exitcam_object camCommitPrepared 0;
cl_exitcam_object camPreparePos [((getPos sv_stage3_obj) select 0) - 200,((getPos sv_stage3_obj) select 1) - 200, 100];
cl_exitcam_object camPrepareTarget sv_stage3_obj;
cl_exitcam_object camCommitPrepared 38;

// Blurr
if (getNumber(missionConfigFile >> "GeneralConfig" >> "PostProcessing") == 1) then {
	["DynamicBlur", 400, [3]] spawn {
		params ["_name", "_priority", "_effect", "_handle"];
		while {
			cl_spawnmenu_blur = ppEffectCreate [_name, _priority];
			cl_spawnmenu_blur < 0
		} do {
			_priority = _priority + 1;
		};
		cl_spawnmenu_blur ppEffectEnable true;
		cl_spawnmenu_blur ppEffectAdjust _effect;
		cl_spawnmenu_blur ppEffectCommit 0.1;
	};
};

sleep .3;

// Move out
((uiNamespace getVariable ["rr_black",displayNull]) displayCtrl 0) ctrlSetPosition [-1 * safezoneW + safezoneX, 0 * safezoneH + safezoneY];
((uiNamespace getVariable ["rr_black",displayNull]) displayCtrl 0) ctrlCommit 0.2;

// Lets share our stats with the others
player setVariable ["kills",cl_kills,true];
player setVariable ["deaths",cl_deaths,true];
player setVariable ["points",cl_points,true];

// Wait...
sleep 6.5;

// Display for best-ofs
250 cutRsc ["rr_end_bestof","PLAIN"];

// Inline function to fade in / fade out the display
_fadeInFadeOut = {
	disableSerialization;
	_c1 = ((uiNamespace getVariable ["rr_end_bestof", displayNull]) displayCtrl 0);
	_c2 = ((uiNamespace getVariable ["rr_end_bestof", displayNull]) displayCtrl 1);
	_c3 = ((uiNamespace getVariable ["rr_end_bestof", displayNull]) displayCtrl 2);
	_c1 ctrlSetPosition [(-0.00531252 + 1) * safezoneW + safezoneX, 0.302 * safezoneH + safezoneY];
	_c2 ctrlSetPosition [(-0.000156274 + 1) * safezoneW + safezoneX, 0.401 * safezoneH + safezoneY];
	_c3 ctrlSetPosition [(-0.000156274 + 1) * safezoneW + safezoneX, 0.533 * safezoneH + safezoneY];
	_c1 ctrlSetFade 1;
	_c2 ctrlSetFade 1;
	_c3 ctrlSetFade 1;
	_c1 ctrlCommit 0;
	_c2 ctrlCommit 0;
	_c3 ctrlCommit 0;

	// Move to middle
	_c1 ctrlSetPosition [(-0.00531252) * safezoneW + safezoneX, 0.302 * safezoneH + safezoneY];
	_c2 ctrlSetPosition [(-0.000156274) * safezoneW + safezoneX, 0.401 * safezoneH + safezoneY];
	_c3 ctrlSetPosition [(-0.000156274) * safezoneW + safezoneX, 0.533 * safezoneH + safezoneY];
	_c1 ctrlSetFade 0;
	_c2 ctrlSetFade 0;
	_c3 ctrlSetFade 0;
	_c1 ctrlCommit 0.5;
	_c2 ctrlCommit 0.5;
	_c3 ctrlCommit 0.5;

	// Wait 7 seconds
	sleep 5;

	// Move to left and fade out
	_c1 ctrlSetPosition [(-1) * safezoneW + safezoneX, 0.302 * safezoneH + safezoneY];
	_c2 ctrlSetPosition [(-1) * safezoneW + safezoneX, 0.401 * safezoneH + safezoneY];
	_c3 ctrlSetPosition [(-1) * safezoneW + safezoneX, 0.533 * safezoneH + safezoneY];
	_c1 ctrlSetFade 1;
	_c2 ctrlSetFade 1;
	_c3 ctrlSetFade 1;
	_c1 ctrlCommit 0.5;
	_c2 ctrlCommit 0.5;;
	_c3 ctrlCommit 0.5;;
};

// Lets start determining who was the best of all!
if (true) then {
	_mostKills = -1;
	_mostKillsPlayer = objNull;
	{
		if ((_x getVariable ["kills", -1]) > _mostKills) then {
			_mostKills = _x getVariable ["kills", -1];
			_mostKillsPlayer = _x;
		};
	} forEach AllPlayers;

	// Set Text
	((uiNamespace getVariable ["rr_end_bestof", displayNull]) displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='3' color='#FFFFFF' shadow='2' align='center'>%1</t>","MOST ELIMINATIONS"];
	((uiNamespace getVariable ["rr_end_bestof", displayNull]) displayCtrl 1) ctrlSetStructuredText parseText format ["<t size='6' color='#FFFFFF' shadow='2' align='center'>%1</t>",name _mostKillsPlayer];
	((uiNamespace getVariable ["rr_end_bestof", displayNull]) displayCtrl 2) ctrlSetStructuredText parseText format ["<t size='2.5' color='#FFFFFF' shadow='2' align='center'>%1</t>",_mostKillsPlayer getVariable ["kills", -1]];

	// Display
	[] spawn _fadeInFadeOut;

	// Sleep
	sleep 5.25;
};

if (true) then {
	_bestKD = -1;
	_bestKDPlayer = objNull;
	{
		_deaths = (_x getVariable ["deaths", -1]);
		if (_deaths == 0) then {_deaths = 1};
		if (((_x getVariable ["kills", -1]) / _deaths) > _bestKD) then {
			_bestKD = ((_x getVariable ["kills", -1]) / _deaths);
			_bestKDPlayer = _x;
		};
	} forEach AllPlayers;

	_deaths = (_bestKDPlayer getVariable ["deaths", -1]);
	if (_deaths == 0) then {_deaths = 1};

	// Set Text
	((uiNamespace getVariable ["rr_end_bestof", displayNull]) displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='3' color='#FFFFFF' shadow='2' align='center'>%1</t>","BEST KILL/DEATH-RATIO"];
	((uiNamespace getVariable ["rr_end_bestof", displayNull]) displayCtrl 1) ctrlSetStructuredText parseText format ["<t size='6' color='#FFFFFF' shadow='2' align='center'>%1</t>",name _bestKDPlayer];
	((uiNamespace getVariable ["rr_end_bestof", displayNull]) displayCtrl 2) ctrlSetStructuredText parseText format ["<t size='2.5' color='#FFFFFF' shadow='2' align='center'>%1</t>",((_bestKDPlayer getVariable ["kills", -1]) / _deaths)];

	// Display
	[] spawn _fadeInFadeOut;

	// Sleep
	sleep 5.25;
};

if (true) then {
	_mostPoints = -1;
	_mostPointsPlayer = objNull;
	{
		if ((_x getVariable ["points", -1]) > _mostPoints) then {
			_mostPoints = _x getVariable ["points", -1];
			_mostPointsPlayer = _x;
		};
	} forEach AllPlayers;

	// Set Text
	((uiNamespace getVariable ["rr_end_bestof", displayNull]) displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='3' color='#FFFFFF' shadow='2' align='center'>%1</t>","HIGHEST SCORE"];
	((uiNamespace getVariable ["rr_end_bestof", displayNull]) displayCtrl 1) ctrlSetStructuredText parseText format ["<t size='6' color='#FFFFFF' shadow='2' align='center'>%1</t>",name _mostPointsPlayer];
	((uiNamespace getVariable ["rr_end_bestof", displayNull]) displayCtrl 2) ctrlSetStructuredText parseText format ["<t size='2.5' color='#FFFFFF' shadow='2' align='center'>%1</t>",_mostPointsPlayer getVariable ["points", -1]];

	// Display
	[] spawn _fadeInFadeOut;

	// Sleep
	sleep 5.25;
};

if (true) then {
	_bestSquadPoints = -1;
	_bestSquad = grpNull;
	_groups = [];
	{
		_p = 0;
		{
			_p = _p + (_x getVariable ["points", 0]);
		} forEach (units _x);

		_groups pushBack [_p, _x];
	} forEach allGroups;

	{
		if ((_x select 0) > _bestSquadPoints) then {
			_bestSquad = (_x select 1);
			_bestSquadPoints = (_x select 0);

		};
	} forEach _groups;

	// All units of the squad
	_unitsText = "";
	{
		_unitsText = _unitsText + (_x getVariable ["name", ""]) + "<br/>";
	} forEach (units _bestSquad);

	// Set Text
	((uiNamespace getVariable ["rr_end_bestof", displayNull]) displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='3' color='#FFFFFF' shadow='2' align='center'>%1</t>","MOST EFFICIENT SQUAD"];
	((uiNamespace getVariable ["rr_end_bestof", displayNull]) displayCtrl 1) ctrlSetStructuredText parseText format ["<t size='6' color='#FFFFFF' shadow='2' align='center'>%1</t>",groupId _bestSquad];
	((uiNamespace getVariable ["rr_end_bestof", displayNull]) displayCtrl 2) ctrlSetStructuredText parseText format ["<t size='2.5' color='#FFFFFF' shadow='2' align='center'>%1</t>",_unitsText];

	// Display
	[] spawn _fadeInFadeOut;

	// Sleep
	sleep 4.5;
};

60000 cutRsc ["rr_black", "PLAIN"];
((uiNamespace getVariable ["rr_black",displayNull]) displayCtrl 0) ctrlSetPosition [1 * safezoneW + safezoneX, 0 * safezoneH + safezoneY];
((uiNamespace getVariable ["rr_black",displayNull]) displayCtrl 0) ctrlCommit 0;

// Move in
((uiNamespace getVariable ["rr_black",displayNull]) displayCtrl 0) ctrlSetPosition [0 * safezoneW + safezoneX, 0 * safezoneH + safezoneY];
((uiNamespace getVariable ["rr_black",displayNull]) displayCtrl 0) ctrlCommit 0.2;

sleep 1;

// To safe pos
player setPos cl_safePos;
player allowDamage true;