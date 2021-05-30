extends ItemModel
class_name CheckboxItemModel

export(bool) var checked = false


func spawn_into(node: Node2D):
	var CheckboxItem = load("res://prefabs/items/checkbox_item/checkbox_item.tscn")
	var checkbox = CheckboxItem.instance()
	checkbox.setup(self)
	node.add_child(checkbox)
	return checkbox
