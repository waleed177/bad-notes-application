extends Panel

var _checkbox_item_model: CheckboxItemModel


func setup(checkbox_item_model: CheckboxItemModel):
	_checkbox_item_model = checkbox_item_model
	set_global_position(_checkbox_item_model.position)
	$CheckBox.pressed = _checkbox_item_model.checked

func _on_CheckBox_toggled(button_pressed):
	if _checkbox_item_model:
		_checkbox_item_model.checked = button_pressed


func _on_ItemComponent_instantiated_item(instance):
	instance._checkbox_item_model = CheckboxItemModel.new()
	NoteSaver.register_item(instance._checkbox_item_model)

func _process(delta):
	if _checkbox_item_model != null:
		_checkbox_item_model.position = get_global_position()
