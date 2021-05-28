extends Node2D

onready var parent: Control = get_parent()
var _dragging = false
var _dragging_offset
var _dragging_initial_position

signal dragging_status_changed(dragging)

func _ready():
	parent.connect("gui_input", self, "_on_gui_input")

func _process(delta):
	if _dragging:
		parent.set_position(parent.get_global_mouse_position() - _dragging_offset)
		if not Input.is_mouse_button_pressed(BUTTON_LEFT):
			_dragging = false
			emit_signal("dragging_status_changed", false)
		elif _dragging_initial_position.distance_to(parent.get_global_mouse_position()) > 10:
			emit_signal("dragging_status_changed", true)

func _on_gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			start_dragging()
			get_tree().set_input_as_handled()
		elif _dragging:
			_dragging = false
			get_tree().set_input_as_handled()
			emit_signal("dragging_status_changed", false)

func start_dragging():
	_dragging = true
	_dragging_offset = parent.get_global_mouse_position() - parent.get_position()
	_dragging_initial_position = parent.get_global_mouse_position()

