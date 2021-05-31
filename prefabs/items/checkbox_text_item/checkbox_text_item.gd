extends Panel

var _item: CheckboxTextItemModel


func setup(item: CheckboxTextItemModel):
	_item = item
	set_global_position(item.position)
	$CheckBox.pressed = item.checked
	$Label.text = item.text
	yield(self, "ready")
	$ItemComponent._setup_as_draggable()

func _on_CheckBox_toggled(button_pressed):
	if _item:
		_item.checked = button_pressed

func _on_ItemComponent_instantiated_item(instance):
	instance._item = CheckboxTextItemModel.new()
	instance._item.text = $Label.text
	NoteSaver.register_item(instance._item)

func _process(delta):
	if _item != null:
		_item.position = get_global_position()

func _on_Label_text_changed(text):
	_item.text = text
