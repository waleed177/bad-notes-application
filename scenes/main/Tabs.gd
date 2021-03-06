extends Panel

const DrawingArea = preload("res://prefabs/drawing_area/drawing_area.tscn")
const TabItem = preload("res://prefabs/items/tab_item/tab_item.tscn")

func _ready():
	TabManager.connect("loaded_tab", self, "_on_loaded_tab")

func _on_AddTabButton_pressed():
	var tab_button_model := TabItemModel.new()
	
	var tab_model = TabModel.new()
	var drawing_area_model = DrawingAreaModel.new()
	DrawingArea.instance().setup(drawing_area_model)
	tab_model.drawing_area = drawing_area_model
	
	tab_model.text = "New Tab"
	
	tab_button_model.tab_model = tab_model
	
	TabManager.add_tab(tab_model)
	#get_tree().current_scene.use_drawing_area(tab_button_model.drawing_area.drawing_area_node)
	
	_create_tab_button(tab_button_model)

func _on_loaded_tab(tab_model: TabModel):
	DrawingArea.instance().setup(tab_model.drawing_area)
	
	var tab_button_model := TabItemModel.new()
	tab_button_model.tab_model = tab_model
	
	_create_tab_button(tab_button_model)

func _create_tab_button(tab_button_model: TabItemModel):
	var button = TabItem.instance()
	$HBoxContainer.add_child(button)
	button.setup(tab_button_model)
	
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	button.fix_ui_size()
