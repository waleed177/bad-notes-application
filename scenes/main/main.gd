extends Node2D

onready var drawing_area = get_node("DrawingArea")

func use_drawing_area(new_area):
	remove_child(drawing_area)
	add_child(new_area)
	drawing_area = new_area
