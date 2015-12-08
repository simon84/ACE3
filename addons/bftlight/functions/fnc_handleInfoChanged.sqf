/*
 * Author: BadGuy
 *
 *
 * Arguments:
 * 0: device id <STRING>
 * 1: Info  <Array>
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_deviceId","_info"];

private ["_ind"];

_ind = GVAR(devices) find _deviceId;

if (_ind < 0) then {
    _ind = GVAR(devices) pushBack _deviceId;
};

GVAR(deviceInfo) set [_ind, _info];

#ifdef DEBUG_MODE_FULL
    ACE_LOGDEBUG_2("INFOCHANGED: %1: %2", _deviceId, _info);
#endif
