if (!other.solid) exit;

var _old_dir = direction;
var _dir = 0;

if (x < other.x) {
    _dir = 0;
} else if (x > other.x) {
    _dir = 180;
} else if (y < other.y) {
    _dir = 90;
} else if (y > other.y) {
    _dir = -90;
}

move_contact_solid(point_direction(x, y, other.x, other.y), -1);
motion_set(_dir, 0);

direction = _old_dir;