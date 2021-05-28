extends Sprite

signal mouse_button_left_down

func _ready():
	texture = $Viewport.get_texture()

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.is_pressed():
				emit_signal("mouse_button_left_down", true)
			
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if not event.is_pressed():
				emit_signal("mouse_button_left_down", false)
