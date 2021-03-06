extends KinematicBody2D

var movement = Vector2(500,0)
var levelStart = false
var isOnAir = false
var finalLevel = false

const VECTOR_NORMAL = Vector2(0, -1)

func _ready():
	pass 
func _physics_process(delta):
	if levelStart == true and finalLevel == false:
		movement.y += 30
		if is_on_floor():
			movement.y = 0
			isOnAir = false
		if Input.is_action_just_pressed("touch") and isOnAir == false:
			movement.y = -1100
			isOnAir = true
		move_and_slide(movement, VECTOR_NORMAL)
	pass


func _on_Timer_timeout():
	if finalLevel == false:
		get_tree().call_group("UI","_go_score_timer")
		levelStart = true
	pass


func _on_Area2D_area_entered(area):
	get_tree().call_group("UI","_stop_timer")
	finalLevel = true
	
	pass
