extends Node2D

var _prev_pos
var stroke_size = 2
var stroke_color = Color.black
var _mouse_down = false

func _process(delta):
	update()

func _draw():
	stroke_size = GlobalBrush.stroke_size
	stroke_color = GlobalBrush.stroke_color
	
	var target_position = get_parent().get_parent().get_local_mouse_position() + get_parent().size/2
	if _prev_pos == null:
		_prev_pos = target_position
	
#	if Input.is_key_pressed(KEY_E):
#			material.blend_mode = material.BLEND_MODE_SUB
   
	if _mouse_down:
		draw_line(_prev_pos, target_position, stroke_color, stroke_size*2, false)
		draw_circle(target_position, stroke_size, stroke_color)

		
	_prev_pos = target_position



#	var delta_vector: Vector2 = target_position - _prev_pos
#	var dir: Vector2 = delta_vector.normalized()
#	for i in 10:
#		draw_circle(_prev_pos + delta_vector*i/10.0, 10, Color.red)
		


func _on_DrawingArea_mouse_button_left_down(down):
	_mouse_down = down
