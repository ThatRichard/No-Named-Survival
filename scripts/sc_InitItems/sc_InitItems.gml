global.items = ds_list_create();

current_index = 0;

sc_CreateItem("", noone, "", 0);
sc_CreateItem("Wood", spr_ItemWood, "Tough and good for making all kind of things.", 8);
sc_CreateItem("Axe", spr_ItemAxe, "This tool seems like it could be used for something.", 1);

return current_index - 1; // Amount of items