#include "script_component.hpp"

{
    if (isText (configFile >> "CfgWeapons" >> _x >> QGVAR(deviceType)) && {getText(configFile >> "CfgWeapons" >> _x >> QGVAR(deviceType)) != ""}) then {

        systemChat format["%1 BFT enabled item %2", player, _x];
        diag_log format["%1 BFT enabled item %2", player, _x];

        _magazine = getText (configFile >> "CfgWeapons" >> _x >> QGVAR(magazineItem));
        if (_magazine != "") then {
            systemChat format["%1 replacing by %2", _x, _magazine];
            diag_log format["%1 replacing by %2", _x, _magazine];

            player removeItem _x;
            _previousMags = magazinesDetail _unit;
            player addMagazine _magazine;
            _newMags = (magazinesDetail player) - _previousMags;
            if ((count _newMags) == 0) exitWith {ERROR("failed to add magazine (inventory full?)");};
            _newMagName = _newMags select 0;

            systemChat format["%1 id %2", _x, _magID];
            diag_log format["%1 id %2", _x, _magID];

        };
    };
    nil
} count items player;
