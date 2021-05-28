extends Panel

const DrawingArea = preload("res://prefabs/drawing_area/drawing_area.tscn")
const TabItem = preload("res://prefabs/items/tab_item/tab_item.tscn")

func _on_AddTabButton_pressed():
	var button = TabItem.instance()
	button.text = "Tab"
	
	var drawing_area = DrawingArea.instance()
	get_tree().current_scene.use_drawing_area(drawing_area)
	
	var tab_info = {
		button = button,
		drawing_area = drawing_area
	}
	
	button.connect("instantiated_item", self, "_on_instantiated_item", [tab_info])
	button.connect("pressed", self, "_on_tab_pressed", [tab_info])
	$HBoxContainer.add_child(button)

func _on_tab_pressed(tab_info):
	get_tree().current_scene.use_drawing_area(tab_info.drawing_area)

func _on_instantiated_item(instance, tab_info):
	var new_tab_info = {
		button = instance,
		drawing_area = tab_info.drawing_area
	}
	instance.text = tab_info.button.text
	instance.connect("pressed", self, "_on_tab_pressed", [new_tab_info])
