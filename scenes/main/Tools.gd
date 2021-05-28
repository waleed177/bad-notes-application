extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ColorPickerButton_color_changed(color):
	GlobalBrush.stroke_color = color


func _on_LargeSize_pressed():
	GlobalBrush.stroke_size = 10

func _on_MediumSize_pressed():
	GlobalBrush.stroke_size = 5

func _on_SmallSize_pressed():
	GlobalBrush.stroke_size = 3
