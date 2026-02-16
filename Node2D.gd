extends Area2D

export(int) var price = 40
func _ready():
	connect("body_entered", self, "_on_HeartPickup_body_entered")
func _on_HeartPickup_body_entered(body):
	if not body.is_in_group("Player"):
		return

	if body.coins >= price and body.health < body.max_health:
		body.coins -= price
		body.health += 1

		body.emit_signal("coins_changed", body.coins)
		body.emit_signal("health_changed", body.health)
		queue_free()
	else:
		print("Недостаточно монет или здоровье полное")
