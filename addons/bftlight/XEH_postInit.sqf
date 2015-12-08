#include "script_component.hpp"

GVAR(devices) = [];
GVAR(deviceOwner) = [];
GVAR(deviceInfo) = [];
GVAR(inhibitInventoryChanged) = false;
GVAR(availableDevices) = ["ACE_DK10_b","ACE_DK10_o","ACE_DK10_i","ACE_GD300_b","ACE_GD300_o","ACE_GD300_i"];
GVAR(availableDevicesMagazine) = ["ACE_DK10Magazine_b","ACE_DK10Magazine_o","ACE_DK10Magazine_i","ACE_GD300Magazine_b","ACE_GD300Magazine_o","ACE_GD300Magazine_i"];

["playerInventoryChanged", FUNC(handlePlayerInventoryChanged)] call EFUNC(common,addEventHandler);
[QGVAR(requestDevice), FUNC(handleRequestDevice)] call EFUNC(common,addEventHandler);
[QGVAR(ownerChanged), FUNC(handleOwnerChanged)] call EFUNC(common,addEventHandler);

if (isServer) exitWith {
    ["PlayerJIP", FUNC(handleJIP)] call EFUNC(common,addEventHandler);
};


[] spawn {
    waitUntil {!isNull ((findDisplay 12) displayCtrl 51)};
    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw",FUNC(handleDraw)];
};
