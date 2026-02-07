extends HBoxContainer

export(Texture) var full_heart
export(Texture) var half_heart
export(Texture) var empty_heart

func update_hearts(health, max_health):
	for i in range(get_child_count()):
		var heart = get_child(i)
		if i < int(health):
			heart.texture = full_heart
		elif i < health:
			heart.texture = half_heart
		else:
			heart.texture = empty_heart
func _ready():
	var player = get_tree().get_nodes_in_group("Player")[0]
	player.connect("health_changed", self, "_on_health_changed")
	update_hearts(player.health, player.max_health)

func _on_health_changed(new_health):
	var player = get_tree().get_nodes_in_group("Player")[0]
	update_hearts(new_health, player.max_health)
