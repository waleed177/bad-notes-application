extends Resource

class_name DrawingAreaModel


export(int) var texture_id: int

var texture: Texture

#will not be saved
var drawing_area_node: Node2D

func save(path):
	var path2 = path + "/note_images/" + str(texture_id) + ".png"
	var image = texture.get_data()
	image.save_png(path2)

func load_model(path):
	var path2 = path + "/note_images/" + str(texture_id) + ".png"
	
	var img = Image.new()
	var texture = ImageTexture.new()
	img.load(path2)
	texture.create_from_image(img)
	
	self.texture = texture
