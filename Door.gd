extends Area2D

export(String, FILE, "*.tscn") var World

func _on_Door_body_entered(body):
	if body.is_in_group("Player"):
		$AnimatedSprite.play("Open door")
		get_tree().change_scene("res://World.tscn")
