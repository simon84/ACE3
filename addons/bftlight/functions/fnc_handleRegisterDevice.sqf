#include "script_component.hpp"
params ["_deviceId","_ownerNetId"];

private ["_ind"];

if (_deviceId in GVAR(devices)) exitWith {};
_ind = GVAR(devices) pushBack _deviceId;
GVAR(deviceOwner) set [_ind, objectFromNetId _ownerNetId];

#ifdef DEBUG_MODE_FULL
    ACE_LOGDEBUG_2("Device %1 registered to Owner %2", _deviceId, _ownerNetId);
#endif
