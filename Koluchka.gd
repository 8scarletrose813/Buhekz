extends KinematicBody2D
func _on_Area2D_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(global_position)

