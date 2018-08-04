// Use exit to prevent changes

var _mouse_item = global.mouse;
var _inv_item = global.inventory[| global.selected_slot];

var _mouse_id = _mouse_item[? "id"];
var _inv_id = _inv_item[? "id"];

var _mouse_amount = _mouse_item[? "amount"];
var _inv_amount = _inv_item[? "amount"];

var _mouse_max_amount = _mouse_item[? "max_amount"];
var _inv_max_amount = _inv_item[? "max_amount"];

if (_mouse_id == 0 && _inv_id == 0) exit;

if (mouse_check_button_pressed(mb_left)) {
	if (sc_CompareItems(_inv_item, _mouse_item)) {
		sc_SwapMapSlots(_inv_item, _mouse_item);
		exit; // To prevent any other changes - everything is done by the script
	} else {
		if (_inv_amount + _mouse_amount <= _inv_max_amount) {
			_inv_amount += _mouse_amount;
			
			_mouse_amount = 0;
		} else {
			_mouse_amount -= _inv_max_amount - _inv_amount;
			
			_inv_amount = _inv_max_amount;
		}
	}
} else if (mouse_check_button_pressed(mb_right)) {
	if (_inv_id == 0 || ((!sc_CompareItems(_inv_item, _mouse_item)) && ((_inv_amount + 1) <= _inv_max_amount))) {
		sc_SetMapItem(_inv_item, _mouse_id);
		
		_inv_amount++;
		_mouse_amount--;
	} else if (_mouse_id == 0 && _inv_amount > 1) {
		var _inv_half = floor(_inv_amount / 2);
		
		_inv_amount -= _inv_half;
		var _item = sc_SetMapItem(_mouse_item, _inv_id);
		_mouse_amount += _inv_half;
		
	}
}

_mouse_item[? "amount"] = _mouse_amount
_inv_item[? "amount"] = _inv_amount;

if (_mouse_amount == 0) {
	sc_SetMapItem(_mouse_item, 0);
}

if (_inv_amount == 0) {
	sc_SetMapItem(_inv_item, 0);
}