extends KinematicBody2D


# Declare member variables here. Examples:
var velocity = Vector2()
var speed = 700
var jumpSpeed = 1200
var gravity = 2000
var canAttack = true
export (float, 0, 1.0) var friction = 0.2
export (float, 0, 1.0) var acceleration = 0.25
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	getInput()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
func getInput():
	var dir = 0
	if Input.is_action_pressed("left"):
		dir -=1
		$Sprite.flip_h =true
		$swordBox.rotation_degrees = 180
	if Input.is_action_pressed("right"):
		dir +=1
		$Sprite.flip_h = false
		$swordBox.rotation_degrees = 0
	if Input.is_action_pressed("jump"):
		if is_on_floor():
			velocity.y = -jumpSpeed
	if Input.is_action_just_released("jump"):
			if velocity.y < -100:
				velocity.y = lerp(velocity.y,-100,0.6)
	if Input.is_action_just_pressed("attack"):
		attack()
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)

func attack():
	if canAttack:
		canAttack = false
		print("swoosh")
		$swordBox/shape.disabled = false
		yield(get_tree().create_timer(0.2), "timeout")
		$swordBox/shape.disabled=true
		$Attacktimer.start()


func _on_Attacktimer_timeout():
	canAttack = true
