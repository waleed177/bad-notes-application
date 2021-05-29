extends Resource

class_name TabsModel

export(int) var free_drawing_area_id = 0
export(Array) var tabs: Array#<TabItemModel>

func save(path):
	for tab in tabs:
		tab.save(path)

func load_model(path):
	for tab in tabs:
		tab.load_model(path)
