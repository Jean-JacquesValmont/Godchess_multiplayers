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
	
#	player_in_game = players
#	$background/plateau/Rook_white.player_in_game = player_in_game
#	if $background/plateau/Rook_black != null:
#		$background/plateau/Rook_black.player_in_game = player_in_game
	
	rpc("_do_game_start")

remotesync func _do_game_start() -> void:
	self.show()
	emit_signal("game_started")
	get_tree().set_pause(false)
	print("function _do_game_start", player_in_game)

#func game_stop() -> void:
#	player_in_game.clear()
#	$background/plateau/Rook_white.player_in_game = player_in_game.clear()
#	if $background/plateau/Rook_black != null:
#		$background/plateau/Rook_black.player_in_game = player_in_game.clear()
#
#func _on_StopGameButton_button_down():
#	emit_signal("game_stop")
