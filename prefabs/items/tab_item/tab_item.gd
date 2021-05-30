extends Control

var _data: TabItemModel

func setup(data: TabItemModel, setup_as_draggable=false):
	_data = data
	set_global_position(data.position)
	$Button.text = data.text
	data.connect("property_modified", self, "_on_data_property_modified")
	$Button.connect("pressed", self, "_on_button_pressed")
	$ItemComponent.connect("instantiated_item", self, "_on_instantiated_item")
	
	if setup_as_draggable:
		yield(self, "ready")
		$ItemComponent._setup_as_draggable()
	
func _gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_RIGHT:
			$ConfirmationDialog.show()
			$ConfirmationDialog/LineEdit.text = _data.text

func fix_ui_size():
	rect_min_size = $Button.rect_size

func _on_button_pressed():
	NoteSaver.set_current_tab(_data)
	get_tree().current_scene.use_drawing_area(_data.drawing_area.drawing_area_node)

func _on_ItemComponent_instantiated_draggable(draggable):
	draggable.connect("dragging_status_changed", self, "_on_dragging_status_changed")

func _on_dragging_status_changed(dragging):
	$Button.disabled = dragging

func _on_instantiated_item(item):
	item.setup(_data)
	NoteSaver.register_item(item._data)

func _on_ConfirmationDialog_confirmed():
	_data.text = $ConfirmationDialog/LineEdit.text

func _on_data_property_modified(property, value):
	if property == "text":
		$Button.text = value
		if get_tree():
			yield(get_tree(), "idle_frame")
			yield(get_tree(), "idle_frame")
			fix_ui_size()

func _process(delta):
	_data.position = get_global_position()
