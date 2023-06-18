extends Control

signal play_tabs()
signal gods_tabs()

onready var path_button_animated_left = $PlayButtonAnimated/ButtonAnimatedLeft
onready var path_button_animated_right = $PlayButtonAnimated/ButtonAnimatedRight
onready var path_button_animated_particule = $PlayButtonAnimated/ButtonAnimatedParticule

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Main_changed_tabs_play():
	if get_parent().get_node("PlayScreen").visible == true:
		path_button_animated_left.play("default")
		path_button_animated_right.play("default")
		path_button_animated_particule.play("default")
	else:
		path_button_animated_left.stop()
		path_button_animated_right.stop()
		path_button_animated_particule.stop()
		path_button_animated_left.frame = 0
		path_button_animated_right.frame = 0
		path_button_animated_particule.frame = 0

func _on_PlayButtonOnglet_pressed():
	$GodsButtonAnimated/LightBar.visible = false
	emit_signal("play_tabs")

func _on_GodsButton_pressed():
	$GodsButtonAnimated/LightBar.visible = true
	emit_signal("gods_tabs")
