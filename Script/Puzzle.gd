extends Node2D

@onready var horse_pic_1 = $"Horse Wheel/Ellipse1"
@onready var horse_pic_2 = $"Horse Wheel/Ellipse2"
@onready var horse_pic_3 = $"Horse Wheel/Ellipse3"
@onready var horse_pic_4 = $"Horse Wheel/Ellipse4"
@onready var horse_pic_5 = $"Horse Wheel/Ellipse5"
@onready var sfx = $"AudioStreamPlayer"
@onready var SolvedAlert = $"SolvedAlert"

var tween_is_running = false

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize_beginning_state()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func randomize_beginning_state():
	var rand_1 = randi_range(1,20)
	var rand_2 = randi_range(1,20)
	var rand_3 = randi_range(1,20)
	var rand_4 = randi_range(1,20)
	
	horse_pic_1.global_rotation_degrees = rand_1 * 18
	horse_pic_2.global_rotation_degrees = rand_2 * 18
	horse_pic_3.global_rotation_degrees = rand_3 * 18
	horse_pic_4.global_rotation_degrees = rand_4 * 18

func check_solved():
	var horse_1_deg = int(horse_pic_1.global_rotation_degrees)
	var horse_2_deg = int(horse_pic_2.global_rotation_degrees)
	var horse_3_deg = int(horse_pic_3.global_rotation_degrees)
	var horse_4_deg = int(horse_pic_4.global_rotation_degrees)
	
	if horse_1_deg == 0 and horse_2_deg == 0 and horse_3_deg == 0  and horse_4_deg == 0:
		print("solved")
		SolvedAlert.visible = true

func tween_finished():
	tween_is_running = false
	sfx.stop()
	check_solved()

func _on_leaf_button_top_left_button_down():
	if not tween_is_running:
		tween_is_running = true
		sfx.play()
		var tween = get_tree().create_tween()
		var final = horse_pic_1.rotation_degrees - 18.0
		tween.tween_property(horse_pic_1,"rotation_degrees",final,0.5).set_ease(Tween.EASE_IN_OUT)
		tween.finished.connect(tween_finished)


func _on_leaf_button_top_right_button_down():
	if not tween_is_running:
		tween_is_running = true
		sfx.play()
		var tween = get_tree().create_tween()
		var final = horse_pic_1.rotation_degrees - 18.0
		tween.tween_property(horse_pic_1,"rotation_degrees",final,0.5).set_ease(Tween.EASE_IN_OUT)
		tween.finished.connect(tween_finished)
		var tween_2 = get_tree().create_tween()
		var final_2 = horse_pic_2.rotation_degrees - 18.0
		tween_2.tween_property(horse_pic_2,"rotation_degrees",final_2,0.5).set_ease(Tween.EASE_IN_OUT)
		tween_2.finished.connect(tween_finished)


func _on_leaf_button_bot_right_button_down():
	if not tween_is_running:
		tween_is_running = true
		sfx.play()
		var tween = get_tree().create_tween()
		var final = horse_pic_2.rotation_degrees - 18.0
		tween.tween_property(horse_pic_2,"rotation_degrees",final,0.5).set_ease(Tween.EASE_IN_OUT)
		tween.finished.connect(tween_finished)
		var tween_2 = get_tree().create_tween()
		var final_2 = horse_pic_3.rotation_degrees - 18.0
		tween_2.tween_property(horse_pic_3,"rotation_degrees",final_2,0.5).set_ease(Tween.EASE_IN_OUT)
		tween_2.finished.connect(tween_finished)


func _on_leaf_button_bot_left_button_down():
	if not tween_is_running:
		tween_is_running = true
		sfx.play()
		var tween = get_tree().create_tween()
		var final = horse_pic_3.rotation_degrees - 18.0
		tween.tween_property(horse_pic_3,"rotation_degrees",final,0.5).set_ease(Tween.EASE_IN_OUT)
		tween.finished.connect(tween_finished)
		var tween_2 = get_tree().create_tween()
		var final_2 = horse_pic_4.rotation_degrees - 18.0
		tween_2.tween_property(horse_pic_4,"rotation_degrees",final_2,0.5).set_ease(Tween.EASE_IN_OUT)
		tween_2.finished.connect(tween_finished)
