/// @desc sc_SetItem
/// @arg slot
/// @arg itemid



var _slot = argument0;
var _id = argument1;

var _item = ds_map_create();
ds_map_copy(_item, global.items[| _id]);

global.inventory[| _slot] = _item;
ds_list_mark_as_map(global.inventory, _slot);

return _item;