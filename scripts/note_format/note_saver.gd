extends Node

var _note_model: NoteModel

func _ready():
	_note_model = NoteModel.new()

func register_tabs_model(tabs_model: TabsModel):
	_note_model.tabs = tabs_model

func save():
	ResourceSaver.save("/home/waldo/Documents/GodotProjects/notes_application/test.tres", _note_model)
