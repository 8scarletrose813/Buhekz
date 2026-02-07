extends Area2D

func _ready():
	connect("body_entered", self, "_on_body_entered")
func _on_body_entered(body):
	if body.has_method("add_coin"):
		body.add_coin()
	if body.name == "Player":
		queue_free()
