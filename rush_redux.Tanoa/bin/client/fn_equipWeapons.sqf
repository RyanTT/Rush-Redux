scriptName "fn_equipWeapons";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_equipWeapons.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_equipWeapons.sqf"
if (isServer && !hasInterface) exitWith {};

// Get equip
_equipInfo = [] call client_fnc_getLoadedEquipment;

// No mags? (Revive)
_noMags = param[0,false,[false]];

if (true) then {
	// Primary
	_primary = _equipInfo select 0;
	_primaryClassname = _primary select 0;
	_primaryAttachements = _primary select 1;

	_primaryAmmo = getText(missionConfigFile >> "Unlocks" >> _primaryClassname >> "ammo");

	// Give ammo
	if (!_noMags) then {
		// Extended ammo perk
		if (cl_squadPerk == "extended_ammo") then {
			player addMagazines [_primaryAmmo, 5];
		} else {
			player addMagazines [_primaryAmmo, 4];
		};
	};

	// Give weapon
	player addWeaponGlobal _primaryClassname;

	// Add attachments
	{
		player addPrimaryWeaponItem _x;
	} forEach _primaryAttachements;

	// Sniper scope perk
	if (cl_classPerk == "recon_scope") then {
		player addPrimaryWeaponItem "optic_KHS_blk";
	};
};

if (true) then {
	// Secondary
	_secondary = _equipInfo select 1;
	_secondaryClassname = _secondary select 0;
	_secondaryAttachements = _secondary select 1;

	_secondaryAmmo = getText(missionConfigFile >> "Unlocks" >> _secondaryClassname >> "ammo");

	// Give ammo
	if (!_noMags) then {
		// Extended ammo perk
		if (cl_squadPerk == "extended_ammo") then {
			player addMagazines [_secondaryAmmo, 6];
		} else {
			player addMagazines [_secondaryAmmo, 4];
		};
	};

	// Give weapon
	player addWeaponGlobal _secondaryClassname;

	// Add attachments
	{
		player addHandgunItem _x;
	} forEach _secondaryAttachements;
};


if (cl_class == "engineer" && cl_classPerk == "perkAA") then {
	player addBackpack "B_Kitbag_rgr";

	// Extended ammo perk
	if (cl_squadPerk == "extended_ammo") then {
		player addMagazines ["Titan_AA", 2];
	} else {
		player addMagazines ["Titan_AA", 1];
	};
	player addWeapon "launch_B_Titan_tna_F";
};

if (cl_class == "engineer" && cl_classPerk == "perkAT") then {
	player addBackpack "B_Kitbag_rgr";

	// Extended ammo perk
	if (cl_squadPerk == "extended_ammo") then {
		player addMagazines ["RPG32_F", 2];
	} else {
		player addMagazines ["RPG32_F", 1];
	};
	player addWeapon "launch_RPG32_ghex_F";
};