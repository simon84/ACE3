/*
 * Author: BadGuy
 *
 *
 * Arguments:
 * 0: device id <STRING>
 * 1: owner id (container) <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_deviceId","_ownerId"];

private ["_ind"];

_ind = GVAR(devices) find _deviceId;

if (_ind < 0) then {
    _ind = GVAR(devices) pushBack _deviceId;
};

GVAR(deviceOwner) set [_ind, _ownerId];

#ifdef DEBUG_MODE_FULL
    ACE_LOGDEBUG_2("OWNERCHANGED: %1: %2", _deviceId, _ownerId);
#endif
