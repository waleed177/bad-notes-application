extends Node

var _tabs_model: TabsModel

func _ready():
	_tabs_model = TabsModel.new()
	NoteSaver.register_tabs_model(_tabs_model)

func add_tab(tab: TabItemModel):
	_tabs_model.tabs.append(tab)
