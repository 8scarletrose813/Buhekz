extends Area2D
export(int) var damage = 2.5

func _on_Kaktus_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(global_position)
