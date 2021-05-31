extends ItemModel

class_name TabItemModel

export(Resource) var _tab_model 
var tab_model: TabModel setget _set_tab_model, _get_tab_model
func _set_tab_model(value: TabModel): _tab_model = value
func _get_tab_model() -> TabModel: return _tab_model

func load_model(path):
	self.drawing_area.load_model(path)

func save(path):
	pass

func spawn_into(node: Node2D):
	var Item = load("res://prefabs/items/tab_item/tab_item.tscn")
	var item = Item.instance()
	item.setup(self, true)
	node.add_child(item)
	return item
