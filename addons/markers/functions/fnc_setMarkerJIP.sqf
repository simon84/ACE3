/*
 * Author: commy2
 * Client: Recives a marker data from server.
 *
 * Arguments:
 * 0: Array of map marker names <ARRAY>
 * 1: Array of map marker data <ARRAY>
 * 2: Logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[],[],dummyLogic] call ace_markers_fnc_setMarkerJIP;
 *
 * Public: No
 */
#include "script_component.hpp"



params ["_allMapMarkers", "_allMapMarkersProperties", "_logic"];

{
    private ["_index", "_data", "_config"];

    _index = _allMapMarkers find _x;

    if (_index != -1) then {
        _data = _allMapMarkersProperties select _index;
        _data params ["_name", "_color", "_pos", "_dir"];

        _config = (configfile >> "CfgMarkers") >> _name;
        if (!isClass _config) then {
            WARNING("CfgMarker not found, changed to milDot");
            _config == (configFile >> "CfgMarkers" >> "MilDot");
        };
        _x setMarkerTypeLocal (configName _config);

        _config = (configfile >> "CfgMarkerColors") >> _color;
        if (!isClass _config) then {
            WARNING("CfgMarkerColors not found, changed to Default");
            _config == (configFile >> "CfgMarkerColors" >> "Default");
        };
        _x setMarkerColorLocal (configName _config);

        _x setMarkerPosLocal _pos;
        _x setMarkerDirLocal _dir;
    };
} forEach allMapMarkers;

deleteVehicle _logic;
