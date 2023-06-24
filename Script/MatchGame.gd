extends Node2D

signal game_started()
signal game_stop()

var player_in_game := {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func game_start(players: Dictionary) -> void:
	print("function game_start", players)
	rpc('_do_game_setup', players)

remotesync func _do_game_setup(players: Dictionary) -> void:
	print("function _do_game_start", players)
	get_tree().set_pause(true)
	
	var newBoardGame = preload("res://Scene/Game/BoardGame.tscn")
	var boardGameInstance = newBoardGame.instance()
#	boardGameInstance.set_name("BoardGame")
	add_child(boardGameInstance)
	move_child(boardGameInstance, 0)
	
	player_in_game = players
	get_node(boardGameInstance.get_name()).get_node("Pawn_white").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Pawn_white2").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Pawn_white3").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Pawn_white4").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Pawn_white5").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Pawn_white6").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Pawn_white7").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Pawn_white8").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Knight_white").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Knight_white2").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Bishop_white").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Bishop_white2").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Rook_white").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Rook_white2").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Queen_white").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("King_white").player_in_game = player_in_game
	
	get_node(boardGameInstance.get_name()).get_node("Pawn_black").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Pawn_black2").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Pawn_black3").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Pawn_black4").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Pawn_black5").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Pawn_black6").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Pawn_black7").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Pawn_black8").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Knight_black").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Knight_black2").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Bishop_black").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Bishop_black2").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Rook_black").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Rook_black2").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("Queen_black").player_in_game = player_in_game
	get_node(boardGameInstance.get_name()).get_node("King_black").player_in_game = player_in_game
	
	get_node(boardGameInstance.get_name()).get_node("UsernamePlayer").text = player_in_game.values()[0]
	get_node(boardGameInstance.get_name()).get_node("UsernameOpponent").text = player_in_game.values()[1]
	
	rpc("_do_game_start")

remotesync func _do_game_start() -> void:
	self.show()
	emit_signal("game_started")
	get_tree().set_pause(false)
	print("function _do_game_start", player_in_game)

func game_stop() -> void:
	player_in_game.clear()
	
	get_child(0).queue_free()
#	if is_instance_valid($BoardGame/Pawn_white) == true:
#		$BoardGame/Pawn_white.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Pawn_white2) == true:
#		$BoardGame/Pawn_white2.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Pawn_white3) == true:
#		$BoardGame/Pawn_white3.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Pawn_white4) == true:
#		$BoardGame/Pawn_white4.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Pawn_white5) == true:
#		$BoardGame/Pawn_white5.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Pawn_white6) == true:
#		$BoardGame/Pawn_white6.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Pawn_white7) == true:
#		$BoardGame/Pawn_white7.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Pawn_white8) == true:
#		$BoardGame/Pawn_white8.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Knight_white) == true:
#		$BoardGame/Knight_white.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Knight_white2) == true:
#		$BoardGame/Knight_white2.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Bishop_white) == true:
#		$BoardGame/Bishop_white.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Bishop_white2) == true:
#		$BoardGame/Bishop_white2.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Rook_white) == true:
#		$BoardGame/Rook_white.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Rook_white2) == true:
#		$BoardGame/Rook_white2.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Queen_white) == true:
#		$BoardGame/Queen_white.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/King_white) == true:
#		$BoardGame/King_white.player_in_game = player_in_game.clear()
#
#	if is_instance_valid($BoardGame/Pawn_black) == true:
#		$BoardGame/Pawn_black.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Pawn_black2) == true:
#		$BoardGame/Pawn_black2.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Pawn_black3) == true:
#		$BoardGame/Pawn_black3.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Pawn_black4) == true:
#		$BoardGame/Pawn_black4.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Pawn_black5) == true:
#		$BoardGame/Pawn_black5.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Pawn_black6) == true:
#		$BoardGame/Pawn_black6.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Pawn_black7) == true:
#		$BoardGame/Pawn_black7.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Pawn_black8) == true:
#		$BoardGame/Pawn_black8.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Knight_black) == true:
#		$BoardGame/Knight_black.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Knight_black2) == true:
#		$BoardGame/Knight_black2.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Bishop_black) == true:
#		$BoardGame/Bishop_black.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Bishop_black2) == true:
#		$BoardGame/Bishop_black2.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Rook_black) == true:
#		$BoardGame/Rook_black.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Rook_black2) == true:
#		$BoardGame/Rook_black2.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/Queen_black) == true:
#		$BoardGame/Queen_black.player_in_game = player_in_game.clear()
#	if is_instance_valid($BoardGame/King_black) == true:
#		$BoardGame/King_black.player_in_game = player_in_game.clear()
#
#	if is_instance_valid($BoardGame/UsernamePlayer) == true:
#		$BoardGame/UsernamePlayer.text = ""
#	if is_instance_valid($BoardGame/UsernameOpponent) == true:
#		$BoardGame/UsernameOpponent.text = ""

func _on_MenuButton_pressed():
	$ContinueButton.visible = true
	$QuitButton.visible = true

func _on_ContinueButton_pressed():
	$ContinueButton.visible = false
	$QuitButton.visible = false

func _on_QuitButton_pressed():
	$ContinueButton.visible = false
	$QuitButton.visible = false
	game_stop()
	emit_signal("game_stop")
