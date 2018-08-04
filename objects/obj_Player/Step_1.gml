if (global.pause) exit;

var _item = global.inventory[| global.hotbar_selected];

item_hand_spr = _item[? "sprite"];

if (item_hand_spr == noone) item_scale = 0;