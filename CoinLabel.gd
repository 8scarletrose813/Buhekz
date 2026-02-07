extends Label

func _process(delta):
	var player = get_tree().get_root().get_node("World/Player")
	text = "Монеты: " + str(player.coins)
