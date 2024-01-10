extends CharacterBody2D


const SPEED = 300.0

func _physics_process(delta):
	
	# Quit if ESC is pressed
	if Input.is_action_pressed("ui_cancel"):
		get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
		get_tree().quit()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var vDirection = Input.get_axis("ui_up", "ui_down")
	var hDirection = Input.get_axis("ui_left", "ui_right")
	
	velocity.x = hDirection
	velocity.y = vDirection
		
	velocity = velocity.normalized() * SPEED

	move_and_slide()
