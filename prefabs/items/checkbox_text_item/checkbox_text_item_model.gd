extends ItemModel
class_name CheckboxTextItemModel

export(bool) var checked = false
export(String) var text: String

func spawn_into(node: Node2D):
	var Item = load("res://prefabs/items/checkbox_text_item/checkbox_text_item.tscn")
	var item = Item.instance()
	item.setup(self)
	node.add_child(item)
	return item
