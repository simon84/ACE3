#include "script_component.hpp"
params ["_unit", "_allGear"];
if (GVAR(inhibitInventoryChanged)) exitWith {};
GVAR(inhibitInventoryChanged) = true;
private ["_items","_magId"];

#ifdef DEBUG_MODE_FULL
    ACE_LOGDEBUG("Player Inventory changed!");
#endif

_items = items _unit;

{
    if (_x in GVAR(availableDevices)) then {
        _unit removeItem _x;
        _magID = [_unit,_x] call FUNC(addBftDevice);
    };
    nil
} count _items;
GVAR(inhibitInventoryChanged) = false;
