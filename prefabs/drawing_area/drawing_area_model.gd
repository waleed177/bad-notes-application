extends Resource

class_name DrawingAreaModel


export(int) var texture_id: int

var texture: Texture
var background_texture: Texture
export(Array) var items: Array#<ItemModel>

#will not be saved
var drawing_area_node: Node2D

func save(path):
	texture.get_data().save_png(path + "/note_images/" + str(texture_id) + ".png")
	
	if background_texture != null:
		background_texture.get_data().save_png(path + "/background_images/" + str(texture_id) + ".png")
	
	for item in items:
		item.save(path)

func load_model(path):
	var img = Image.new()
	img.load(path + "/note_images/" + str(texture_id) + ".png")
	self.texture = ImageTexture.new()
	self.texture.create_from_image(img)
	
	if File.new().file_exists(path + "/background_images/" + str(texture_id) + ".png"):
		var background = Image.new()
		background.load(path + "/background_images/" + str(texture_id) + ".png")
		self.background_texture = ImageTexture.new()
		self.background_texture.create_from_image(background)

func register_item(item: ItemModel):
	items.append(item)
