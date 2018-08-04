enum VarTypes {
	Int,
	Float,
	Bool,
	String,
	Enum,
	Object
}

global.Inspector = id;

obj_type_map = ds_map_create();

cur_obj = noone;
cur_index = 0;

global.cur_inspected = noone;