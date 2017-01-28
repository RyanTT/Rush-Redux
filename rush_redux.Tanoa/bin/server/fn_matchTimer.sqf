scriptName "fn_matchTimer";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_matchTimer.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_matchTimer.sqf"

_additionalTime = param[1,0,[0]];

_stageTime = getNumber(missionConfigFile >> "Maps" >> sv_map >> "roundTime");
_matchStart = param[0,false,[false]];

sv_intendedTime = diag_tickTime + _stageTime + _additionalTime;
sv_matchTime = sv_intendedTime - diag_tickTime;
sv_fallBack_timeLeft = diag_tickTime + _additionalTime;

// Start timer on all clients
//[sv_matchTime] remoteExec ["client_fnc_matchTimer"];

while {sv_matchTime > 0 && sv_gameStatus == 2} do {
	sleep 1;

	// Wait until the current mcom is NOT armed
	waitUntil {!(sv_cur_obj getVariable ["armed",false])}; // This loop will either exit when the current mcom is not armed or wait until the current mcom object changes

	// Calculate time left
	_timeLeft = sv_intendedTime - diag_tickTime;

	// Only decrease the time if the current mcom is NOT done
	if !(sv_cur_obj getVariable ["done",false]) then {
		sv_matchTime = _timeLeft;
	};
};

sleep 1;

// Only if the time actually got to 0, end the match for the defenders
if (sv_matchTime <= 0) exitWith {
	[] spawn server_fnc_endRound;

	// Overwrite time values on all clients
	cl_matchTime = 0;
	[["cl_matchTime"]] spawn server_fnc_updateVars;
};