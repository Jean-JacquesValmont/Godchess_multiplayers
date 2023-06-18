extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SelectionGodButton_pressed():
	$GodsScreenDisplay.visible = false
	$PowerGodsScreen.visible = true
	$GodsScreenDisplay/DisplayGodsImage/GodImageSelect.texture = null


func _on_SelectionGodButton_mouse_entered():
	var texture = load("res://Image/Gods/DéesseTéléporationHover.png")
	$GodsScreenDisplay/DisplayGodsImage/GodImageSelect.texture = texture
	$GodsScreenDisplay/DisplayGodsImage/GodImageSelect.centered = false


func _on_SelectionGodButton_mouse_exited():
	$GodsScreenDisplay/DisplayGodsImage/GodImageSelect.texture = null
