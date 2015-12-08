params ["_player"];

{
    [QGVAR(ownerChanged), _player, [_x, GVAR(deviceOwner) select _forEachIndex]] call EFUNC(common,targetEvent);
} forEach GVAR(devices);
