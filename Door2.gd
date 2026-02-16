extends Area2D
export(String, FILE, "*.tscn") var next_scene = "res://Ending.tscn"
var is_open = false
func _ready():
	connect("body_entered", self, "_on_body_entered")
func _on_Door_body_entered(body):
	if body.is_in_group("Player"):
		if body.has_key:
			is_open = true
			get_tree().change_scene(next_scene)
