extends CanvasLayer

var lines = []
var index = 0
var char_index = 0
var typing = false

func start(dialogue_array):
	lines = dialogue_array
	index = 0
	show_line()
	var player = get_tree().get_nodes_in_group("Player")[0]
	player.can_move = false


func show_line():
	$Panel/Label.text = ""
	char_index = 0
	typing = true
	$Timer.start()

func _on_Timer_timeout():
	if char_index < lines[index].length():
		$Panel/Label.text += lines[index][char_index]
		char_index += 1
	else:
		typing = false
		$Timer.stop()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if typing:
			$Panel/Label.text = lines[index]
			typing = false
			$Timer.stop()
		else:
			index += 1
			if index < lines.size():
				show_line()
			else:
				end_dialogue()

func end_dialogue():
	var player = get_tree().get_nodes_in_group("Player")[0]
	player.can_move = true
