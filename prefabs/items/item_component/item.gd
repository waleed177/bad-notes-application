extends Node

var _item_prefab: PackedScene
var _mouse_down = false
var _mouse_down_location: Vector2

onready var _parent = get_parent()

signal instantiated_item(instance)
signal instantiated_draggable(draggable)

func _ready():
	_item_prefab = load(_parent.filename)
	_parent.connect("gui_input", self, "_on_gui_input")

func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			_mouse_down = true
			_mouse_down_location = _parent.get_global_mouse_position()
		else:
			_mouse_down = false
	elif event is InputEventMouseMotion:
		if _mouse_down and _parent.get_global_mouse_position().distance_to(_mouse_down_location) > 100:
			var instance = _item_prefab.instance()
			get_tree().current_scene.drawing_area.add_child(instance)
			instance.set_global_position(_parent.get_global_position() - _mouse_down_location + _parent.get_global_mouse_position())
			instance.get_node("ItemComponent")._setup_as_draggable()
			_mouse_down = false
			emit_signal("instantiated_item", instance)

func _setup_as_draggable():
	var node = Node2D.new()
	node.set_script(load("res://scripts/draggable_component.gd"))
	node.name = "draggable_component"
	_parent.add_child(node)
	node.start_dragging()
	emit_signal("instantiated_draggable", node)
	set_script(null)
