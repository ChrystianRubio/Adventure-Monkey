extends Area2D

export (int) var speed = 200
var velocity = Vector2()

func _ready():
	
	var velocity = Vector2()
	velocity = velocity.normalized() * speed
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
func _physics_process(delta):
	
	velocity.y += 1
	
	
	velocity = move_local_y(velocity)

