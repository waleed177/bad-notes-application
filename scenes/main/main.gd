extends Node2D

onready var drawing_area = get_node("DrawingArea")

func use_drawing_area(new_area):
	call_deferred("_use_drawing_area_deferred", new_area)

func _use_drawing_area_deferred(new_area):
	if drawing_area != null:
		remove_child(drawing_area)
	add_child(new_area)
	drawing_area = new_area


func _on_Save_pressed():
	NoteSaver.save_note()


func _on_Load_pressed():
	NoteSaver.load_note()
