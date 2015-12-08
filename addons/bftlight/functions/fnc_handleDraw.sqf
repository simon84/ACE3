/*
 * Author: Badguy
 * Render BFT Icons
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 */

 #include "script_component.hpp"
private ["_map","_ind","_obj"];


disableSerialization;
_map = ((findDisplay 12) displayCtrl 51);
{
    _obj = objectFromNetId (GVAR(deviceOwner) select _forEachIndex);
    if !(isNull _obj) then {
        _map drawIcon ["\A3\ui_f\data\map\markers\nato\b_unknown.paa",[0,0,1,1],_obj,24,24,0,_x,0,0.05];
    };
    nil
} forEach GVAR(devices);
