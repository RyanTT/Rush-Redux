scriptName "fn_spawnMenu_loadClasses";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_spawnMenu_loadClasses.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_spawnMenu_loadClasses.sqf"
if (isServer && !hasInterface) exitWith {};

disableSerialization;

// Spawn menu display listbox
_l = (findDisplay 5000) displayCtrl 300;

// Allow listbox selection changes to update our "customize class" button (some classes are not customizeable atm so theres no reason for people to be able to click it)
_l ctrlAddEventHandler ["LBSelChanged", {
	_class = (_this select 0) lbData (_this select 1);

	// Customizeable button
	switch (_class) do
	{
		case "medic":
		{
			((findDisplay 5000) displayCtrl 301) ctrlSetText "CHANGE CLASS/SQUAD PERKS";
			((findDisplay 5000) displayCtrl 301) ctrlEnable true;
		};

		case "machinegunner":
		{
			((findDisplay 5000) displayCtrl 301) ctrlSetText "CHANGE CLASS/SQUAD PERKS";
			((findDisplay 5000) displayCtrl 301) ctrlEnable true;
		};

		case "recon":
		{
			((findDisplay 5000) displayCtrl 301) ctrlSetText "CHANGE CLASS/SQUAD PERKS";
			((findDisplay 5000) displayCtrl 301) ctrlEnable true;
		};

		case "engineer":
		{
			((findDisplay 5000) displayCtrl 301) ctrlSetText "CHANGE CLASS/SQUAD PERKS";
			((findDisplay 5000) displayCtrl 301) ctrlEnable true;
		};
	};

	// Save preferred class index
	profileNamespace setVariable ["rr_class_preferredIndex", (_this select 1)];

	// Save class so any other scripts can instantly get our currently selected class // Please note that broadcasting this will be done only when actually spawning
	cl_class = _class;
}];

// Add default classes
// Medic
_l lbAdd "Field Medic";
_l lbSetData [(lbSize _l) - 1, "medic"];

// Machine Gunner
_l lbAdd "Machine Gunner";
_l lbSetData [(lbSize _l) - 1, "machinegunner"];

// Recon
_l lbAdd "Recon";
_l lbSetData [(lbSize _l) - 1, "recon"];

// Engineer
_l lbAdd "Engineer";
_l lbSetData [(lbSize _l) - 1, "engineer"];

// Get preferred class index from profileNamespace
_i = profileNamespace getVariable ["rr_class_preferredIndex", 0];

// Select listbox item
_l lbSetCurSel _i;

// Allow our sweet sour dank memes so I learned how to bunny hop button to be able to open the menu depending on our selected class
((findDisplay 5000) displayCtrl 301) ctrlAddEventHandler ["ButtonDown", {
	_class = ((findDisplay 5000) displayCtrl 300) lbData (lbCurSel ((findDisplay 5000) displayCtrl 300));

	[_class] spawn client_fnc_spawnMenu_displayClassCustomization;
}];