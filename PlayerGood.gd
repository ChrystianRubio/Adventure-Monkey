extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var quantidadeDeBananas = 0
var vidas = 3
var numeroAleatorioParaMacacoBarulho = rand_range(0, 100)

func get_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 100
		$AnimatedSprite.set_flip_h(false)
		$AnimatedSprite.playing = true
		
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= 100
		$AnimatedSprite.set_flip_h(true)
		$AnimatedSprite.playing = true
		
	else:
		$AnimatedSprite.playing = false
	

	if Input.is_action_pressed("ui_space"):
		speed = 350
	else:
		speed = 200
	
	if Input.is_action_just_pressed('ui_esc'):
		get_tree().change_scene("res://Menu.tscn") 
	
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)


# funcinando o contador de bananas
func _on_banana_body_entered(body):
	quantidadeDeBananas += 1
	macacoFazBarulho()


func _on_banana2_body_entered(body):
	quantidadeDeBananas += 2
	macacoFazBarulho()


func _on_banana3_body_entered(body):
	quantidadeDeBananas += 3
	macacoFazBarulho()


func _on_Cage_body_entered(body):
	Input.vibrate_handheld(500)
	$MacacoGrito.play()
	if vidas <= 1: # aqui na verdade e 0 mas o godot ve 1 a mais
		get_tree().change_scene("res://Menu.tscn")
		
	else:
		vidas -= 1

func _on_Cage2_body_entered(body):
	Input.vibrate_handheld(500)
	$MacacoGrito.play()
	if vidas <= 1: # aqui na verdade e 0 mas o godot ve 1 a mais
		get_tree().change_scene("res://Menu.tscn")
	else:
		vidas -= 1
		

# verifica se o numero aleatorio é menor que 13, se for macaco faz barulho
func macacoFazBarulho():
	numeroAleatorioParaMacacoBarulho = rand_range(0, 100)
	if numeroAleatorioParaMacacoBarulho < 17:
		$MacacoBarulho.play()


func _on_Cage3_body_entered(body):
	Input.vibrate_handheld(700)
	$MacacoGrito.play()
	if vidas <= 1: # aqui na verdade e 0 mas o godot ve 1 a mais
		get_tree().change_scene("res://Menu.tscn")
	else:
		vidas -= 1
