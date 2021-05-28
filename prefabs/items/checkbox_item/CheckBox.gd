extends CheckBox

func _ready():
	
	yield(get_tree(), "idle_frame")
	var draggable_component = get_parent().get_node("draggable_component")
	if draggable_component:
		draggable_component.connect("dragging_status_changed", self, "_on_dragging_status_changed")

func _on_dragging_status_changed(dragging):
	if dragging:
		mouse_filter = MOUSE_FILTER_IGNORE
	else:
		mouse_filter = MOUSE_FILTER_PASS
