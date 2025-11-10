extends AnimatedSprite2D

var direction = 0
var speed = 0.5
var can_move = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_move == true:
		if direction == 1: 
			position.x += speed
		elif direction == -1:
			position.x -= speed
			
		if position.x > 320:
			direction = -1
			flip_h = false
		elif position.x < 35:
			direction = 1
			flip_h = true
	

func _on_timer_timeout() -> void:
	direction = 0
	can_move = false


func _on_button_feed() -> void:
	direction = 0
	can_move = false
	play("Eat")
	await get_tree().create_timer(3).timeout
	can_move = true
	play("Dance")
	direction = 1
	await get_tree().create_timer(6).timeout
	play("Idle")
	direction = 0

func _on_button_sleep() -> void:
	direction = 0
	can_move = false
	play("Sleep")
	$"..".modulate = Color(0.2, 0.2, 0.2, 1)
	position.x = 180
	position.y = 470
	
	
	#await get_tree().create_timer(6).timeout
	#$"..".modulate = Color(1, 1, 1, 1)
