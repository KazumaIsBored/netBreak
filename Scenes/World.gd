extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("New Anim")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	centerShader()
	


func centerShader():
	var playerPos = $Player/Sprite.get_global_transform_with_canvas().origin /get_viewport().size
	playerPos.y = 1-playerPos.y
	if playerPos.x > 0.5:
		playerPos.x +=0.04
	if playerPos.x < 0.5:
		playerPos.x -=0.04
	$ColorRect.material.set_shader_param("center",playerPos)
