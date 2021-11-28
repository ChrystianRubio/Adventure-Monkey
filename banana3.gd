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
	position.x = rand_range(20, 1000)
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	velocidade_gravidade.y += gravidade * delta
	position.y += velocidade_gravidade.y * delta
	rotate(root * delta)



func _on_ChaoBananaCage_area_entered(area):
	if area.name == "banana3":
		position.y = rand_range(-400, -40)
		velocidade_gravidade.y = gravidade
		position.x = rand_range(20, 1000)
		


func _on_banana3_body_entered(body):
	position.y = rand_range(-600, -40)
	velocidade_gravidade.y = gravidade - 20
	position.x = rand_range(20, 1000)
