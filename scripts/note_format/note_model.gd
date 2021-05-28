extends Resource

class_name NoteModel

export(Resource) var _tabs

var tabs: TabsModel setget _set_tabs, _get_tabs
func _set_tabs(value: TabsModel): _tabs = value
func _get_tabs(): return _tabs
