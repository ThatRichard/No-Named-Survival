/// @desc sc_SetMapItem
/// @arg map
/// @arg itemid



var _map = argument0
var _id = argument1;

ds_map_copy(_map, global.items[| _id]);