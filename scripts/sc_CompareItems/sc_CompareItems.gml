/// @desc sc_CompareItems
/// @arg map1
/// @arg map2



var _item1 = argument0;
var _item2 = argument1;

if (_item1[? "id"] == _item2[? "id"]) {
	return false;
}

return true;