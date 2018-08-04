/// @desc sc_SwapSlots
/// @arg id1

/// @arg id2



var _id1 = argument0;
var _id2 = argument1;

var _temp = ds_map_create();
ds_map_copy(_temp, _id1);

ds_map_copy(_id1, _id2);
ds_map_copy(_id2, _temp);

ds_map_destroy(_temp);