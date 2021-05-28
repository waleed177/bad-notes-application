extends Panel

const DrawingArea = preload("res://prefabs/drawing_area/drawing_area.tscn")
const TabItem = preload("res://prefabs/items/tab_item/tab_item.tscn")

func _on_AddTabButton_pressed():
	var button = TabItem.instance()
	
	var tab_model := TabItemModel.new()
	tab_model.text = "Tab"
	tab_model.drawing_area = DrawingAreaModel.new()
	tab_model.drawing_area.drawing_area_node = DrawingArea.instance()
	TabManager.add_tab(tab_model)
	get_tree().current_scene.use_drawing_area(tab_model.drawing_area.drawing_area_node)
	
	$HBoxContainer.add_child(button)
	button.setup(tab_model)
	
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	button.fix_ui_size()
