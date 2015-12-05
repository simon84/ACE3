#include "script_component.hpp"
params ["_unit", "_container","_item"];
if (!(_item in GVAR(availableDevicesMagazine))) exitWith {};
private ["_id"];
{
    _id = [_x] call FUNC(getMagazineId);
    if (_id in GVAR(devices)) then {
        if ((GVAR(deviceOwner) select (GVAR(devices) find _id)) != netId _container) then {
            [QGVAR(ownerChanged), [_id, netId _container]] call EFUNC(common,globalEvent);
        };
    };
} forEach magazinesDetail _container;

GVAR(lastContainer) = _container;
