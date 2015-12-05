/*
 * Author: BadGuy
 *
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: BFTLight CfgWeapons Class <STRING>
 *
 * Return Value:
 * ID <STRING>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", ["_deviceClass",""]];

private ["_returnValue","_magazine","_newMag","_previousMags"];

_returnValue = "";

if (!local _unit) exitWith {ACE_LOGERROR_1("Unit has to be Local: %1",_unit);_returnValue};

if (_deviceClass in GVAR(availableDevices)) then {

    #ifdef DEBUG_MODE_FULL
        ACE_LOGDEBUG_2("%1 added BFT item: %2", player, _deviceClass);
    #endif

    _magazine = getText (configFile >> "CfgWeapons" >> _deviceClass >> QGVAR(magazineItem));
    if (_magazine != "") then {

        #ifdef DEBUG_MODE_FULL
            ACE_LOGDEBUG_3("%1 replacing %2 by %3", player, _deviceClass, _magazine);
        #endif

        _previousMags = magazinesDetail player;
        player addMagazine _magazine;
        _newMag = (magazinesDetail _unit) - _previousMags;
        if ((count _newMag) == 0) exitWith {ACE_LOGERROR("failed to add magazine (inventory full?)");};
        _newMag = _newMag select 0;

        _magID = [_newMag] call FUNC(getMagazineId);

        #ifdef DEBUG_MODE_FULL
            ACE_LOGDEBUG_2("%1 ID: %2", _deviceClass, _magID);
        #endif

        [QGVAR(registerDevice), [_magId, netId _unit]] call EFUNC(common,globalEvent);

    } else {
        ACE_LOGERROR_1("BftDeviceNotFound: '%1'",_deviceClass);
    };
} else {
    ACE_LOGERROR_1("BftDeviceNotFound: '%1'",_deviceClass);
};

_returnValue
