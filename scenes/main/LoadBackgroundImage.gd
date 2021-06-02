extends Button


func _on_LoadBackgroundImage_pressed():
	$FileDialog.popup_centered()


func _on_FileDialog_file_selected(path):
	var img = Image.new()
	var texture = ImageTexture.new()
	img.load(path)
	texture.create_from_image(img)
	get_tree().current_scene.drawing_area.set_background(texture)
