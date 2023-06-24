extends Sprite

onready var Pawn_white = get_node("Pawn_white")
onready var Pawn_white2 = get_node("Pawn_white2")
onready var Pawn_white3 = get_node("Pawn_white3")
onready var Pawn_white4 = get_node("Pawn_white4")
onready var Pawn_white5 = get_node("Pawn_white5")
onready var Pawn_white6 = get_node("Pawn_white6")
onready var Pawn_white7 = get_node("Pawn_white7")
onready var Pawn_white8 = get_node("Pawn_white8")
onready var Knight_white = get_node("Knight_white")
onready var Knight_white2 = get_node("Knight_white2")
onready var Bishop_white = get_node("Bishop_white")
onready var Bishop_white2 = get_node("Bishop_white2")
onready var Rook_white = get_node("Rook_white")
onready var Rook_white2 = get_node("Rook_white2")
onready var Queen_white = get_node("Queen_white")
onready var King_white = get_node("King_white")

onready var Pawn_black = get_node("Pawn_black")
onready var Pawn_black2 = get_node("Pawn_black2")
onready var Pawn_black3 = get_node("Pawn_black3")
onready var Pawn_black4 = get_node("Pawn_black4")
onready var Pawn_black5 = get_node("Pawn_black5")
onready var Pawn_black6 = get_node("Pawn_black6")
onready var Pawn_black7 = get_node("Pawn_black7")
onready var Pawn_black8 = get_node("Pawn_black8")
onready var Knight_black = get_node("Knight_black")
onready var Knight_black2 = get_node("Knight_black2")
onready var Bishop_black = get_node("Bishop_black")
onready var Bishop_black2 = get_node("Bishop_black2")
onready var Rook_black = get_node("Rook_black")
onready var Rook_black2 = get_node("Rook_black2")
onready var Queen_black = get_node("Queen_black")
onready var King_black = get_node("King_black")

#onready var Square_last_move = get_node("Square_last_move")

var piece_promoted
var promotion_white = false
var promotion_white2 = false
var promotion_white3 = false
var promotion_white4 = false
var promotion_white5 = false
var promotion_white6 = false
var promotion_white7 = false
var promotion_white8 = false

var promotion_black = false
var promotion_black2 = false
var promotion_black3 = false
var promotion_black4 = false
var promotion_black5 = false
var promotion_black6 = false
var promotion_black7 = false
var promotion_black8 = false

var promotion_i
var promotion_j
var position_piece_on_the_chessboard

#var timer_white_seconde = Global.timer_select
#var timer_white_minutes = int(timer_white_seconde / 60)  # Conversion en minutes
#var white_seconds_remaining = timer_white_seconde % 60  # Secondes restantes
#var timer_black_seconde = Global.timer_select
#var timer_black_minutes = int(timer_black_seconde / 60)  # Conversion en minutes
#var black_seconds_remaining = timer_black_seconde % 60  # Secondes restantes

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	display_piece_died_white_and_black()
	display_echec_white_and_black()
	
	promotion_white_and_black()
	
#	if Global.timer_option_enable == true and Global.timer_menu_stop == false:
#		get_node("Text_timer_white").visible = true
#		get_node("Text_timer_black").visible = true
#		get_node("Text_timer_white").set_text("Timer: " + str("%02d:%02d" % [timer_white_minutes, white_seconds_remaining]))
#		get_node("Text_timer_black").set_text("Timer: " + str("%02d:%02d" % [timer_black_minutes, black_seconds_remaining]))
#		if King_white.player_turn == "white":
#			white_seconds_remaining -= _delta  # Décompte des secondes
#			if white_seconds_remaining < 0:  # Si les secondes atteignent 0
#				if timer_white_minutes > 0:  # Si des minutes restantes
#					timer_white_minutes -= 1  # Décrémentation des minutes
#					white_seconds_remaining = 59  # Réinitialisation des secondes
#				else:
#					white_seconds_remaining = 0  # Le timer est terminé
#					get_node("Text_echec_white").text = "Temps écoulé"
#					get_node("Text_echec_white").visible = true
#					if Pawn_white != null:
#						Pawn_white.king_in_check = true
#					if Pawn_white2 != null:
#						Pawn_white2.king_in_check = true
#					if Pawn_white3 != null:
#						Pawn_white3.king_in_check = true
#					if Pawn_white4 != null:
#						Pawn_white4.king_in_check = true
#					if Pawn_white5 != null:
#						Pawn_white5.king_in_check = true
#					if Pawn_white6 != null:
#						Pawn_white6.king_in_check = true
#					if Pawn_white7 != null:
#						Pawn_white7.king_in_check = true
#					if Pawn_white8 != null:
#						Pawn_white8.king_in_check = true
#					if Knight_white != null:
#						Knight_white.king_in_check = true
#					if Knight_white2 != null:
#						Knight_white2.king_in_check = true
#					if Bishop_white != null:
#						Bishop_white.king_in_check = true
#					if Bishop_white2 != null:
#						Bishop_white2.king_in_check = true
#					if Rook_white != null:
#						Rook_white.king_in_check = true
#					if Rook_white2 != null:
#						Rook_white2.king_in_check = true
#					if Queen_white != null:
#						Queen_white.king_in_check = true
#
#					if Pawn_black != null:
#						Pawn_black.king_in_check = true
#					if Pawn_black2 != null:
#						Pawn_black2.king_in_check = true
#					if Pawn_black3 != null:
#						Pawn_black3.king_in_check = true
#					if Pawn_black4 != null:
#						Pawn_black4.king_in_check = true
#					if Pawn_black5 != null:
#						Pawn_black5.king_in_check = true
#					if Pawn_black6 != null:
#						Pawn_black6.king_in_check = true
#					if Pawn_black7 != null:
#						Pawn_black7.king_in_check = true
#					if Pawn_black8 != null:
#						Pawn_black8.king_in_check = true
#					if Knight_black != null:
#						Knight_black.king_in_check = true
#					if Knight_black2 != null:
#						Knight_black2.king_in_check = true
#					if Bishop_black != null:
#						Bishop_black.king_in_check = true
#					if Bishop_black2 != null:
#						Bishop_black2.king_in_check = true
#					if Rook_black != null:
#						Rook_black.king_in_check = true
#					if Rook_black2 != null:
#						Rook_black2.king_in_check = true
#					if Queen_black != null:
#						Queen_black.king_in_check = true
#
#		if King_black.player_turn == "black":
#			black_seconds_remaining -= _delta  # Décompte des secondes
#			if black_seconds_remaining < 0:  # Si les secondes atteignent 0
#				if timer_black_minutes > 0:  # Si des minutes restantes
#					timer_black_minutes -= 1  # Décrémentation des minutes
#					black_seconds_remaining = 59  # Réinitialisation des secondes
#				else:
#					black_seconds_remaining = 0  # Le timer est terminé
#					get_node("Text_echec_white").text = "Temps écoulé"
#					get_node("Text_echec_white").visible = true
#					if Pawn_white != null:
#						Pawn_white.king_in_check = true
#					if Pawn_white2 != null:
#						Pawn_white2.king_in_check = true
#					if Pawn_white3 != null:
#						Pawn_white3.king_in_check = true
#					if Pawn_white4 != null:
#						Pawn_white4.king_in_check = true
#					if Pawn_white5 != null:
#						Pawn_white5.king_in_check = true
#					if Pawn_white6 != null:
#						Pawn_white6.king_in_check = true
#					if Pawn_white7 != null:
#						Pawn_white7.king_in_check = true
#					if Pawn_white8 != null:
#						Pawn_white8.king_in_check = true
#					if Knight_white != null:
#						Knight_white.king_in_check = true
#					if Knight_white2 != null:
#						Knight_white2.king_in_check = true
#					if Bishop_white != null:
#						Bishop_white.king_in_check = true
#					if Bishop_white2 != null:
#						Bishop_white2.king_in_check = true
#					if Rook_white != null:
#						Rook_white.king_in_check = true
#					if Rook_white2 != null:
#						Rook_white2.king_in_check = true
#					if Queen_white != null:
#						Queen_white.king_in_check = true
#
#					if Pawn_black != null:
#						Pawn_black.king_in_check = true
#					if Pawn_black2 != null:
#						Pawn_black2.king_in_check = true
#					if Pawn_black3 != null:
#						Pawn_black3.king_in_check = true
#					if Pawn_black4 != null:
#						Pawn_black4.king_in_check = true
#					if Pawn_black5 != null:
#						Pawn_black5.king_in_check = true
#					if Pawn_black6 != null:
#						Pawn_black6.king_in_check = true
#					if Pawn_black7 != null:
#						Pawn_black7.king_in_check = true
#					if Pawn_black8 != null:
#						Pawn_black8.king_in_check = true
#					if Knight_black != null:
#						Knight_black.king_in_check = true
#					if Knight_black2 != null:
#						Knight_black2.king_in_check = true
#					if Bishop_black != null:
#						Bishop_black.king_in_check = true
#					if Bishop_black2 != null:
#						Bishop_black2.king_in_check = true
#					if Rook_black != null:
#						Rook_black.king_in_check = true
#					if Rook_black2 != null:
#						Rook_black2.king_in_check = true
#					if Queen_black != null:
#						Queen_black.king_in_check = true
					

#func display_square_last_move():
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Pawn_white.i * 100) - 200
#	Square_last_move.position.x = (Pawn_white.j * 100) - 200

func promotion_white_and_black():
	#Pour pouvoir changer le script du pion jouer sans faire crash le jeu
	#Promotion white
	if promotion_white == true:
		if piece_promoted == "knight_white":
			Pawn_white.set_script(load("res://Script/Pieces/Knight_white.gd"))
		elif piece_promoted == "bishop_white":
			Pawn_white.set_script(load("res://Script/Pieces/Bishop_white.gd"))
		elif piece_promoted == "rook_white":
			Pawn_white.set_script(load("res://Script/Pieces/Rook_white.gd"))
		elif piece_promoted == "queen_white":
			Pawn_white.set_script(load("res://Script/Pieces/Queen_white.gd"))
			
		Pawn_white.i = promotion_i
		Pawn_white.j = promotion_j
		Pawn_white.position_piece_on_the_chessboard = position_piece_on_the_chessboard
		_on_Pawn_white_opponent_turned(Pawn_white.position_piece_on_the_chessboard)
		promotion_white = false
			
	elif promotion_white2 == true:
		if piece_promoted == "knight_white":
			Pawn_white2.set_script(load("res://Script/Pieces/Knight_white.gd"))
		elif piece_promoted == "bishop_white":
			Pawn_white2.set_script(load("res://Script/Pieces/Bishop_white.gd"))
		elif piece_promoted == "rook_white":
			Pawn_white2.set_script(load("res://Script/Pieces/Rook_white.gd"))
		elif piece_promoted == "queen_white":
			Pawn_white2.set_script(load("res://Script/Pieces/Queen_white.gd"))
		Pawn_white2.i = promotion_i
		Pawn_white2.j = promotion_j
		Pawn_white2.position_piece_on_the_chessboard = position_piece_on_the_chessboard
		_on_Pawn_white2_opponent_turned(Pawn_white2.position_piece_on_the_chessboard)
		promotion_white2 = false
		
	elif promotion_white3 == true:
		if piece_promoted == "knight_white":
			Pawn_white3.set_script(load("res://Script/Pieces/Knight_white.gd"))
		elif piece_promoted == "bishop_white":
			Pawn_white3.set_script(load("res://Script/Pieces/Bishop_white.gd"))
		elif piece_promoted == "rook_white":
			Pawn_white3.set_script(load("res://Script/Pieces/Rook_white.gd"))
		elif piece_promoted == "queen_white":
			Pawn_white3.set_script(load("res://Script/Pieces/Queen_white.gd"))
		Pawn_white3.i = promotion_i
		Pawn_white3.j = promotion_j
		Pawn_white3.position_piece_on_the_chessboard = position_piece_on_the_chessboard
		_on_Pawn_white3_opponent_turned(Pawn_white3.position_piece_on_the_chessboard)
		promotion_white3 = false
		
	elif promotion_white4 == true:
		if piece_promoted == "knight_white":
			Pawn_white4.set_script(load("res://Script/Pieces/Knight_white.gd"))
		elif piece_promoted == "bishop_white":
			Pawn_white4.set_script(load("res://Script/Pieces/Bishop_white.gd"))
		elif piece_promoted == "rook_white":
			Pawn_white4.set_script(load("res://Script/Pieces/Rook_white.gd"))
		elif piece_promoted == "queen_white":
			Pawn_white4.set_script(load("res://Script/Pieces/Queen_white.gd"))
		Pawn_white4.i = promotion_i
		Pawn_white4.j = promotion_j
		Pawn_white4.position_piece_on_the_chessboard = position_piece_on_the_chessboard
		_on_Pawn_white4_opponent_turned(Pawn_white4.position_piece_on_the_chessboard)
		promotion_white4 = false
		
	elif promotion_white5 == true:
		if piece_promoted == "knight_white":
			Pawn_white5.set_script(load("res://Script/Pieces/Knight_white.gd"))
		elif piece_promoted == "bishop_white":
			Pawn_white5.set_script(load("res://Script/Pieces/Bishop_white.gd"))
		elif piece_promoted == "rook_white":
			Pawn_white5.set_script(load("res://Script/Pieces/Rook_white.gd"))
		elif piece_promoted == "queen_white":
			Pawn_white5.set_script(load("res://Script/Pieces/Queen_white.gd"))
		Pawn_white5.i = promotion_i
		Pawn_white5.j = promotion_j
		Pawn_white5.position_piece_on_the_chessboard = position_piece_on_the_chessboard
		_on_Pawn_white5_opponent_turned(Pawn_white5.position_piece_on_the_chessboard)
		promotion_white5 = false
		
	elif promotion_white6 == true:
		if piece_promoted == "knight_white":
			Pawn_white6.set_script(load("res://Script/Pieces/Knight_white.gd"))
		elif piece_promoted == "bishop_white":
			Pawn_white6.set_script(load("res://Script/Pieces/Bishop_white.gd"))
		elif piece_promoted == "rook_white":
			Pawn_white6.set_script(load("res://Script/Pieces/Rook_white.gd"))
		elif piece_promoted == "queen_white":
			Pawn_white6.set_script(load("res://Script/Pieces/Queen_white.gd"))
		Pawn_white6.i = promotion_i
		Pawn_white6.j = promotion_j
		Pawn_white6.position_piece_on_the_chessboard = position_piece_on_the_chessboard
		_on_Pawn_white6_opponent_turned(Pawn_white6.position_piece_on_the_chessboard)
		promotion_white6 = false
		
	elif promotion_white7 == true:
		if piece_promoted == "knight_white":
			Pawn_white7.set_script(load("res://Script/Pieces/Knight_white.gd"))
		elif piece_promoted == "bishop_white":
			Pawn_white7.set_script(load("res://Script/Pieces/Bishop_white.gd"))
		elif piece_promoted == "rook_white":
			Pawn_white7.set_script(load("res://Script/Pieces/Rook_white.gd"))
		elif piece_promoted == "queen_white":
			Pawn_white7.set_script(load("res://Script/Pieces/Queen_white.gd"))
		Pawn_white7.i = promotion_i
		Pawn_white7.j = promotion_j
		Pawn_white7.position_piece_on_the_chessboard = position_piece_on_the_chessboard
		_on_Pawn_white7_opponent_turned(Pawn_white7.position_piece_on_the_chessboard)
		promotion_white7 = false
		
	elif promotion_white8 == true:
		if piece_promoted == "knight_white":
			Pawn_white8.set_script(load("res://Script/Pieces/Knight_white.gd"))
		elif piece_promoted == "bishop_white":
			Pawn_white8.set_script(load("res://Script/Pieces/Bishop_white.gd"))
		elif piece_promoted == "rook_white":
			Pawn_white8.set_script(load("res://Script/Pieces/Rook_white.gd"))
		elif piece_promoted == "queen_white":
			Pawn_white8.set_script(load("res://Script/Pieces/Queen_white.gd"))
		Pawn_white8.i = promotion_i
		Pawn_white8.j = promotion_j
		Pawn_white8.position_piece_on_the_chessboard = position_piece_on_the_chessboard
		_on_Pawn_white8_opponent_turned(Pawn_white8.position_piece_on_the_chessboard)
		promotion_white8 = false
		
	
	#Promotion black
	if promotion_black == true:
		if piece_promoted == "knight_black":
			Pawn_black.set_script(load("res://Knight_black.gd"))
		elif piece_promoted == "bishop_black":
			Pawn_black.set_script(load("res://Script/Pieces/Bishop_black.gd"))
		elif piece_promoted == "rook_black":
			Pawn_black.set_script(load("res://Script/Pieces/Rook_black.gd"))
		elif piece_promoted == "queen_black":
			Pawn_black.set_script(load("res://Script/Pieces/Queen_black.gd"))
			
		Pawn_black.i = promotion_i
		Pawn_black.j = promotion_j
		Pawn_black.position_piece_on_the_chessboard = position_piece_on_the_chessboard
		_on_Pawn_black_opponent_turned(Pawn_black.position_piece_on_the_chessboard)
		promotion_black = false
			
	elif promotion_black2 == true:
		if piece_promoted == "knight_black":
			Pawn_black2.set_script(load("res://Script/Pieces/Knight_black.gd"))
		elif piece_promoted == "bishop_black":
			Pawn_black2.set_script(load("res://Script/Pieces/Bishop_black.gd"))
		elif piece_promoted == "rook_black":
			Pawn_black2.set_script(load("res://Script/Pieces/Rook_black.gd"))
		elif piece_promoted == "queen_black":
			Pawn_black2.set_script(load("res://Script/Pieces/Queen_black.gd"))
		Pawn_black2.i = promotion_i
		Pawn_black2.j = promotion_j
		Pawn_black2.position_piece_on_the_chessboard = position_piece_on_the_chessboard
		_on_Pawn_black2_opponent_turned(Pawn_black2.position_piece_on_the_chessboard)
		promotion_black2 = false
		
	elif promotion_black3 == true:
		if piece_promoted == "knight_black":
			Pawn_black3.set_script(load("res://Script/Pieces/Knight_black.gd"))
		elif piece_promoted == "bishop_black":
			Pawn_black3.set_script(load("res://Script/Pieces/Bishop_black.gd"))
		elif piece_promoted == "rook_black":
			Pawn_black3.set_script(load("res://Script/Pieces/Rook_black.gd"))
		elif piece_promoted == "queen_black":
			Pawn_black3.set_script(load("res://Script/Pieces/Queen_black.gd"))
		Pawn_black3.i = promotion_i
		Pawn_black3.j = promotion_j
		Pawn_black3.position_piece_on_the_chessboard = position_piece_on_the_chessboard
		_on_Pawn_black3_opponent_turned(Pawn_black3.position_piece_on_the_chessboard)
		promotion_black3 = false
		
	elif promotion_black4 == true:
		if piece_promoted == "knight_black":
			Pawn_black4.set_script(load("res://Script/Pieces/Knight_black.gd"))
		elif piece_promoted == "bishop_black":
			Pawn_black4.set_script(load("res://Script/Pieces/Bishop_black.gd"))
		elif piece_promoted == "rook_black":
			Pawn_black4.set_script(load("res://Script/Pieces/Rook_black.gd"))
		elif piece_promoted == "queen_black":
			Pawn_black4.set_script(load("res://Script/Pieces/Queen_black.gd"))
		Pawn_black4.i = promotion_i
		Pawn_black4.j = promotion_j
		Pawn_black4.position_piece_on_the_chessboard = position_piece_on_the_chessboard
		_on_Pawn_black4_opponent_turned(Pawn_black4.position_piece_on_the_chessboard)
		promotion_black4 = false
		
	elif promotion_black5 == true:
		if piece_promoted == "knight_black":
			Pawn_black5.set_script(load("res://Script/Pieces/Knight_black.gd"))
		elif piece_promoted == "bishop_black":
			Pawn_black5.set_script(load("res://Script/Pieces/Bishop_black.gd"))
		elif piece_promoted == "rook_black":
			Pawn_black5.set_script(load("res://Script/Pieces/Rook_black.gd"))
		elif piece_promoted == "queen_black":
			Pawn_black5.set_script(load("res://Script/Pieces/Queen_black.gd"))
		Pawn_black5.i = promotion_i
		Pawn_black5.j = promotion_j
		Pawn_black5.position_piece_on_the_chessboard = position_piece_on_the_chessboard
		_on_Pawn_black5_opponent_turned(Pawn_black5.position_piece_on_the_chessboard)
		promotion_black5 = false
		
	elif promotion_black6 == true:
		if piece_promoted == "knight_black":
			Pawn_black6.set_script(load("res://Script/Pieces/Knight_black.gd"))
		elif piece_promoted == "bishop_black":
			Pawn_black6.set_script(load("res://Script/Pieces/Bishop_black.gd"))
		elif piece_promoted == "rook_black":
			Pawn_black6.set_script(load("res://Script/Pieces/Rook_black.gd"))
		elif piece_promoted == "queen_black":
			Pawn_black6.set_script(load("res://Script/Pieces/Queen_black.gd"))
		Pawn_black6.i = promotion_i
		Pawn_black6.j = promotion_j
		Pawn_black6.position_piece_on_the_chessboard = position_piece_on_the_chessboard
		_on_Pawn_black6_opponent_turned(Pawn_black6.position_piece_on_the_chessboard)
		promotion_black6 = false
		
	elif promotion_black7 == true:
		if piece_promoted == "knight_black":
			Pawn_black7.set_script(load("res://Script/Pieces/Knight_black.gd"))
		elif piece_promoted == "bishop_black":
			Pawn_black7.set_script(load("res://Script/Pieces/Bishop_black.gd"))
		elif piece_promoted == "rook_black":
			Pawn_black7.set_script(load("res://Script/Pieces/Rook_black.gd"))
		elif piece_promoted == "queen_black":
			Pawn_black7.set_script(load("res://Script/Pieces/Queen_black.gd"))
		Pawn_black7.i = promotion_i
		Pawn_black7.j = promotion_j
		Pawn_black7.position_piece_on_the_chessboard = position_piece_on_the_chessboard
		_on_Pawn_black7_opponent_turned(Pawn_black7.position_piece_on_the_chessboard)
		promotion_black7 = false
		
	elif promotion_black8 == true:
		if piece_promoted == "knight_black":
			Pawn_black8.set_script(load("res://Script/Pieces/Knight_black.gd"))
		elif piece_promoted == "bishop_black":
			Pawn_black8.set_script(load("res://Script/Pieces/Bishop_black.gd"))
		elif piece_promoted == "rook_black":
			Pawn_black8.set_script(load("res://Script/Pieces/Rook_black.gd"))
		elif piece_promoted == "queen_black":
			Pawn_black8.set_script(load("res://Script/Pieces/Queen_black.gd"))
		Pawn_black8.i = promotion_i
		Pawn_black8.j = promotion_j
		Pawn_black8.position_piece_on_the_chessboard = position_piece_on_the_chessboard
		_on_Pawn_black8_opponent_turned(Pawn_black8.position_piece_on_the_chessboard)
		promotion_black8 = false
		
func display_piece_died_white_and_black():
	#Pour afficher les pièces qui ont été prises des deux côtés.
	if is_instance_valid(Pawn_white) == false:
		var pawn_white_died = Sprite.new()
		pawn_white_died.texture = load("res://Image/Pieces/White/pawn_white.png")
		pawn_white_died.centered = false
		pawn_white_died.position.x = 1450
		pawn_white_died.position.y = 550
		pawn_white_died.scale.x = 0.5
		pawn_white_died.scale.y = 0.5
		pawn_white_died.z_index = 1
		add_child(pawn_white_died)
	if is_instance_valid(Pawn_white2) == false:
		var pawn_white_died2 = Sprite.new()
		pawn_white_died2.texture = load("res://Image/Pieces/White/pawn_white.png")
		pawn_white_died2.centered = false
		pawn_white_died2.position.x = 1500
		pawn_white_died2.position.y = 550
		pawn_white_died2.scale.x = 0.5
		pawn_white_died2.scale.y = 0.5
		pawn_white_died2.z_index = 1
		add_child(pawn_white_died2)
	if is_instance_valid(Pawn_white3) == false:
		var pawn_white_died3 = Sprite.new()
		pawn_white_died3.texture = load("res://Image/Pieces/White/pawn_white.png")
		pawn_white_died3.centered = false
		pawn_white_died3.position.x = 1550
		pawn_white_died3.position.y = 550
		pawn_white_died3.scale.x = 0.5
		pawn_white_died3.scale.y = 0.5
		pawn_white_died3.z_index = 1
		add_child(pawn_white_died3)
	if is_instance_valid(Pawn_white4) == false:
		var pawn_white_died4 = Sprite.new()
		pawn_white_died4.texture = load("res://Image/Pieces/White/pawn_white.png")
		pawn_white_died4.centered = false
		pawn_white_died4.position.x = 1600
		pawn_white_died4.position.y = 550
		pawn_white_died4.scale.x = 0.5
		pawn_white_died4.scale.y = 0.5
		pawn_white_died4.z_index = 1
		add_child(pawn_white_died4)
	if is_instance_valid(Pawn_white5) == false:
		var pawn_white_died5 = Sprite.new()
		pawn_white_died5.texture = load("res://Image/Pieces/White/pawn_white.png")
		pawn_white_died5.centered = false
		pawn_white_died5.position.x = 1450
		pawn_white_died5.position.y = 600
		pawn_white_died5.scale.x = 0.5
		pawn_white_died5.scale.y = 0.5
		pawn_white_died5.z_index = 1
		add_child(pawn_white_died5)
	if is_instance_valid(Pawn_white6) == false:
		var pawn_white_died6 = Sprite.new()
		pawn_white_died6.texture = load("res://Image/Pieces/White/pawn_white.png")
		pawn_white_died6.centered = false
		pawn_white_died6.position.x = 1500
		pawn_white_died6.position.y = 600
		pawn_white_died6.scale.x = 0.5
		pawn_white_died6.scale.y = 0.5
		pawn_white_died6.z_index = 1
		add_child(pawn_white_died6)
	if is_instance_valid(Pawn_white7) == false:
		var pawn_white_died7 = Sprite.new()
		pawn_white_died7.texture = load("res://Image/Pieces/White/pawn_white.png")
		pawn_white_died7.centered = false
		pawn_white_died7.position.x = 1550
		pawn_white_died7.position.y = 600
		pawn_white_died7.scale.x = 0.5
		pawn_white_died7.scale.y = 0.5
		pawn_white_died7.z_index = 1
		add_child(pawn_white_died7)
	if is_instance_valid(Pawn_white8) == false:
		var pawn_white_died8 = Sprite.new()
		pawn_white_died8.texture = load("res://Image/Pieces/White/pawn_white.png")
		pawn_white_died8.centered = false
		pawn_white_died8.position.x = 1600
		pawn_white_died8.position.y = 600
		pawn_white_died8.scale.x = 0.5
		pawn_white_died8.scale.y = 0.5
		pawn_white_died8.z_index = 1
		add_child(pawn_white_died8)
	if is_instance_valid(Knight_white) == false:
		var knight_white_died = Sprite.new()
		knight_white_died.texture = load("res://Image/Pieces/White/knight_white.png")
		knight_white_died.centered = false
		knight_white_died.position.x = 1450
		knight_white_died.position.y = 650
		knight_white_died.scale.x = 0.5
		knight_white_died.scale.y = 0.5
		knight_white_died.z_index = 1
		add_child(knight_white_died)
	if is_instance_valid(Knight_white2) == false:
		var knight_white_died2 = Sprite.new()
		knight_white_died2.texture = load("res://Image/Pieces/White/knight_white.png")
		knight_white_died2.centered = false
		knight_white_died2.position.x = 1500
		knight_white_died2.position.y = 650
		knight_white_died2.scale.x = 0.5
		knight_white_died2.scale.y = 0.5
		knight_white_died2.z_index = 1
		add_child(knight_white_died2)
	if is_instance_valid(Bishop_white) == false:
		var bishop_white_died = Sprite.new()
		bishop_white_died.texture = load("res://Image/Pieces/White/bishop_white.png")
		bishop_white_died.centered = false
		bishop_white_died.position.x = 1550
		bishop_white_died.position.y = 650
		bishop_white_died.scale.x = 0.5
		bishop_white_died.scale.y = 0.5
		bishop_white_died.z_index = 1
		add_child(bishop_white_died)
	if is_instance_valid(Bishop_white2) == false:
		var bishop_white_died2 = Sprite.new()
		bishop_white_died2.texture = load("res://Image/Pieces/White/bishop_white.png")
		bishop_white_died2.centered = false
		bishop_white_died2.position.x = 1600
		bishop_white_died2.position.y = 650
		bishop_white_died2.scale.x = 0.5
		bishop_white_died2.scale.y = 0.5
		bishop_white_died2.z_index = 1
		add_child(bishop_white_died2)
	if is_instance_valid(Rook_white) == false:
		var rook_white_died = Sprite.new()
		rook_white_died.texture = load("res://Image/Pieces/White/rook_white.png")
		rook_white_died.centered = false
		rook_white_died.position.x = 1450
		rook_white_died.position.y = 700
		rook_white_died.scale.x = 0.5
		rook_white_died.scale.y = 0.5
		rook_white_died.z_index = 1
		add_child(rook_white_died)
	if is_instance_valid(Rook_white2) == false:
		var rook_white_died2 = Sprite.new()
		rook_white_died2.texture = load("res://Image/Pieces/White/rook_white.png")
		rook_white_died2.centered = false
		rook_white_died2.position.x = 1500
		rook_white_died2.position.y = 700
		rook_white_died2.scale.x = 0.5
		rook_white_died2.scale.y = 0.5
		rook_white_died2.z_index = 1
		add_child(rook_white_died2)
	if is_instance_valid(Queen_white) == false:
		var queen_white_died = Sprite.new()
		queen_white_died.texture = load("res://Image/Pieces/White/queen_white.png")
		queen_white_died.centered = false
		queen_white_died.position.x = 1550
		queen_white_died.position.y = 700
		queen_white_died.scale.x = 0.5
		queen_white_died.scale.y = 0.5
		queen_white_died.z_index = 1
		add_child(queen_white_died)
		
	if is_instance_valid(Pawn_black) == false:
		var pawn_black_died = Sprite.new()
		pawn_black_died.texture = load("res://Image/Pieces/Black/pawn_black.png")
		pawn_black_died.centered = false
		pawn_black_died.position.x = 250
		pawn_black_died.position.y = 230
		pawn_black_died.scale.x = 0.5
		pawn_black_died.scale.y = 0.5
		pawn_black_died.z_index = 1
		add_child(pawn_black_died)
	if is_instance_valid(Pawn_black2) == false:
		var pawn_black_died2 = Sprite.new()
		pawn_black_died2.texture = load("res://Image/Pieces/Black/pawn_black.png")
		pawn_black_died2.centered = false
		pawn_black_died2.position.x = 300
		pawn_black_died2.position.y = 230
		pawn_black_died2.scale.x = 0.5
		pawn_black_died2.scale.y = 0.5
		pawn_black_died2.z_index = 1
		add_child(pawn_black_died2)
	if is_instance_valid(Pawn_black3) == false:
		var pawn_black_died3 = Sprite.new()
		pawn_black_died3.texture = load("res://Image/Pieces/Black/pawn_black.png")
		pawn_black_died3.centered = false
		pawn_black_died3.position.x = 350
		pawn_black_died3.position.y = 230
		pawn_black_died3.scale.x = 0.5
		pawn_black_died3.scale.y = 0.5
		pawn_black_died3.z_index = 1
		add_child(pawn_black_died3)
	if is_instance_valid(Pawn_black4) == false:
		var pawn_black_died4 = Sprite.new()
		pawn_black_died4.texture = load("res://Image/Pieces/Black/pawn_black.png")
		pawn_black_died4.centered = false
		pawn_black_died4.position.x = 400
		pawn_black_died4.position.y = 230
		pawn_black_died4.scale.x = 0.5
		pawn_black_died4.scale.y = 0.5
		pawn_black_died4.z_index = 1
		add_child(pawn_black_died4)
	if is_instance_valid(Pawn_black5) == false:
		var pawn_black_died5 = Sprite.new()
		pawn_black_died5.texture = load("res://Image/Pieces/Black/pawn_black.png")
		pawn_black_died5.centered = false
		pawn_black_died5.position.x = 250
		pawn_black_died5.position.y = 280
		pawn_black_died5.scale.x = 0.5
		pawn_black_died5.scale.y = 0.5
		pawn_black_died5.z_index = 1
		add_child(pawn_black_died5)
	if is_instance_valid(Pawn_black6) == false:
		var pawn_black_died6 = Sprite.new()
		pawn_black_died6.texture = load("res://Image/Pieces/Black/pawn_black.png")
		pawn_black_died6.centered = false
		pawn_black_died6.position.x = 300
		pawn_black_died6.position.y = 280
		pawn_black_died6.scale.x = 0.5
		pawn_black_died6.scale.y = 0.5
		pawn_black_died6.z_index = 1
		add_child(pawn_black_died6)
	if is_instance_valid(Pawn_black7) == false:
		var pawn_black_died7 = Sprite.new()
		pawn_black_died7.texture = load("res://Image/Pieces/Black/pawn_black.png")
		pawn_black_died7.centered = false
		pawn_black_died7.position.x = 350
		pawn_black_died7.position.y = 280
		pawn_black_died7.scale.x = 0.5
		pawn_black_died7.scale.y = 0.5
		pawn_black_died7.z_index = 1
		add_child(pawn_black_died7)
	if is_instance_valid(Pawn_black8) == false:
		var pawn_black_died8 = Sprite.new()
		pawn_black_died8.texture = load("res://Image/Pieces/Black/pawn_black.png")
		pawn_black_died8.centered = false
		pawn_black_died8.position.x = 400
		pawn_black_died8.position.y = 280
		pawn_black_died8.scale.x = 0.5
		pawn_black_died8.scale.y = 0.5
		pawn_black_died8.z_index = 1
		add_child(pawn_black_died8)
	if is_instance_valid(Knight_black) == false:
		var knight_black_died = Sprite.new()
		knight_black_died.texture = load("res://Image/Pieces/Black/knight_black.png")
		knight_black_died.centered = false
		knight_black_died.position.x = 250
		knight_black_died.position.y = 330
		knight_black_died.scale.x = 0.5
		knight_black_died.scale.y = 0.5
		knight_black_died.z_index = 1
		add_child(knight_black_died)
	if is_instance_valid(Knight_black2) == false:
		var knight_black_died2 = Sprite.new()
		knight_black_died2.texture = load("res://Image/Pieces/Black/knight_black.png")
		knight_black_died2.centered = false
		knight_black_died2.position.x = 300
		knight_black_died2.position.y = 330
		knight_black_died2.scale.x = 0.5
		knight_black_died2.scale.y = 0.5
		knight_black_died2.z_index = 1
		add_child(knight_black_died2)
	if is_instance_valid(Bishop_black) == false:
		var bishop_black_died = Sprite.new()
		bishop_black_died.texture = load("res://Image/Pieces/Black/bishop_black.png")
		bishop_black_died.centered = false
		bishop_black_died.position.x = 350
		bishop_black_died.position.y = 330
		bishop_black_died.scale.x = 0.5
		bishop_black_died.scale.y = 0.5
		bishop_black_died.z_index = 1
		add_child(bishop_black_died)
	if is_instance_valid(Bishop_black2) == false:
		var bishop_black_died2 = Sprite.new()
		bishop_black_died2.texture = load("res://Image/Pieces/Black/bishop_black.png")
		bishop_black_died2.centered = false
		bishop_black_died2.position.x = 400
		bishop_black_died2.position.y = 330
		bishop_black_died2.scale.x = 0.5
		bishop_black_died2.scale.y = 0.5
		bishop_black_died2.z_index = 1
		add_child(bishop_black_died2)
	if is_instance_valid(Rook_black) == false:
		var rook_black_died = Sprite.new()
		rook_black_died.texture = load("res://Image/Pieces/Black/rook_black.png")
		rook_black_died.centered = false
		rook_black_died.position.x = 250
		rook_black_died.position.y = 380
		rook_black_died.scale.x = 0.5
		rook_black_died.scale.y = 0.5
		rook_black_died.z_index = 1
		add_child(rook_black_died)
	if is_instance_valid(Rook_black2) == false:
		var rook_black_died2 = Sprite.new()
		rook_black_died2.texture = load("res://Image/Pieces/Black/rook_black.png")
		rook_black_died2.centered = false
		rook_black_died2.position.x = 300
		rook_black_died2.position.y = 380
		rook_black_died2.scale.x = 0.5
		rook_black_died2.scale.y = 0.5
		rook_black_died2.z_index = 1
		add_child(rook_black_died2)
	if is_instance_valid(Queen_black) == false:
		var queen_black_died = Sprite.new()
		queen_black_died.texture = load("res://Image/Pieces/Black/queen_black.png")
		queen_black_died.centered = false
		queen_black_died.position.x = 350
		queen_black_died.position.y = 380
		queen_black_died.scale.x = 0.5
		queen_black_died.scale.y = 0.5
		queen_black_died.z_index = 1
		add_child(queen_black_died)

func display_echec_white_and_black():

	if King_white.king_in_check == true:
		get_node("Text_echec_white").visible = true
	elif King_white.king_in_check == false:
		get_node("Text_echec_white").visible = false

	if King_white.checkmate == true:
		get_node("Text_echec_white").visible = true
		get_node("Text_echec_white").text = "Echec\n et mat"

	if King_black.king_in_check == true:
		get_node("Text_echec_black").visible = true
	elif King_black.king_in_check == false:
		get_node("Text_echec_black").visible = false

	if King_black.checkmate == true:
		get_node("Text_echec_black").visible = true
		get_node("Text_echec_black").text = "Echec\n et mat"

func player_turn_white():
	
	if Pawn_white != null and is_instance_valid(Pawn_white) == true:
		Pawn_white.player_turn = "black"
	if Pawn_white2 != null and is_instance_valid(Pawn_white2) == true:
		Pawn_white2.player_turn = "black"
	if Pawn_white3 != null and is_instance_valid(Pawn_white3) == true:
		Pawn_white3.player_turn = "black"
	if Pawn_white4 != null and is_instance_valid(Pawn_white4) == true:
		Pawn_white4.player_turn = "black"
	if Pawn_white5 != null and is_instance_valid(Pawn_white5) == true:
		Pawn_white5.player_turn = "black"
	if Pawn_white6 != null and is_instance_valid(Pawn_white6) == true:
		Pawn_white6.player_turn = "black"
	if Pawn_white7 != null and is_instance_valid(Pawn_white7) == true:
		Pawn_white7.player_turn = "black"
	if Pawn_white8 != null and is_instance_valid(Pawn_white8) == true:
		Pawn_white8.player_turn = "black"
	if Knight_white != null and is_instance_valid(Knight_white) == true:
		Knight_white.player_turn = "black"
	if Knight_white2 != null and is_instance_valid(Knight_white2) == true:
		Knight_white2.player_turn = "black"
	if Bishop_white != null and is_instance_valid(Bishop_white) == true:
		Bishop_white.player_turn = "black"
	if Bishop_white2 != null and is_instance_valid(Bishop_white2) == true:
		Bishop_white2.player_turn = "black"
	if Rook_white != null and is_instance_valid(Rook_white) == true:
		Rook_white.player_turn = "black"
	if Rook_white2 != null and is_instance_valid(Rook_white2) == true:
		Rook_white2.player_turn = "black"
	if Queen_white != null and is_instance_valid(Queen_white) == true:
		Queen_white.player_turn = "black"
	if King_white != null and is_instance_valid(King_white) == true:
		King_white.player_turn = "black"
		
	if Pawn_black != null and is_instance_valid(Pawn_black) == true:
		Pawn_black.player_turn = "black"
	if Pawn_black2 != null and is_instance_valid(Pawn_black2) == true:
		Pawn_black2.player_turn = "black"
	if Pawn_black3 != null and is_instance_valid(Pawn_black3) == true:
		Pawn_black3.player_turn = "black"
	if Pawn_black4 != null and is_instance_valid(Pawn_black4) == true:
		Pawn_black4.player_turn = "black"
	if Pawn_black5 != null and is_instance_valid(Pawn_black5) == true:
		Pawn_black5.player_turn = "black"
	if Pawn_black6 != null and is_instance_valid(Pawn_black6) == true:
		Pawn_black6.player_turn = "black"
	if Pawn_black7 != null and is_instance_valid(Pawn_black7) == true:
		Pawn_black7.player_turn = "black"
	if Pawn_black8 != null and is_instance_valid(Pawn_black8) == true:
		Pawn_black8.player_turn = "black"
	if Knight_black != null and is_instance_valid(Knight_black) == true:
		Knight_black.player_turn = "black"
	if Knight_black2 != null and is_instance_valid(Knight_black2) == true:
		Knight_black2.player_turn = "black"
	if Bishop_black != null and is_instance_valid(Bishop_black) == true:
		Bishop_black.player_turn = "black"
	if Bishop_black2 != null and is_instance_valid(Bishop_black2) == true:
		Bishop_black2.player_turn = "black"
	if Rook_black != null and is_instance_valid(Rook_black) == true:
		Rook_black.player_turn = "black"
	if Rook_black2 != null and is_instance_valid(Rook_black2) == true:
		Rook_black2.player_turn = "black"
	if Queen_black != null and is_instance_valid(Queen_black) == true:
		Queen_black.player_turn = "black"
	if King_black != null and is_instance_valid(King_black) == true:
		King_black.player_turn = "black"
			
func player_turn_black():
	
	if Pawn_white != null and is_instance_valid(Pawn_white) == true:
		Pawn_white.player_turn = "white"
	if Pawn_white2 != null and is_instance_valid(Pawn_white2) == true:
		Pawn_white2.player_turn = "white"
	if Pawn_white3 != null and is_instance_valid(Pawn_white3) == true:
		Pawn_white3.player_turn = "white"
	if Pawn_white4 != null and is_instance_valid(Pawn_white4) == true:
		Pawn_white4.player_turn = "white"
	if Pawn_white5 != null and is_instance_valid(Pawn_white5) == true:
		Pawn_white5.player_turn = "white"
	if Pawn_white6 != null and is_instance_valid(Pawn_white6) == true:
		Pawn_white6.player_turn = "white"
	if Pawn_white7 != null and is_instance_valid(Pawn_white7) == true:
		Pawn_white7.player_turn = "white"
	if Pawn_white8 != null and is_instance_valid(Pawn_white8) == true:
		Pawn_white8.player_turn = "white"
	if Knight_white != null and is_instance_valid(Knight_white) == true:
		Knight_white.player_turn = "white"
	if Knight_white2 != null and is_instance_valid(Knight_white2) == true:
		Knight_white2.player_turn = "white"
	if Bishop_white != null and is_instance_valid(Bishop_white) == true:
		Bishop_white.player_turn = "white"
	if Bishop_white2 != null and is_instance_valid(Bishop_white2) == true:
		Bishop_white2.player_turn = "white"
	if Rook_white != null and is_instance_valid(Rook_white) == true:
		Rook_white.player_turn = "white"
	if Rook_white2 != null and is_instance_valid(Rook_white2) == true:
		Rook_white2.player_turn = "white"
	if Queen_white != null and is_instance_valid(Queen_white) == true:
		Queen_white.player_turn = "white"
	if King_white != null and is_instance_valid(King_white) == true:
		King_white.player_turn = "white"
		
	if Pawn_black != null and is_instance_valid(Pawn_black) == true:
		Pawn_black.player_turn = "white"
	if Pawn_black2 != null and is_instance_valid(Pawn_black2) == true:
		Pawn_black2.player_turn = "white"
	if Pawn_black3 != null and is_instance_valid(Pawn_black3) == true:
		Pawn_black3.player_turn = "white"
	if Pawn_black4 != null and is_instance_valid(Pawn_black4) == true:
		Pawn_black4.player_turn = "white"
	if Pawn_black5 != null and is_instance_valid(Pawn_black5) == true:
		Pawn_black5.player_turn = "white"
	if Pawn_black6 != null and is_instance_valid(Pawn_black6) == true:
		Pawn_black6.player_turn = "white"
	if Pawn_black7 != null and is_instance_valid(Pawn_black7) == true:
		Pawn_black7.player_turn = "white"
	if Pawn_black8 != null and is_instance_valid(Pawn_black8) == true:
		Pawn_black8.player_turn = "white"
	if Knight_black != null and is_instance_valid(Knight_black) == true:
		Knight_black.player_turn = "white"
	if Knight_black2 != null and is_instance_valid(Knight_black2) == true:
		Knight_black2.player_turn = "white"
	if Bishop_black != null and is_instance_valid(Bishop_black) == true:
		Bishop_black.player_turn = "white"
	if Bishop_black2 != null and is_instance_valid(Bishop_black2) == true:
		Bishop_black2.player_turn = "white"
	if Rook_black != null and is_instance_valid(Rook_black) == true:
		Rook_black.player_turn = "white"
	if Rook_black2 != null and is_instance_valid(Rook_black2) == true:
		Rook_black2.player_turn = "white"
	if Queen_black != null and is_instance_valid(Queen_black) == true:
		Queen_black.player_turn = "white"
	if King_black != null and is_instance_valid(King_black) == true:
		King_black.player_turn = "white"
	
func updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard):
	
	if Pawn_white != null and is_instance_valid(Pawn_white) == true:
		Pawn_white.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Pawn_white2 != null and is_instance_valid(Pawn_white2) == true:
		Pawn_white2.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Pawn_white3 != null and is_instance_valid(Pawn_white3) == true:
		Pawn_white3.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Pawn_white4 != null and is_instance_valid(Pawn_white4) == true:
		Pawn_white4.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Pawn_white5 != null and is_instance_valid(Pawn_white5) == true:
		Pawn_white5.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Pawn_white6 != null and is_instance_valid(Pawn_white6) == true:
		Pawn_white6.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Pawn_white7 != null and is_instance_valid(Pawn_white7) == true:
		Pawn_white7.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Pawn_white8 != null and is_instance_valid(Pawn_white8) == true:
		Pawn_white8.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Knight_white != null and is_instance_valid(Knight_white) == true:
		Knight_white.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Knight_white2 != null and is_instance_valid(Knight_white2) == true:
		Knight_white2.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Bishop_white != null and is_instance_valid(Bishop_white) == true:
		Bishop_white.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Bishop_white2 != null and is_instance_valid(Bishop_white2) == true:
		Bishop_white2.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Rook_white != null and is_instance_valid(Rook_white) == true:
		Rook_white.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Rook_white2 != null and is_instance_valid(Rook_white2) == true:
		Rook_white2.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Queen_white != null and is_instance_valid(Queen_white) == true:
		Queen_white.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if King_white != null and is_instance_valid(King_white) == true:
		King_white.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	
	if Pawn_black != null and is_instance_valid(Pawn_black) == true:
		Pawn_black.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Pawn_black2 != null and is_instance_valid(Pawn_black2) == true:
		Pawn_black2.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Pawn_black3 != null and is_instance_valid(Pawn_black3) == true:
		Pawn_black3.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Pawn_black4 != null and is_instance_valid(Pawn_black4) == true:
		Pawn_black4.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Pawn_black5 != null and is_instance_valid(Pawn_black5) == true:
		Pawn_black5.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Pawn_black6 != null and is_instance_valid(Pawn_black6) == true:
		Pawn_black6.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Pawn_black7 != null and is_instance_valid(Pawn_black7) == true:
		Pawn_black7.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Pawn_black8 != null and is_instance_valid(Pawn_black8) == true:
		Pawn_black8.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Knight_black != null and is_instance_valid(Knight_black) == true:
		Knight_black.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Knight_black2 != null and is_instance_valid(Knight_black2) == true:
		Knight_black2.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Bishop_black != null and is_instance_valid(Bishop_black) == true:
		Bishop_black.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Bishop_black2 != null and is_instance_valid(Bishop_black2) == true:
		Bishop_black2.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Rook_black != null and is_instance_valid(Rook_black) == true:
		Rook_black.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Rook_black2 != null and is_instance_valid(Rook_black2) == true:
		Rook_black2.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if Queen_black != null and is_instance_valid(Queen_black) == true:
		Queen_black.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	if King_black != null and is_instance_valid(King_black) == true:
		King_black.position_piece_on_the_chessboard = new_position_piece_on_the_chessboard
	
func check_king_white_is_safe():
	if Pawn_white != null and is_instance_valid(Pawn_white) == true:
		Pawn_white.king_in_check = false
		Pawn_white.can_protect_the_king = false
		Pawn_white.piece_protects_against_an_attack = false
	if Pawn_white2 != null and is_instance_valid(Pawn_white2) == true:
		Pawn_white2.king_in_check = false
		Pawn_white2.can_protect_the_king = false
		Pawn_white2.piece_protects_against_an_attack = false
	if Pawn_white3 != null and is_instance_valid(Pawn_white3) == true:
		Pawn_white3.king_in_check = false
		Pawn_white3.can_protect_the_king = false
		Pawn_white3.piece_protects_against_an_attack = false
	if Pawn_white4 != null and is_instance_valid(Pawn_white4) == true:
		Pawn_white4.king_in_check = false
		Pawn_white4.can_protect_the_king = false
		Pawn_white4.piece_protects_against_an_attack = false
	if Pawn_white5 != null and is_instance_valid(Pawn_white5) == true:
		Pawn_white5.king_in_check = false
		Pawn_white5.can_protect_the_king = false
		Pawn_white5.piece_protects_against_an_attack = false
	if Pawn_white6 != null and is_instance_valid(Pawn_white6) == true:
		Pawn_white6.king_in_check = false
		Pawn_white6.can_protect_the_king = false
		Pawn_white6.piece_protects_against_an_attack = false
	if Pawn_white7 != null and is_instance_valid(Pawn_white7) == true:
		Pawn_white7.king_in_check = false
		Pawn_white7.can_protect_the_king = false
		Pawn_white7.piece_protects_against_an_attack = false
	if Pawn_white8 != null and is_instance_valid(Pawn_white8) == true:
		Pawn_white8.king_in_check = false
		Pawn_white8.can_protect_the_king = false
		Pawn_white8.piece_protects_against_an_attack = false
	if Knight_white != null and is_instance_valid(Knight_white) == true:
		Knight_white.king_in_check = false
		Knight_white.can_protect_the_king = false
		Knight_white.piece_protects_against_an_attack = false
	if Knight_white2 != null and is_instance_valid(Knight_white2) == true:
		Knight_white2.king_in_check = false
		Knight_white2.can_protect_the_king = false
		Knight_white2.piece_protects_against_an_attack = false
	if Bishop_white != null and is_instance_valid(Bishop_white) == true:
		Bishop_white.king_in_check = false
		Bishop_white.can_protect_the_king = false
		Bishop_white.piece_protects_against_an_attack = false
	if Bishop_white2 != null and is_instance_valid(Bishop_white2) == true:
		Bishop_white2.king_in_check = false
		Bishop_white2.can_protect_the_king = false
		Bishop_white2.piece_protects_against_an_attack = false
	if Rook_white != null and is_instance_valid(Rook_white) == true:
		Rook_white.king_in_check = false
		Rook_white.can_protect_the_king = false
		Rook_white.piece_protects_against_an_attack = false
	if Rook_white2 != null and is_instance_valid(Rook_white2) == true:
		Rook_white2.king_in_check = false
		Rook_white2.can_protect_the_king = false
		Rook_white2.piece_protects_against_an_attack = false
	if Queen_white != null and is_instance_valid(Queen_white) == true:
		Queen_white.king_in_check = false
		Queen_white.can_protect_the_king = false
		Queen_white.piece_protects_against_an_attack = false
	if King_white != null and is_instance_valid(King_white) == true:
		King_white.king_in_check = false
		King_white.piece_protect_the_king = false
			
func check_king_black_is_safe():
	if Pawn_black != null and is_instance_valid(Pawn_black) == true:
		Pawn_black.king_in_check = false
		Pawn_black.can_protect_the_king = false
		Pawn_black.piece_protects_against_an_attack = false
	if Pawn_black2 != null and is_instance_valid(Pawn_black2) == true:
		Pawn_black2.king_in_check = false
		Pawn_black2.can_protect_the_king = false
		Pawn_black2.piece_protects_against_an_attack = false
	if Pawn_black3 != null and is_instance_valid(Pawn_black3) == true:
		Pawn_black3.king_in_check = false
		Pawn_black3.can_protect_the_king = false
		Pawn_black3.piece_protects_against_an_attack = false
	if Pawn_black4 != null and is_instance_valid(Pawn_black4) == true:
		Pawn_black4.king_in_check = false
		Pawn_black4.can_protect_the_king = false
		Pawn_black4.piece_protects_against_an_attack = false
	if Pawn_black5 != null and is_instance_valid(Pawn_black5) == true:
		Pawn_black5.king_in_check = false
		Pawn_black5.can_protect_the_king = false
		Pawn_black5.piece_protects_against_an_attack = false
	if Pawn_black6 != null and is_instance_valid(Pawn_black6) == true:
		Pawn_black6.king_in_check = false
		Pawn_black6.can_protect_the_king = false
		Pawn_black6.piece_protects_against_an_attack = false
	if Pawn_black7 != null and is_instance_valid(Pawn_black7) == true:
		Pawn_black7.king_in_check = false
		Pawn_black7.can_protect_the_king = false
		Pawn_black7.piece_protects_against_an_attack = false
	if Pawn_black8 != null and is_instance_valid(Pawn_black8) == true:
		Pawn_black8.king_in_check = false
		Pawn_black8.can_protect_the_king = false
		Pawn_black8.piece_protects_against_an_attack = false
	if Knight_black != null and is_instance_valid(Knight_black) == true:
		Knight_black.king_in_check = false
		Knight_black.can_protect_the_king = false
		Knight_black.piece_protects_against_an_attack = false
	if Knight_black2 != null and is_instance_valid(Knight_black2) == true:
		Knight_black2.king_in_check = false
		Knight_black2.can_protect_the_king = false
		Knight_black2.piece_protects_against_an_attack = false
	if Bishop_black != null and is_instance_valid(Bishop_black) == true:
		Bishop_black.king_in_check = false
		Bishop_black.can_protect_the_king = false
		Bishop_black.piece_protects_against_an_attack = false
	if Bishop_black2 != null and is_instance_valid(Bishop_black2) == true:
		Bishop_black2.king_in_check = false
		Bishop_black2.can_protect_the_king = false
		Bishop_black2.piece_protects_against_an_attack = false
	if Rook_black != null and is_instance_valid(Rook_black) == true:
		Rook_black.king_in_check = false
		Rook_black.can_protect_the_king = false
		Rook_black.piece_protects_against_an_attack = false
	if Rook_black2 != null and is_instance_valid(Rook_black2) == true:
		Rook_black2.king_in_check = false
		Rook_black2.can_protect_the_king = false
		Rook_black2.piece_protects_against_an_attack = false
	if Queen_black != null and is_instance_valid(Queen_black) == true:
		Queen_black.king_in_check = false
		Queen_black.can_protect_the_king = false
		Queen_black.piece_protects_against_an_attack = false
	if King_black != null and is_instance_valid(King_black) == true:
		King_black.king_in_check = false
		King_black.piece_protect_the_king = false
		
func _on_Pawn_white_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_white()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_white_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Pawn_white.i * 100) - 200
#	Square_last_move.position.x = (Pawn_white.j * 100) - 200

func _on_Pawn_white2_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_white()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_white_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Pawn_white2.i * 100) - 200
#	Square_last_move.position.x = (Pawn_white2.j * 100) - 200

func _on_Pawn_white3_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_white()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_white_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Pawn_white3.i * 100) - 200
#	Square_last_move.position.x = (Pawn_white3.j * 100) - 200

func _on_Pawn_white4_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_white()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_white_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Pawn_white4.i * 100) - 200
#	Square_last_move.position.x = (Pawn_white4.j * 100) - 200

func _on_Pawn_white5_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_white()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_white_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Pawn_white5.i * 100) - 200
#	Square_last_move.position.x = (Pawn_white5.j * 100) - 200

func _on_Pawn_white6_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_white()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_white_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Pawn_white6.i * 100) - 200
#	Square_last_move.position.x = (Pawn_white6.j * 100) - 200

func _on_Pawn_white7_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_white()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_white_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Pawn_white7.i * 100) - 200
#	Square_last_move.position.x = (Pawn_white7.j * 100) - 200

func _on_Pawn_white8_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_white()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_white_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Pawn_white8.i * 100) - 200
#	Square_last_move.position.x = (Pawn_white8.j * 100) - 200
	
func _on_Knight_white_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_white()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_white_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Knight_white.i * 100) - 200
#	Square_last_move.position.x = (Knight_white.j * 100) - 200

func _on_Knight_white2_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_white()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_white_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Knight_white2.i * 100) - 200
#	Square_last_move.position.x = (Knight_white2.j * 100) - 200
	
func _on_Bishop_white_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_white()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_white_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Bishop_white.i * 100) - 200
#	Square_last_move.position.x = (Bishop_white.j * 100) - 200

func _on_Bishop_white2_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_white()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_white_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Bishop_white2.i * 100) - 200
#	Square_last_move.position.x = (Bishop_white2.j * 100) - 200
		
func _on_Rook_white_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_white()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_white_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Rook_white.i * 100) - 200
#	Square_last_move.position.x = (Rook_white.j * 100) - 200

func _on_Rook_white2_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_white()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_white_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Rook_white2.i * 100) - 200
#	Square_last_move.position.x = (Rook_white2.j * 100) - 200

func _on_Queen_white_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_white()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_white_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Queen_white.i * 100) - 200
#	Square_last_move.position.x = (Queen_white.j * 100) - 200

func _on_King_white_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_white()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_white_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (King_white.i * 100) - 200
#	Square_last_move.position.x = (King_white.j * 100) - 200

func _on_Pawn_black_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_black()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_black_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Pawn_black.i * 100) - 200
#	Square_last_move.position.x = (Pawn_black.j * 100) - 200

func _on_Pawn_black2_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_black()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_black_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Pawn_black2.i * 100) - 200
#	Square_last_move.position.x = (Pawn_black2.j * 100) - 200

func _on_Pawn_black3_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_black()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_black_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Pawn_black3.i * 100) - 200
#	Square_last_move.position.x = (Pawn_black3.j * 100) - 200

func _on_Pawn_black4_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_black()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_black_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Pawn_black4.i * 100) - 200
#	Square_last_move.position.x = (Pawn_black4.j * 100) - 200

func _on_Pawn_black5_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_black()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_black_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Pawn_black5.i * 100) - 200
#	Square_last_move.position.x = (Pawn_black5.j * 100) - 200

func _on_Pawn_black6_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_black()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_black_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Pawn_black6.i * 100) - 200
#	Square_last_move.position.x = (Pawn_black6.j * 100) - 200

func _on_Pawn_black7_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_black()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_black_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Pawn_black7.i * 100) - 200
#	Square_last_move.position.x = (Pawn_black7.j * 100) - 200

func _on_Pawn_black8_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_black()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_black_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Pawn_black8.i * 100) - 200
#	Square_last_move.position.x = (Pawn_black8.j * 100) - 200

func _on_Knight_black_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_black()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_black_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Knight_black.i * 100) - 200
#	Square_last_move.position.x = (Knight_black.j * 100) - 200
	
func _on_Knight_black2_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_black()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_black_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Knight_black2.i * 100) - 200
#	Square_last_move.position.x = (Knight_black2.j * 100) - 200

func _on_Bishop_black_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_black()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_black_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Bishop_black.i * 100) - 200
#	Square_last_move.position.x = (Bishop_black.j * 100) - 200

func _on_Bishop_black2_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_black()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_black_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Bishop_black2.i * 100) - 200
#	Square_last_move.position.x = (Bishop_black2.j * 100) - 200

func _on_Rook_black_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_black()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_black_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Rook_black.i * 100) - 200
#	Square_last_move.position.x = (Rook_black.j * 100) - 200

func _on_Rook_black2_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_black()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_black_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Rook_black2.i * 100) - 200
#	Square_last_move.position.x = (Rook_black2.j * 100) - 200

func _on_Queen_black_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_black()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_black_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (Queen_black.i * 100) - 200
#	Square_last_move.position.x = (Queen_black.j * 100) - 200

func _on_King_black_opponent_turned(new_position_piece_on_the_chessboard):
	player_turn_black()
	updating_the_pieces_on_the_board(new_position_piece_on_the_chessboard)
	check_king_black_is_safe()
#	Square_last_move.visible = true
#	Square_last_move.position.y = (King_black.i * 100) - 200
#	Square_last_move.position.x = (King_black.j * 100) - 200

#Pour savoir si le roi est en échec ou échec et mat
func _on_King_white_check_to_the_king(attacker_position_shift_i, attacker_position_shift_j,\
 defenseur_position_i, defenseur_position_j,direction_of_attack):
	
	if Pawn_white != null and is_instance_valid(Pawn_white) == true:
		Pawn_white.king_in_check = true
	if Pawn_white2 != null and is_instance_valid(Pawn_white2) == true:
		Pawn_white2.king_in_check = true
	if Pawn_white3 != null and is_instance_valid(Pawn_white3) == true:
		Pawn_white3.king_in_check = true
	if Pawn_white4 != null and is_instance_valid(Pawn_white4) == true:
		Pawn_white4.king_in_check = true
	if Pawn_white5 != null and is_instance_valid(Pawn_white5) == true:
		Pawn_white5.king_in_check = true
	if Pawn_white6 != null and is_instance_valid(Pawn_white6) == true:
		Pawn_white6.king_in_check = true
	if Pawn_white7 != null and is_instance_valid(Pawn_white7) == true:
		Pawn_white7.king_in_check = true
	if Pawn_white8 != null and is_instance_valid(Pawn_white8) == true:
		Pawn_white8.king_in_check = true
	if Knight_white != null and is_instance_valid(Knight_white) == true:
		Knight_white.king_in_check = true
	if Knight_white2 != null and is_instance_valid(Knight_white2) == true:
		Knight_white2.king_in_check = true
	if Bishop_white != null and is_instance_valid(Bishop_white) == true:
		Bishop_white.king_in_check = true
	if Bishop_white2 != null and is_instance_valid(Bishop_white2) == true:
		Bishop_white2.king_in_check = true
	if Rook_white != null and is_instance_valid(Rook_white) == true:
		Rook_white.king_in_check = true
	if Rook_white2 != null and is_instance_valid(Rook_white2) == true:
		Rook_white2.king_in_check = true
	if Queen_white != null and is_instance_valid(Queen_white) == true:
		Queen_white.king_in_check = true
	if King_white != null and is_instance_valid(King_white) == true:
		King_white.king_in_check = true
	
	if Pawn_white != null and is_instance_valid(Pawn_white) == true:
		if Pawn_white.i == defenseur_position_i and Pawn_white.j == defenseur_position_j:
			Pawn_white.can_protect_the_king = true
			if Pawn_white.attacker_position_shift_i == 0 and Pawn_white.attacker_position_shift_j == 0:
				Pawn_white.attacker_position_shift_i = attacker_position_shift_i
				Pawn_white.attacker_position_shift_j = attacker_position_shift_j
			else:
				Pawn_white.attacker_position_shift2_i = attacker_position_shift_i
				Pawn_white.attacker_position_shift2_j = attacker_position_shift_j
				
			Pawn_white.direction_of_attack = direction_of_attack
	
	if Pawn_white2 != null and is_instance_valid(Pawn_white2) == true:
		if Pawn_white2.i == defenseur_position_i and Pawn_white2.j == defenseur_position_j:
			Pawn_white2.can_protect_the_king = true
			if Pawn_white2.attacker_position_shift_i == 0 and Pawn_white2.attacker_position_shift_j == 0:
				Pawn_white2.attacker_position_shift_i = attacker_position_shift_i
				Pawn_white2.attacker_position_shift_j = attacker_position_shift_j
			else:
				Pawn_white2.attacker_position_shift2_i = attacker_position_shift_i
				Pawn_white2.attacker_position_shift2_j = attacker_position_shift_j
				
			Pawn_white2.direction_of_attack = direction_of_attack
	
	if Pawn_white3 != null and is_instance_valid(Pawn_white3) == true:
		if Pawn_white3.i == defenseur_position_i and Pawn_white3.j == defenseur_position_j:
			Pawn_white3.can_protect_the_king = true
			if Pawn_white3.attacker_position_shift_i == 0 and Pawn_white3.attacker_position_shift_j == 0:
				Pawn_white3.attacker_position_shift_i = attacker_position_shift_i
				Pawn_white3.attacker_position_shift_j = attacker_position_shift_j
			else:
				Pawn_white3.attacker_position_shift2_i = attacker_position_shift_i
				Pawn_white3.attacker_position_shift2_j = attacker_position_shift_j
				
			Pawn_white3.direction_of_attack = direction_of_attack
	
	if Pawn_white4 != null and is_instance_valid(Pawn_white4) == true:
		if Pawn_white4.i == defenseur_position_i and Pawn_white4.j == defenseur_position_j:
			Pawn_white4.can_protect_the_king = true
			if Pawn_white4.attacker_position_shift_i == 0 and Pawn_white4.attacker_position_shift_j == 0:
				Pawn_white4.attacker_position_shift_i = attacker_position_shift_i
				Pawn_white4.attacker_position_shift_j = attacker_position_shift_j
			else:
				Pawn_white4.attacker_position_shift2_i = attacker_position_shift_i
				Pawn_white4.attacker_position_shift2_j = attacker_position_shift_j
				
			Pawn_white4.direction_of_attack = direction_of_attack
	
	if Pawn_white5 != null and is_instance_valid(Pawn_white5) == true:
		if Pawn_white5.i == defenseur_position_i and Pawn_white5.j == defenseur_position_j:
			Pawn_white5.can_protect_the_king = true
			if Pawn_white5.attacker_position_shift_i == 0 and Pawn_white5.attacker_position_shift_j == 0:
				Pawn_white5.attacker_position_shift_i = attacker_position_shift_i
				Pawn_white5.attacker_position_shift_j = attacker_position_shift_j
			else:
				Pawn_white5.attacker_position_shift2_i = attacker_position_shift_i
				Pawn_white5.attacker_position_shift2_j = attacker_position_shift_j
				
			Pawn_white5.direction_of_attack = direction_of_attack
	
	if Pawn_white6 != null and is_instance_valid(Pawn_white6) == true:
		if Pawn_white6.i == defenseur_position_i and Pawn_white6.j == defenseur_position_j:
			Pawn_white6.can_protect_the_king = true
			if Pawn_white6.attacker_position_shift_i == 0 and Pawn_white6.attacker_position_shift_j == 0:
				Pawn_white6.attacker_position_shift_i = attacker_position_shift_i
				Pawn_white6.attacker_position_shift_j = attacker_position_shift_j
			else:
				Pawn_white6.attacker_position_shift2_i = attacker_position_shift_i
				Pawn_white6.attacker_position_shift2_j = attacker_position_shift_j
				
			Pawn_white6.direction_of_attack = direction_of_attack
	
	if Pawn_white7 != null and is_instance_valid(Pawn_white7) == true:
		if Pawn_white7.i == defenseur_position_i and Pawn_white7.j == defenseur_position_j:
			Pawn_white7.can_protect_the_king = true
			if Pawn_white7.attacker_position_shift_i == 0 and Pawn_white7.attacker_position_shift_j == 0:
				Pawn_white7.attacker_position_shift_i = attacker_position_shift_i
				Pawn_white7.attacker_position_shift_j = attacker_position_shift_j
			else:
				Pawn_white7.attacker_position_shift2_i = attacker_position_shift_i
				Pawn_white7.attacker_position_shift2_j = attacker_position_shift_j
				
			Pawn_white7.direction_of_attack = direction_of_attack
	
	if Pawn_white8 != null and is_instance_valid(Pawn_white8) == true:
		if Pawn_white8.i == defenseur_position_i and Pawn_white8.j == defenseur_position_j:
			Pawn_white8.can_protect_the_king = true
			if Pawn_white8.attacker_position_shift_i == 0 and Pawn_white8.attacker_position_shift_j == 0:
				Pawn_white8.attacker_position_shift_i = attacker_position_shift_i
				Pawn_white8.attacker_position_shift_j = attacker_position_shift_j
			else:
				Pawn_white8.attacker_position_shift2_i = attacker_position_shift_i
				Pawn_white8.attacker_position_shift2_j = attacker_position_shift_j
				
			Pawn_white8.direction_of_attack = direction_of_attack
	
	if Knight_white != null and is_instance_valid(Knight_white) == true:
		if Knight_white.i == defenseur_position_i and Knight_white.j == defenseur_position_j:
			Knight_white.can_protect_the_king = true
			if Knight_white.attacker_position_shift_i == 0 and Knight_white.attacker_position_shift_j == 0:
				Knight_white.attacker_position_shift_i = attacker_position_shift_i
				Knight_white.attacker_position_shift_j = attacker_position_shift_j
			else:
				Knight_white.attacker_position_shift2_i = attacker_position_shift_i
				Knight_white.attacker_position_shift2_j = attacker_position_shift_j
				
			Knight_white.direction_of_attack = direction_of_attack

	if Knight_white2 != null and is_instance_valid(Knight_white2) == true:
		if Knight_white2.i == defenseur_position_i and Knight_white2.j == defenseur_position_j:
			Knight_white2.can_protect_the_king = true
			if Knight_white2.attacker_position_shift_i == 0 and Knight_white2.attacker_position_shift_j == 0:
				Knight_white2.attacker_position_shift_i = attacker_position_shift_i
				Knight_white2.attacker_position_shift_j = attacker_position_shift_j
			else:
				Knight_white2.attacker_position_shift2_i = attacker_position_shift_i
				Knight_white2.attacker_position_shift2_j = attacker_position_shift_j
				
			Knight_white.direction_of_attack = direction_of_attack
			
	if Bishop_white != null and is_instance_valid(Bishop_white) == true:
		if Bishop_white.i == defenseur_position_i and Bishop_white.j == defenseur_position_j:
			Bishop_white.can_protect_the_king = true
			if Bishop_white.attacker_position_shift_i == 0 and Bishop_white.attacker_position_shift_j == 0:
				Bishop_white.attacker_position_shift_i = attacker_position_shift_i
				Bishop_white.attacker_position_shift_j = attacker_position_shift_j
			else:
				Bishop_white.attacker_position_shift2_i = attacker_position_shift_i
				Bishop_white.attacker_position_shift2_j = attacker_position_shift_j
				
			Bishop_white.direction_of_attack = direction_of_attack
	
	if Bishop_white2 != null and is_instance_valid(Bishop_white2) == true:
		if Bishop_white2.i == defenseur_position_i and Bishop_white2.j == defenseur_position_j:
			Bishop_white2.can_protect_the_king = true
			if Bishop_white2.attacker_position_shift_i == 0 and Bishop_white2.attacker_position_shift_j == 0:
				Bishop_white2.attacker_position_shift_i = attacker_position_shift_i
				Bishop_white2.attacker_position_shift_j = attacker_position_shift_j
			else:
				Bishop_white2.attacker_position_shift2_i = attacker_position_shift_i
				Bishop_white2.attacker_position_shift2_j = attacker_position_shift_j
				
			Bishop_white2.direction_of_attack = direction_of_attack

	if Rook_white != null and is_instance_valid(Rook_white) == true:
		if Rook_white.i == defenseur_position_i and Rook_white.j == defenseur_position_j:
			Rook_white.can_protect_the_king = true
			if Rook_white.attacker_position_shift_i == 0 and Rook_white.attacker_position_shift_j == 0:
				Rook_white.attacker_position_shift_i = attacker_position_shift_i
				Rook_white.attacker_position_shift_j = attacker_position_shift_j
			else:
				Rook_white.attacker_position_shift2_i = attacker_position_shift_i
				Rook_white.attacker_position_shift2_j = attacker_position_shift_j
				
			Rook_white.direction_of_attack = direction_of_attack
	
	if Rook_white2 != null and is_instance_valid(Rook_white2) == true:
		if Rook_white2.i == defenseur_position_i and Rook_white2.j == defenseur_position_j:
			Rook_white2.can_protect_the_king = true
			if Rook_white2.attacker_position_shift_i == 0 and Rook_white2.attacker_position_shift_j == 0:
				Rook_white2.attacker_position_shift_i = attacker_position_shift_i
				Rook_white2.attacker_position_shift_j = attacker_position_shift_j
			else:
				Rook_white2.attacker_position_shift2_i = attacker_position_shift_i
				Rook_white2.attacker_position_shift2_j = attacker_position_shift_j
				
			Rook_white2.direction_of_attack = direction_of_attack
	
	if Queen_white != null and is_instance_valid(Queen_white) == true:
		if Queen_white.i == defenseur_position_i and Queen_white.j == defenseur_position_j:
			Queen_white.can_protect_the_king = true
			if Queen_white.attacker_position_shift_i == 0 and Queen_white.attacker_position_shift_j == 0:
				Queen_white.attacker_position_shift_i = attacker_position_shift_i
				Queen_white.attacker_position_shift_j = attacker_position_shift_j
			elif Queen_white.attacker_position_shift2_i == 0 and Queen_white.attacker_position_shift2_j == 0:
				Queen_white.attacker_position_shift2_i = attacker_position_shift_i
				Queen_white.attacker_position_shift2_j = attacker_position_shift_j
			else:
				Queen_white.attacker_position_shift3_i = attacker_position_shift_i
				Queen_white.attacker_position_shift3_j = attacker_position_shift_j
				
			Queen_white.direction_of_attack = direction_of_attack
			
func _on_King_white_checkmate_to_the_king(checkmate):
	if Pawn_white != null and is_instance_valid(Pawn_white) == true:
		Pawn_white.king_in_check = checkmate
	if Pawn_white2 != null and is_instance_valid(Pawn_white2) == true:
		Pawn_white2.king_in_check = checkmate
	if Pawn_white3 != null and is_instance_valid(Pawn_white3) == true:
		Pawn_white3.king_in_check = checkmate
	if Pawn_white4 != null and is_instance_valid(Pawn_white4) == true:
		Pawn_white4.king_in_check = checkmate
	if Pawn_white5 != null and is_instance_valid(Pawn_white5) == true:
		Pawn_white5.king_in_check = checkmate
	if Pawn_white6 != null and is_instance_valid(Pawn_white6) == true:
		Pawn_white6.king_in_check = checkmate
	if Pawn_white7 != null and is_instance_valid(Pawn_white7) == true:
		Pawn_white7.king_in_check = checkmate
	if Pawn_white8 != null and is_instance_valid(Pawn_white8) == true:
		Pawn_white8.king_in_check = checkmate
	if Knight_white != null and is_instance_valid(Knight_white) == true:
		Knight_white.king_in_check = checkmate
	if Knight_white2 != null and is_instance_valid(Knight_white2) == true:
		Knight_white2.king_in_check = checkmate
	if Bishop_white != null and is_instance_valid(Bishop_white) == true:
		Bishop_white.king_in_check = checkmate
	if Bishop_white2 != null and is_instance_valid(Bishop_white2) == true:
		Bishop_white2.king_in_check = checkmate
	if Rook_white != null and is_instance_valid(Rook_white) == true:
		Rook_white.king_in_check = checkmate
	if Rook_white2 != null and is_instance_valid(Rook_white2) == true:
		Rook_white2.king_in_check = checkmate
	if Queen_white != null and is_instance_valid(Queen_white) == true:
		Queen_white.king_in_check = checkmate
	
	if Pawn_black != null and is_instance_valid(Pawn_black) == true:
		Pawn_black.king_in_check = checkmate
	if Pawn_black2 != null and is_instance_valid(Pawn_black) == true:
		Pawn_black2.king_in_check = checkmate
	if Pawn_black3 != null and is_instance_valid(Pawn_black) == true:
		Pawn_black3.king_in_check = checkmate
	if Pawn_black4 != null and is_instance_valid(Pawn_black) == true:
		Pawn_black4.king_in_check = checkmate
	if Pawn_black5 != null and is_instance_valid(Pawn_black) == true:
		Pawn_black5.king_in_check = checkmate
	if Pawn_black6 != null and is_instance_valid(Pawn_black) == true:
		Pawn_black6.king_in_check = checkmate
	if Pawn_black7 != null and is_instance_valid(Pawn_black) == true:
		Pawn_black7.king_in_check = checkmate
	if Pawn_black8 != null and is_instance_valid(Pawn_black) == true:
		Pawn_black8.king_in_check = checkmate
	if Knight_black != null and is_instance_valid(Pawn_black) == true:
		Knight_black.king_in_check = checkmate
	if Knight_black2 != null and is_instance_valid(Pawn_black) == true:
		Knight_black2.king_in_check = checkmate
	if Bishop_black != null and is_instance_valid(Pawn_black) == true:
		Bishop_black.king_in_check = checkmate
	if Bishop_black2 != null and is_instance_valid(Pawn_black) == true:
		Bishop_black2.king_in_check = checkmate
	if Rook_black != null and is_instance_valid(Pawn_black) == true:
		Rook_black.king_in_check = checkmate
	if Rook_black2 != null and is_instance_valid(Pawn_black) == true:
		Rook_black2.king_in_check = checkmate
	if Queen_black != null and is_instance_valid(Pawn_black) == true:
		Queen_black.king_in_check = checkmate
		
func _on_King_black_check_to_the_king(attacker_position_shift_i, attacker_position_shift_j,\
 defenseur_position_i, defenseur_position_j,direction_of_attack):
	if Pawn_black != null and is_instance_valid(Pawn_black) == true:
		Pawn_black.king_in_check = true
	if Pawn_black2 != null and is_instance_valid(Pawn_black2) == true:
		Pawn_black2.king_in_check = true
	if Pawn_black3 != null and is_instance_valid(Pawn_black3) == true:
		Pawn_black3.king_in_check = true
	if Pawn_black4 != null and is_instance_valid(Pawn_black4) == true:
		Pawn_black4.king_in_check = true
	if Pawn_black5 != null and is_instance_valid(Pawn_black5) == true:
		Pawn_black5.king_in_check = true
	if Pawn_black6 != null and is_instance_valid(Pawn_black6) == true:
		Pawn_black6.king_in_check = true
	if Pawn_black7 != null and is_instance_valid(Pawn_black7) == true:
		Pawn_black7.king_in_check = true
	if Pawn_black8 != null and is_instance_valid(Pawn_black8) == true:
		Pawn_black8.king_in_check = true
	if Knight_black != null and is_instance_valid(Knight_black) == true:
		Knight_black.king_in_check = true
	if Knight_black2 != null and is_instance_valid(Knight_black2) == true:
		Knight_black2.king_in_check = true
	if Bishop_black != null and is_instance_valid(Bishop_black) == true:
		Bishop_black.king_in_check = true
	if Bishop_black2 != null and is_instance_valid(Bishop_black2) == true:
		Bishop_black2.king_in_check = true
	if Rook_black != null and is_instance_valid(Rook_black) == true:
		Rook_black.king_in_check = true
	if Rook_black2 != null and is_instance_valid(Rook_black2) == true:
		Rook_black2.king_in_check = true
	if Queen_black != null and is_instance_valid(Queen_black) == true:
		Queen_black.king_in_check = true
	if King_black != null and is_instance_valid(King_black) == true:
		King_black.king_in_check = true
	
	if Pawn_black != null and is_instance_valid(Pawn_black) == true:
		if Pawn_black.i == defenseur_position_i and Pawn_black.j == defenseur_position_j:
			Pawn_black.can_protect_the_king = true
			if Pawn_black.attacker_position_shift_i == 0 and Pawn_black.attacker_position_shift_j == 0:
				Pawn_black.attacker_position_shift_i = attacker_position_shift_i
				Pawn_black.attacker_position_shift_j = attacker_position_shift_j
			else:
				Pawn_black.attacker_position_shift2_i = attacker_position_shift_i
				Pawn_black.attacker_position_shift2_j = attacker_position_shift_j
				
			Pawn_black.direction_of_attack = direction_of_attack
	
	if Pawn_black2 != null and is_instance_valid(Pawn_black2) == true:
		if Pawn_black2.i == defenseur_position_i and Pawn_black2.j == defenseur_position_j:
			Pawn_black2.can_protect_the_king = true
			if Pawn_black2.attacker_position_shift_i == 0 and Pawn_black2.attacker_position_shift_j == 0:
				Pawn_black2.attacker_position_shift_i = attacker_position_shift_i
				Pawn_black2.attacker_position_shift_j = attacker_position_shift_j
			else:
				Pawn_black2.attacker_position_shift2_i = attacker_position_shift_i
				Pawn_black2.attacker_position_shift2_j = attacker_position_shift_j
				
			Pawn_black2.direction_of_attack = direction_of_attack
	
	if Pawn_black3 != null and is_instance_valid(Pawn_black3) == true:
		if Pawn_black3.i == defenseur_position_i and Pawn_black3.j == defenseur_position_j:
			Pawn_black3.can_protect_the_king = true
			if Pawn_black3.attacker_position_shift_i == 0 and Pawn_black3.attacker_position_shift_j == 0:
				Pawn_black3.attacker_position_shift_i = attacker_position_shift_i
				Pawn_black3.attacker_position_shift_j = attacker_position_shift_j
			else:
				Pawn_black3.attacker_position_shift2_i = attacker_position_shift_i
				Pawn_black3.attacker_position_shift2_j = attacker_position_shift_j
				
			Pawn_black3.direction_of_attack = direction_of_attack
	
	if Pawn_black4 != null and is_instance_valid(Pawn_black4) == true:
		if Pawn_black4.i == defenseur_position_i and Pawn_black4.j == defenseur_position_j:
			Pawn_black4.can_protect_the_king = true
			if Pawn_black4.attacker_position_shift_i == 0 and Pawn_black4.attacker_position_shift_j == 0:
				Pawn_black4.attacker_position_shift_i = attacker_position_shift_i
				Pawn_black4.attacker_position_shift_j = attacker_position_shift_j
			else:
				Pawn_black4.attacker_position_shift2_i = attacker_position_shift_i
				Pawn_black4.attacker_position_shift2_j = attacker_position_shift_j
				
			Pawn_black4.direction_of_attack = direction_of_attack
	
	if Pawn_black5 != null and is_instance_valid(Pawn_black5) == true:
		if Pawn_black5.i == defenseur_position_i and Pawn_black5.j == defenseur_position_j:
			Pawn_black5.can_protect_the_king = true
			if Pawn_black5.attacker_position_shift_i == 0 and Pawn_black5.attacker_position_shift_j == 0:
				Pawn_black5.attacker_position_shift_i = attacker_position_shift_i
				Pawn_black5.attacker_position_shift_j = attacker_position_shift_j
			else:
				Pawn_black5.attacker_position_shift2_i = attacker_position_shift_i
				Pawn_black5.attacker_position_shift2_j = attacker_position_shift_j
				
			Pawn_black5.direction_of_attack = direction_of_attack
	
	if Pawn_black6 != null and is_instance_valid(Pawn_black6) == true:
		if Pawn_black6.i == defenseur_position_i and Pawn_black6.j == defenseur_position_j:
			Pawn_black6.can_protect_the_king = true
			if Pawn_black6.attacker_position_shift_i == 0 and Pawn_black6.attacker_position_shift_j == 0:
				Pawn_black6.attacker_position_shift_i = attacker_position_shift_i
				Pawn_black6.attacker_position_shift_j = attacker_position_shift_j
			else:
				Pawn_black6.attacker_position_shift2_i = attacker_position_shift_i
				Pawn_black6.attacker_position_shift2_j = attacker_position_shift_j
				
			Pawn_black6.direction_of_attack = direction_of_attack
	
	if Pawn_black7 != null and is_instance_valid(Pawn_black7) == true:
		if Pawn_black7.i == defenseur_position_i and Pawn_black7.j == defenseur_position_j:
			Pawn_black7.can_protect_the_king = true
			if Pawn_black7.attacker_position_shift_i == 0 and Pawn_black7.attacker_position_shift_j == 0:
				Pawn_black7.attacker_position_shift_i = attacker_position_shift_i
				Pawn_black7.attacker_position_shift_j = attacker_position_shift_j
			else:
				Pawn_black7.attacker_position_shift2_i = attacker_position_shift_i
				Pawn_black7.attacker_position_shift2_j = attacker_position_shift_j
				
			Pawn_black7.direction_of_attack = direction_of_attack
	
	if Pawn_black8 != null and is_instance_valid(Pawn_black8) == true:
		if Pawn_black8.i == defenseur_position_i and Pawn_black8.j == defenseur_position_j:
			Pawn_black8.can_protect_the_king = true
			if Pawn_black8.attacker_position_shift_i == 0 and Pawn_black8.attacker_position_shift_j == 0:
				Pawn_black8.attacker_position_shift_i = attacker_position_shift_i
				Pawn_black8.attacker_position_shift_j = attacker_position_shift_j
			else:
				Pawn_black8.attacker_position_shift2_i = attacker_position_shift_i
				Pawn_black8.attacker_position_shift2_j = attacker_position_shift_j
				
			Pawn_black8.direction_of_attack = direction_of_attack
	
	if Knight_black != null and is_instance_valid(Knight_black) == true:
		if Knight_black.i == defenseur_position_i and Knight_black.j == defenseur_position_j:
			Knight_black.can_protect_the_king = true
			if Knight_black.attacker_position_shift_i == 0 and Knight_black.attacker_position_shift_j == 0:
				Knight_black.attacker_position_shift_i = attacker_position_shift_i
				Knight_black.attacker_position_shift_j = attacker_position_shift_j
			else:
				Knight_black.attacker_position_shift2_i = attacker_position_shift_i
				Knight_black.attacker_position_shift2_j = attacker_position_shift_j
				
			Knight_black.direction_of_attack = direction_of_attack

	if Knight_black2 != null and is_instance_valid(Knight_black2) == true:
		if Knight_black2.i == defenseur_position_i and Knight_black2.j == defenseur_position_j:
			Knight_black2.can_protect_the_king = true
			if Knight_black2.attacker_position_shift_i == 0 and Knight_black2.attacker_position_shift_j == 0:
				Knight_black2.attacker_position_shift_i = attacker_position_shift_i
				Knight_black2.attacker_position_shift_j = attacker_position_shift_j
			else:
				Knight_black2.attacker_position_shift2_i = attacker_position_shift_i
				Knight_black2.attacker_position_shift2_j = attacker_position_shift_j
				
			Knight_black2.direction_of_attack = direction_of_attack

			
	if Bishop_black != null and is_instance_valid(Bishop_black) == true:
		if Bishop_black.i == defenseur_position_i and Bishop_black.j == defenseur_position_j:
			Bishop_black.can_protect_the_king = true
			if Bishop_black.attacker_position_shift_i == 0 and Bishop_black.attacker_position_shift_j == 0:
				Bishop_black.attacker_position_shift_i = attacker_position_shift_i
				Bishop_black.attacker_position_shift_j = attacker_position_shift_j
			else:
				Bishop_black.attacker_position_shift2_i = attacker_position_shift_i
				Bishop_black.attacker_position_shift2_j = attacker_position_shift_j
				
			Bishop_black.direction_of_attack = direction_of_attack

	if Bishop_black2 != null and is_instance_valid(Bishop_black2) == true:
		if Bishop_black2.i == defenseur_position_i and Bishop_black2.j == defenseur_position_j:
			Bishop_black2.can_protect_the_king = true
			if Bishop_black2.attacker_position_shift_i == 0 and Bishop_black2.attacker_position_shift_j == 0:
				Bishop_black2.attacker_position_shift_i = attacker_position_shift_i
				Bishop_black2.attacker_position_shift_j = attacker_position_shift_j
			else:
				Bishop_black2.attacker_position_shift2_i = attacker_position_shift_i
				Bishop_black2.attacker_position_shift2_j = attacker_position_shift_j
				
			Bishop_black2.direction_of_attack = direction_of_attack

	if Rook_black != null and is_instance_valid(Rook_black) == true:
		if Rook_black.i == defenseur_position_i and Rook_black.j == defenseur_position_j:
			Rook_black.can_protect_the_king = true
			if Rook_black.attacker_position_shift_i == 0 and Rook_black.attacker_position_shift_j == 0:
				Rook_black.attacker_position_shift_i = attacker_position_shift_i
				Rook_black.attacker_position_shift_j = attacker_position_shift_j
			else:
				Rook_black.attacker_position_shift2_i = attacker_position_shift_i
				Rook_black.attacker_position_shift2_j = attacker_position_shift_j
				
			Rook_black.direction_of_attack = direction_of_attack
	
	if Rook_black2 != null and is_instance_valid(Rook_black2) == true:
		if Rook_black2.i == defenseur_position_i and Rook_black2.j == defenseur_position_j:
			Rook_black2.can_protect_the_king = true
			if Rook_black2.attacker_position_shift_i == 0 and Rook_black2.attacker_position_shift_j == 0:
				Rook_black2.attacker_position_shift_i = attacker_position_shift_i
				Rook_black2.attacker_position_shift_j = attacker_position_shift_j
			else:
				Rook_black2.attacker_position_shift2_i = attacker_position_shift_i
				Rook_black2.attacker_position_shift2_j = attacker_position_shift_j
				
			Rook_black2.direction_of_attack = direction_of_attack
	
	if Queen_black != null and is_instance_valid(Queen_black) == true:
		if Queen_black.i == defenseur_position_i and Queen_black.j == defenseur_position_j:
			Queen_black.can_protect_the_king = true
			if Queen_black.attacker_position_shift_i == 0 and Queen_black.attacker_position_shift_j == 0:
				Queen_black.attacker_position_shift_i = attacker_position_shift_i
				Queen_black.attacker_position_shift_j = attacker_position_shift_j
			elif Queen_black.attacker_position_shift2_i == 0 and Queen_black.attacker_position_shift2_j == 0:
				Queen_black.attacker_position_shift2_i = attacker_position_shift_i
				Queen_black.attacker_position_shift2_j = attacker_position_shift_j
			else:
				Queen_black.attacker_position_shift3_i = attacker_position_shift_i
				Queen_black.attacker_position_shift3_j = attacker_position_shift_j
				
			Queen_black.direction_of_attack = direction_of_attack
	
func _on_King_black_checkmate_to_the_king(checkmate):
	if Pawn_white != null and is_instance_valid(Pawn_white):
		Pawn_white.king_in_check = checkmate
	if Pawn_white2 != null and is_instance_valid(Pawn_white2):
		Pawn_white2.king_in_check = checkmate
	if Pawn_white3 != null and is_instance_valid(Pawn_white3):
		Pawn_white3.king_in_check = checkmate
	if Pawn_white4 != null and is_instance_valid(Pawn_white4):
		Pawn_white4.king_in_check = checkmate
	if Pawn_white5 != null and is_instance_valid(Pawn_white5):
		Pawn_white5.king_in_check = checkmate
	if Pawn_white6 != null and is_instance_valid(Pawn_white6):
		Pawn_white6.king_in_check = checkmate
	if Pawn_white7 != null and is_instance_valid(Pawn_white7):
		Pawn_white7.king_in_check = checkmate
	if Pawn_white8 != null and is_instance_valid(Pawn_white8):
		Pawn_white8.king_in_check = checkmate
	if Knight_white != null and is_instance_valid(Knight_white):
		Knight_white.king_in_check = checkmate
	if Knight_white2 != null and is_instance_valid(Knight_white2):
		Knight_white2.king_in_check = checkmate
	if Bishop_white != null and is_instance_valid(Bishop_white):
		Bishop_white.king_in_check = checkmate
	if Bishop_white2 != null and is_instance_valid(Bishop_white2):
		Bishop_white2.king_in_check = checkmate
	if Rook_white != null and is_instance_valid(Rook_white):
		Rook_white.king_in_check = checkmate
	if Rook_white2 != null and is_instance_valid(Rook_white2):
		Rook_white2.king_in_check = checkmate
	if Queen_white != null and is_instance_valid(Queen_white):
		Queen_white.king_in_check = checkmate
	
	if Pawn_black != null and is_instance_valid(Pawn_black):
		Pawn_black.king_in_check = checkmate
	if Pawn_black2 != null and is_instance_valid(Pawn_black2):
		Pawn_black2.king_in_check = checkmate
	if Pawn_black3 != null and is_instance_valid(Pawn_black3):
		Pawn_black3.king_in_check = checkmate
	if Pawn_black4 != null and is_instance_valid(Pawn_black4):
		Pawn_black4.king_in_check = checkmate
	if Pawn_black5 != null and is_instance_valid(Pawn_black5):
		Pawn_black5.king_in_check = checkmate
	if Pawn_black6 != null and is_instance_valid(Pawn_black6):
		Pawn_black6.king_in_check = checkmate
	if Pawn_black7 != null and is_instance_valid(Pawn_black7):
		Pawn_black7.king_in_check = checkmate
	if Pawn_black8 != null and is_instance_valid(Pawn_black8):
		Pawn_black8.king_in_check = checkmate
	if Knight_black != null and is_instance_valid(Knight_black):
		Knight_black.king_in_check = checkmate
	if Knight_black2 != null and is_instance_valid(Knight_black2):
		Knight_black2.king_in_check = checkmate
	if Bishop_black != null and is_instance_valid(Bishop_black):
		Bishop_black.king_in_check = checkmate
	if Bishop_black2 != null and is_instance_valid(Bishop_black2):
		Bishop_black2.king_in_check = checkmate
	if Rook_black != null and is_instance_valid(Rook_black):
		Rook_black.king_in_check = checkmate
	if Rook_black2 != null and is_instance_valid(Rook_black2):
		Rook_black2.king_in_check = checkmate
	if Queen_black != null and is_instance_valid(Queen_black):
		Queen_black.king_in_check = checkmate
			

#Signaux pour la promotion
func variable_for_promotion(i,j,piece_name,new_position_piece_on_the_chessboard):
	piece_promoted = piece_name
	promotion_i = i
	promotion_j = j
	position_piece_on_the_chessboard = new_position_piece_on_the_chessboard

#Ne peut pas changer le script du pion lui-même directement ici car le jeu crash
func _on_Pawn_white_promotion(i,j,piece_name,new_position_piece_on_the_chessboard):
	promotion_white = true
	variable_for_promotion(i,j,piece_name,new_position_piece_on_the_chessboard)

func _on_Pawn_white2_promotion(i,j,piece_name,new_position_piece_on_the_chessboard):
	promotion_white2 = true
	variable_for_promotion(i,j,piece_name,new_position_piece_on_the_chessboard)

func _on_Pawn_white3_promotion(i,j,piece_name,new_position_piece_on_the_chessboard):
	promotion_white3 = true
	variable_for_promotion(i,j,piece_name,new_position_piece_on_the_chessboard)

func _on_Pawn_white4_promotion(i,j,piece_name,new_position_piece_on_the_chessboard):
	promotion_white4 = true
	variable_for_promotion(i,j,piece_name,new_position_piece_on_the_chessboard)

func _on_Pawn_white5_promotion(i,j,piece_name,new_position_piece_on_the_chessboard):
	promotion_white5 = true
	variable_for_promotion(i,j,piece_name,new_position_piece_on_the_chessboard)

func _on_Pawn_white6_promotion(i,j,piece_name,new_position_piece_on_the_chessboard):
	promotion_white6 = true
	variable_for_promotion(i,j,piece_name,new_position_piece_on_the_chessboard)

func _on_Pawn_white7_promotion(i,j,piece_name,new_position_piece_on_the_chessboard):
	promotion_white7 = true
	variable_for_promotion(i,j,piece_name,new_position_piece_on_the_chessboard)

func _on_Pawn_white8_promotion(i,j,piece_name,new_position_piece_on_the_chessboard):
	promotion_white8 = true
	variable_for_promotion(i,j,piece_name,new_position_piece_on_the_chessboard)

func _on_Pawn_black_promotion(i,j,piece_name,new_position_piece_on_the_chessboard):
	promotion_black = true
	variable_for_promotion(i,j,piece_name,new_position_piece_on_the_chessboard)

func _on_Pawn_black2_promotion(i,j,piece_name,new_position_piece_on_the_chessboard):
	promotion_black2 = true
	variable_for_promotion(i,j,piece_name,new_position_piece_on_the_chessboard)

func _on_Pawn_black3_promotion(i,j,piece_name,new_position_piece_on_the_chessboard):
	promotion_black3 = true
	variable_for_promotion(i,j,piece_name,new_position_piece_on_the_chessboard)

func _on_Pawn_black4_promotion(i,j,piece_name,new_position_piece_on_the_chessboard):
	promotion_black4 = true
	variable_for_promotion(i,j,piece_name,new_position_piece_on_the_chessboard)

func _on_Pawn_black5_promotion(i,j,piece_name,new_position_piece_on_the_chessboard):
	promotion_black5 = true
	variable_for_promotion(i,j,piece_name,new_position_piece_on_the_chessboard)

func _on_Pawn_black6_promotion(i,j,piece_name,new_position_piece_on_the_chessboard):
	promotion_black6 = true
	variable_for_promotion(i,j,piece_name,new_position_piece_on_the_chessboard)

func _on_Pawn_black7_promotion(i,j,piece_name,new_position_piece_on_the_chessboard):
	promotion_black7 = true
	variable_for_promotion(i,j,piece_name,new_position_piece_on_the_chessboard)

func _on_Pawn_black8_promotion(i,j,piece_name,new_position_piece_on_the_chessboard):
	promotion_black8 = true
	variable_for_promotion(i,j,piece_name,new_position_piece_on_the_chessboard)

