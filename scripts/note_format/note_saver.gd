extends Node

signal note_loaded(note_model)

var _note_model: NoteModel
var _current_tab: TabItemModel

func _ready():
	_note_model = NoteModel.new()

func register_tabs_model(tabs_model: TabsModel):
	_note_model.tabs = tabs_model

func register_item(item: ItemModel):
	if _current_tab != null:
		_current_tab.tab_model.drawing_area.register_item(item)

func set_current_tab(tab: TabItemModel):
	_current_tab = tab

func save_note(path = "/home/waldo/Documents/GodotProjects/notes_application/test_note/"):
	var dir = Directory.new()
	dir.open(path)
	if not dir.dir_exists("note_images"):
		dir.make_dir("note_images")
	_note_model.save(path)

func load_note(path = "/home/waldo/Documents/GodotProjects/notes_application/test_note/"):
	_note_model = ResourceLoader.load(path + "index.tres")
	_note_model.load_model(path)
	emit_signal("note_loaded", _note_model)
