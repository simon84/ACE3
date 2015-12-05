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

params ["_detailsEntry"];

private ["_index", "_value", "_id"];
_detailsEntry = _detailsEntry splitString "[]";

_detailsEntry select 1
