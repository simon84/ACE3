#include "script_component.hpp"
params ["_unit", "_allGear"];
if (GVAR(inhibitInventoryChanged)) exitWith {};
GVAR(inhibitInventoryChanged) = true;
private ["_items","_container"];

#ifdef DEBUG_MODE_FULL
    ACE_LOGDEBUG("Player Inventory changed!");
#endif


{
    if (!isNull _x) then {
        _container = _x;
        _items = itemCargo _container;
        {
            if (_x in GVAR(availableDevices)) then {
               [QGVAR(requestDevice), [netId _unit, netId _container, _x]] call EFUNC(common,serverEvent);
            };
            nil
        } count _items;
    };
    nil
} count [backpackContainer _unit, vestContainer _unit, uniformContainer _unit];
GVAR(inhibitInventoryChanged) = false;
