extends Node2D

var _move_around_canvas = false
var _move_around_canvas_offset: Vector2

var _drawing_area: DrawingAreaModel

var _temp_sprite: Sprite

func _ready():
	if _temp_sprite != null:
		for i in 10:
			yield(get_tree(), "idle_frame")
		_temp_sprite.queue_free()
		_temp_sprite = null
		_drawing_area.texture = $Canvas/Viewport.get_texture()

func setup(drawing_area: DrawingAreaModel):
	_drawing_area = drawing_area
	#TOOD
	if drawing_area.texture != null:
		_temp_sprite = Sprite.new()
		_temp_sprite.texture = drawing_area.texture
		$Canvas/Viewport.add_child(_temp_sprite)
		_temp_sprite.position = $Canvas.position
		set_background(_drawing_area.background_texture)
		for item in drawing_area.items:
			item.spawn_into(self)
	else:
		_drawing_area.texture = $Canvas/Viewport.get_texture()
	_drawing_area.drawing_area_node = self

func set_background(texture: Texture):
	$Canvas/ColorRect/TextureRect.texture = texture #Refactor this?
	_drawing_area.background_texture = texture

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.is_pressed() and _move_around_canvas:
				_move_around_canvas_offset = global_position - get_global_mouse_position() 
				get_tree().set_input_as_handled()
	elif event is InputEventKey:
		if event.scancode == KEY_SPACE:
			_move_around_canvas = event.is_pressed()
			_move_around_canvas_offset = global_position - get_global_mouse_position()
			get_tree().set_input_as_handled()

func _process(delta):
	if _move_around_canvas and Input.is_mouse_button_pressed(BUTTON_LEFT):
		position = _move_around_canvas_offset + get_global_mouse_position()
