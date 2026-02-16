extends Area2D

var activated = false

func _on_Node2D_body_entered(body):
	if body.has_method("set_checkpoint") and not activated:
		activated = true
		body.set_checkpoint(global_position)
		$Sprite.play("pressed")
	

