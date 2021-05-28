extends Control

var _item_prefab: PackedScene
var _mouse_down = false
var _mouse_down_location: Vector2

signal instantiated_item(instance)

func _ready():
	_item_prefab = load(filename)

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			_mouse_down = true
			_mouse_down_location = get_global_mouse_position()
		else:
			_mouse_down = false
	elif event is InputEventMouseMotion:
		if _mouse_down and get_global_mouse_position().distance_to(_mouse_down_location) > 100:
			var instance = _item_prefab.instance()
			get_tree().current_scene.drawing_area.add_child(instance)
			instance.set_global_position(get_global_position() - _mouse_down_location + get_global_mouse_position())
			instance._setup_as_draggable()
			_mouse_down = false
			emit_signal("instantiated_item", instance)

func _setup_as_draggable():
	set_script(null)
	var node = Node2D.new()
	node.set_script(load("res://scripts/draggable_component.gd"))
	node.name = "draggable_component"
	add_child(node)
	node.start_dragging()
