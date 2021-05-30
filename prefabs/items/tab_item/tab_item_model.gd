extends ItemModel

class_name TabItemModel

signal property_modified(property, value)

export(String) var text: String setget _set_text
func _set_text(val): 
	text = val
	emit_signal("property_modified", "text", val)
export(Resource) var _drawing_area 

var drawing_area: DrawingAreaModel setget _set_drawing_area, _get_drawing_area

func _set_drawing_area(value: DrawingAreaModel):
	_drawing_area = value

func _get_drawing_area() -> DrawingAreaModel:
	return _drawing_area

func load_model(path):
	self.drawing_area.load_model(path)

func save(path):
	self.drawing_area.save(path)

func spawn_into(node: Node2D):
	var Item = load("res://prefabs/items/tab_item/tab_item.tscn")
	var item = Item.instance()
	item.setup(self, true)
	node.add_child(item)
	return item
