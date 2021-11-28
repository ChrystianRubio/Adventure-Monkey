extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func get_input():
	#velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 100
		$AnimatedSprite.set_flip_h(true)
		$AnimatedSprite.playing = true


	elif Input.is_action_pressed("ui_left"):
		velocity.x -= 100
		$AnimatedSprite.set_flip_h(false)
		$AnimatedSprite.playing = true
	else:
		$AnimatedSprite.playing = false
	#velocity = velocity.normalized() * speed

	#if Input.is_action_just_pressed('ui_esc'):
	#	get_tree().change_scene("")

func _physics_process(delta):
	get_input()
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)
