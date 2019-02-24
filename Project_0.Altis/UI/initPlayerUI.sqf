// Add controls to the map
#include "Resources\MapUI\MapUI_Macros.h";
#include "Resources\UndercoverUI\UndercoverUI_Macros.h"

diag_log "--- Initializing player UI";

_cfg = missionConfigFile >> "MapUI";
_idd = 12;
[_cfg, _idd] call ui_fnc_createControlsFromConfig;
// Disable totally static controls
{
	((finddisplay 12) displayCtrl _x) ctrlEnable false;
} forEach [IDD_LD_PANEL, IDC_LD_TYPE, IDC_LD_TIME, IDC_LD_COMPOSITION, IDC_LD_SIDE];

rscLayerUndercover = ["rscLayerUndercover"] call BIS_fnc_rscLayer;	// register Undercover UI layer
uiNamespace setVariable ["undercoverUI_display", displayNull];		// set Undercover UI idd
rscLayerUndercover cutRsc ["UndercoverUI", "PLAIN", -1, false];