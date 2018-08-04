/// @desc sc_CreateItem
/// @arg name
/// @arg sprite
/// @arg desc
/// @arg max_amount



var _name = argument[0];
var _sprite = argument[1];
var _desc = argument[2];
var _max_amount = argument[3];

var _item = ds_map_create();

_item[? "id"] = current_index;
_item[? "name"] = _name;
_item[? "sprite"] = _sprite;
_item[? "desc"] = _desc;

var _spr;
if (_sprite != noone) {
	_spr = sprite_duplicate(_sprite);
	sprite_set_offset(_spr, sprite_get_width(_spr) / 2, sprite_get_height(_spr) / 2);
} else {
	_spr = noone;	
}

_item[? "inv_sprite"] = _spr;

_item[? "max_amount"] = _max_amount;



_item[? "amount"] = 0;
_item[? "stackable"] = false;
if (_item[? "max_amount"] > 1) {
	_item[? "stackable"] = true;
} else if (current_index != 0) {
	_item[? "amount"] = 1;
}

global.items[| current_index] = _item;
ds_list_mark_as_map(global.items, current_index);

current_index++;