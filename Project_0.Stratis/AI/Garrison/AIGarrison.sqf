/*
Garrison AI class
*/

#include "..\..\OOP_Light\OOP_Light.h"
#include "..\..\Message\Message.hpp"
#include "..\..\MessageTypes.hpp"
#include "garrisonWorldStateProperties.hpp"

#define pr private

CLASS("AIGarrison", "AI")

	// Array of targets known by this garrison
	VARIABLE("targets");

	METHOD("new") {
		params [["_thisObject", "", [""]]];
		
		// Initialize the world state
		pr _ws = [WSP_GAR_COUNT] call ws_new; // todo WorldState size must depend on the agent
		[_ws, WSP_GAR_AWARE_OF_ENEMY, false] call ws_setPropertyValue;
		
		// Initialize sensors
		pr _sensorHealth = NEW("SensorGarrisonHealth", [_thisObject]);
		CALLM(_thisObject, "addSensor", [_sensorHealth]);
		
		SETV(_thisObject, "worldState", _ws);
		SETV(_thisObject, "targets", []);
	} ENDMETHOD;
	
	// ----------------------------------------------------------------------
	// |                    G E T   M E S S A G E   L O O P
	// | The garrison AI resides in the same thread as the garrison
	// ----------------------------------------------------------------------
	
	METHOD("getMessageLoop") {
		gMessageLoopMain
	} ENDMETHOD;
	
	// ----------------------------------------------------------------------
	// |                    R E C E I V E   T A R G E T S
	// | Receives targets and record them to share with other groups later
	// ----------------------------------------------------------------------
	
	METHOD("recieveTargets") {
		params [["_thisObject", "", [""]], ["_targetsArray", [], [[]]]];
		
				
	} ENDMETHOD;

ENDCLASS;