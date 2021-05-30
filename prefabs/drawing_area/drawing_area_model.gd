extends Resource

class_name DrawingAreaModel


export(int) var texture_id: int

var texture: Texture
export(Array) var items: Array#<ItemModel>

#will not be saved
var drawing_area_node: Node2D

func save(path):
	var path2 = path + "/note_images/" + str(texture_id) + ".png"
	var image = texture.get_data()
	image.save_png(path2)
	for item in items:
		item.save(path)

func load_model(path):
	var path2 = path + "/note_images/" + str(texture_id) + ".png"
	
	var img = Image.new()
	var texture = ImageTexture.new()
	img.load(path2)
	texture.create_from_image(img)
	
	self.texture = texture

func register_item(item: ItemModel):
	items.append(item)
