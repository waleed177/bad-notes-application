extends Node

signal loaded_tab(tab)

var _tabs_model: TabsModel

func _ready():
	_tabs_model = TabsModel.new()
	NoteSaver.register_tabs_model(_tabs_model)
	
	NoteSaver.connect("note_loaded", self, "_on_note_loaded")

func add_tab(tab: TabModel):
	_tabs_model.free_drawing_area_id += 1
	tab.drawing_area.texture_id = _tabs_model.free_drawing_area_id
	_tabs_model.tabs.append(tab)

func _on_note_loaded(note_model: NoteModel):
	_tabs_model = note_model.tabs
	for tab in _tabs_model.tabs:
		emit_signal("loaded_tab", tab)
