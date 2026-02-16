extends KinematicBody2D
var speed = 200
var gravity = 800
var jump_force = -425
var max_health = 3.0
var health = 3.0
var knockback_force = 300
var velocity = Vector2.ZERO
signal coins_changed(new_amount)
func _physics_process(delta):
	if not can_move:
		return
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0

	velocity.y += gravity * delta
	if is_on_floor() and Input.is_action_just_pressed("ui_select"):
		velocity.y = jump_force

	velocity = move_and_slide(velocity, Vector2.UP)
var coins = 0
func add_coin():
	coins += 1
	emit_signal("coins_changed", coins)
signal health_changed
signal game_over
func take_damage(from_position):
	health -= 0.5
	emit_signal("health_changed", health)
	var dir = (global_position - from_position).normalized()
	velocity = dir * knockback_force
	velocity.y = -200
	if health <= 0:
		health = max_health/3
		emit_signal("health_changed", health)
		global_position = checkpoint_position
var checkpoint_position = Vector2(82,365)
func set_checkpoint(pos):
	checkpoint_position = pos
var can_move = true
var has_key = false
