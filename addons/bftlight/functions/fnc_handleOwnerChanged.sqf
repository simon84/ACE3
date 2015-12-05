/*
 * Author: Glowbal & BadGuy
 *
 *
 * Arguments:
 * 0: details entry <STRING>
 *
 * Return Value:
 * ID <STRING>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_id","_newOwner"];

if (_id in GVAR(devices)) then {
    GVAR(deviceOwner) set [(GVAR(devices) find _id),_newOwner];
} else {
    ACE_LOGERROR_1("BftDeviceIdNotFound: '%1'",_id);
};

_detailsEntry select 1
