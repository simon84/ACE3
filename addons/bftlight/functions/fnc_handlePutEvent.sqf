#include "script_component.hpp"
params ["_unit", "_container","_item"];
private ["_validItem","_ind"];

if (!(local _unit)) exitWith {};

// Test if valid Item
_validItem = false;
{
    if ((_item find _x)==0 && {_item != _x}) exitWith {_validItem=true;};
    nil
} count GVAR(availableDevices);

if (!_validItem) exitWith {};

[QGVAR(ownerChanged), [_item, netId _container]] call EFUNC(common,globalEvent);
#ifdef DEBUG_MODE_FULL
    ACE_LOGDEBUG_2("PUTEVENT: Device %1 put into %2", _item, _container);
#endif
