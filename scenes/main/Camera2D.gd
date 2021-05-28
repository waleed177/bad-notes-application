extends Camera2D

var _move_around_canvas = false
var _move_around_canvas_init_mouse : Vector2
var _move_around_canvas_camera_pos: Vector2

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.is_pressed():
				if _move_around_canvas:
					_move_around_canvas_camera_pos = global_position
					_move_around_canvas_init_mouse = get_global_mouse_position()
					get_tree().set_input_as_handled() 
	elif event is InputEventKey:
		if event.scancode == KEY_SPACE:
			_move_around_canvas = event.is_pressed()
			_move_around_canvas_camera_pos = global_position
			_move_around_canvas_init_mouse = get_global_mouse_position()
			get_tree().set_input_as_handled() 

func _process(delta):
	if _move_around_canvas and Input.is_mouse_button_pressed(BUTTON_LEFT):
		position =_move_around_canvas_camera_pos + _move_around_canvas_init_mouse - get_global_mouse_position()
