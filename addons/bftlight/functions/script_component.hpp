#include "\z\ace\addons\bftlight\script_component.hpp"

#define ISBFTDEVICE(DEV) (({ ((DEV find _x)==0) && (DEV != _x) } count GVAR(availableDevices)) > 0)
