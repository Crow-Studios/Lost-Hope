/*
  File: fn_stopTracing.sqf
  Author: StevioUK
  Description: Removes tracing of target's bullets
   
*/

if !(tracingPlayer isEqualTo objNull) then {
  tracingPlayer isEqualTo objNull;
  tracingPlayer = nil;
};