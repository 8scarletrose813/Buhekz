extends Label

func _ready():
	var player = get_tree().get_nodes_in_group("Player")[0]
	player.connect("coins_changed", self, "_on_coins_changed")
	text = "Монеты: " + str(player.coins)
func _on_coins_changed(new_amount):
	text = "Монеты: " + str(new_amount)
