extends Area2D

var velocidade = 250
var root = 0
var gravidade = 70
var velocidade_gravidade = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	set_process(true)
	root = rand_range(-2, 2) # banana rodando
	position.x = rand_range(60, 1000)
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	velocidade_gravidade.y += gravidade * delta
	position.y += velocidade_gravidade.y * delta
	rotate(root * delta)


func _on_banana_body_entered(body):
	position.y = rand_range(-100, -40)
	velocidade_gravidade.y = gravidade
	
	position.x = rand_range(20, 1000)
	

# quando a banana passar do jogador e ir para o chao que tem area2d
func _on_ChaoBananaCage_area_entered(area):
	
	if area.name == "banana":
		
		position.y = rand_range(-100, -40)
		velocidade_gravidade.y = gravidade
		position.x = rand_range(20, 1000)
	
