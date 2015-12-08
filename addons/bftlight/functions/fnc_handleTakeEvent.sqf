#include "script_component.hpp"
params ["_unit", "_container","_item"];
private ["_validItem","_targetContainer","_ind"];

if (!(local _unit)) exitWith {};

if (!ISBFTDEVICE(_validItem)) exitWith {};

if (_item in backpackItems _unit) then {
    _targetContainer = backpackContainer _unit;
};

if (_item in vestItems _unit) then {
    _targetContainer = vestContainer _unit;
};

if (_item in uniformItems _unit) then {
    _targetContainer = uniformContainer _unit;
};


[QGVAR(ownerChanged), [_item, netId _targetContainer]] call EFUNC(common,globalEvent);
#ifdef DEBUG_MODE_FULL
    ACE_LOGDEBUG_3("TAKEEVENT: Unit %1 took %2 into %3", _unit, _item, _targetContainer);
#endif
