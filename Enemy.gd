extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var canHit = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if len($hitbox.get_overlapping_areas()) >0:
		if canHit:
			canHit=false
			print("ouch")
			iframe()
	
func _on_hitbox_area_entered(area):
	print("hitDetected")
func iframe():
	yield(get_tree().create_timer(1),"timeout")
	canHit = true
