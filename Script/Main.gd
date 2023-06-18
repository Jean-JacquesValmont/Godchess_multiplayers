extends Node2D

signal changed_tabs_play()

onready var path_background_connection = $BackgroundMenu/ConnectionScreen
onready var path_background_play = $BackgroundMenu/PlayScreen
onready var path_background_ready = $BackgroundMenu/ReadyScreen
onready var path_background_gods = $BackgroundMenu/GodsScreen
onready var path_background_onglet = $BackgroundMenu/OngletScreen

var players := {}
var players_ready := {}

func _ready():
	path_background_ready.connect("ready_pressed", self, "playerReady")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#Screens visibility
func _on_ConnectionScreen_play_pressed():
	path_background_connection.hide()
	path_background_onglet.show()
	$BackgroundMenu.texture = load("res://Image/Menu/MenuScreen.png")
	path_background_play.show()

func _on_PlayScreen_hide(info):
	path_background_ready.show()
	#Permet d'appeller une fonction d'un script depuis un autre script
	path_background_ready.callv("_show_screen", [info])

func _on_PlayScreen_visibility_changed():
	emit_signal("changed_tabs_play")

func _on_OngletScreen_play_tabs():
	path_background_play.show()
	path_background_gods.hide()
	emit_signal("changed_tabs_play")

func _on_OngletScreen_gods_tabs():
	path_background_play.hide()
	path_background_gods.show()
	$BackgroundMenu/GodsScreen/GodsScreenDisplay.visible = true
	$BackgroundMenu/GodsScreen/PowerGodsScreen.visible = false
	emit_signal("changed_tabs_play")

func _on_ReadyScreen_back_pressed():
	OnlineMatch.leave()
	path_background_play.show()

#Start game###############################
func _on_ReadyScreen_ready_pressed():
	rpc("player_ready", get_tree().get_network_unique_id())

remotesync func player_ready(peer_id: int) -> void:
	path_background_ready.set_status(peer_id, "READY!")

#	if get_tree().is_network_server() and not players_ready.has(peer_id):
	if get_tree().is_network_server():
		players_ready[peer_id] = true
		if players_ready.size() == OnlineMatch.players.size():
			if OnlineMatch.match_state != OnlineMatch.MatchState.PLAYING:
				OnlineMatch.start_playing()
			start_game()

func start_game() -> void:
	print("Start Game")
	players = OnlineMatch.get_player_names_by_peer_id()
	$MatchGame.game_start(players)

func _on_MatchGame_game_started():
	print("Hide BackgroundMenu")
	$BackgroundMenu.hide()
