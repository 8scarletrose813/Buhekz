extends Area2D
export(int) var damage = 3

func _on_Lava_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(global_position)
