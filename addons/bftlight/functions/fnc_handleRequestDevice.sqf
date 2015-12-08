#include "script_component.hpp"
params ["_unitId","_containerId","_deviceClass"];

private ["_unit","_container","_ind","_counterVar","_counter","_deviceId"];

#ifdef DEBUG_MODE_FULL
    ACE_LOGDEBUG_3("REQUESTDEVICE: [%1, %2, %3]", _unitId, _containerId, _deviceClass);
#endif

if (!(_deviceClass in GVAR(availableDevices))) exitWith {};

_unit = objectFromNetId _unitId;
_container = objectFromNetId _containerId;

if (isNull _unit || isNull _container) exitWith {};


_counterVar = QGVAR(counter)+"_"+_deviceClass;
missionNamespace setVariable [_counterVar, (missionNamespace getVariable [_counterVar, 0]) + 1];

_counter = +(missionNamespace getVariable [_counterVar, 0]);
_deviceId = format[_deviceClass+"_%1",_counter];

if (backpackContainer _unit isEqualTo _container) then {
    _unit removeItemFromBackpack _deviceClass;
    _unit addItemToBackpack _deviceId;
};

if (vestContainer _unit isEqualTo _container) then {
    _unit removeItemFromVest _deviceClass;
    _unit addItemToVest _deviceId;
};

if (uniformContainer _unit isEqualTo _container) then {
    _unit removeItemFromUniform _deviceClass;
    _unit addItemToUniform _deviceId;
};

[QGVAR(ownerChanged), [_deviceId, _unitId]] call EFUNC(common,globalEvent);


#ifdef DEBUG_MODE_FULL
    ACE_LOGDEBUG_2("REQUESTDEVICE: Device %1 registered to %2", _deviceId, _unitId);
#endif
