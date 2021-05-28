extends Label

func _ready():
	$LineEdit.connect("text_entered", self, "_on_text_entered")


func _gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.doubleclick:
			$LineEdit.show()
			$LineEdit.text = text
			$LineEdit.select_all()
			$LineEdit.grab_focus()

func _on_text_entered(a):
	text = $LineEdit.text
	$LineEdit.hide()
