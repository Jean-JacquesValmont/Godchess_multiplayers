extends Sprite

signal opponent_turned() #Permet de créer son propre signal

var position_piece_on_the_chessboard = \
	[["x","x","x","x","x","x","x","x","x","x","x","x"],
	["x","x","x","x","x","x","x","x","x","x","x","x"],
	["x","x","rook_black","knight_black","bishop_black","queen_black","king_black","bishop_black","knight_black","rook_black","x","x"],
	["x","x","pawn_black","pawn_black","pawn_black","pawn_black","pawn_black","pawn_black","pawn_black","pawn_black","x","x"],
	["x","x","0","0","0","0","0","0","0","0","x","x"],
	["x","x","0","0","0","0","0","0","0","0","x","x"],
	["x","x","0","0","0","0","0","0","0","0","x","x"],
	["x","x","0","0","0","0","0","0","0","0","x","x"],
	["x","x","pawn_white","pawn_white","pawn_white","pawn_white","pawn_white","pawn_white","pawn_white","pawn_white","x","x"],
	["x","x","rook_white","knight_white","bishop_white","queen_white","king_white","bishop_white","knight_white","rook_white","x","x"],
	["x","x","x","x","x","x","x","x","x","x","x","x"],
	["x","x","x","x","x","x","x","x","x","x","x","x"]]
	
var player_in_game
var player_turn = "white"
var piece_select = "No piece selected"
var my_node_id = get_node(".").get_instance_id() #Permet de récupérer l'ID unique du noeud
onready var my_node_name = get_node(".").get_name() #Permet de récupérer le nom du noeud
onready var Sound_piece_move = get_node("Sound_piece_move")
var i = 9 # Le i correspond à l'axe y (de gauche à droite)
var j = 3 # Le j correspond à l'axe x (de haut en bas)
var move_one_square = 100
var king_in_check = false
var can_protect_the_king = false
var piece_protects_against_an_attack = false
var attacker_position_shift_i = 0
var attacker_position_shift_j = 0
var attacker_position_shift2_i = 0
var attacker_position_shift2_j = 0
var direction_of_attack = ""
var direction_attack_protect_king = ""

var update_of_the_protect = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print("ID de ", my_node_name, ": ", my_node_id)
	#Par rapport au nom du noeud récupérer, de lui donner la bonne position dans le tableau
	if my_node_name == "Knight_white":
		i = 9
		j = 3
	elif my_node_name == "Knight_white2":
		i = 9
		j = 8
		
	print("i: ", i)
	print("j: ", j)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_turn == "white" and update_of_the_protect == false:
		verif_piece_protects_against_an_attack_the_king()
		update_of_the_protect = true
		
	elif player_turn == "black":
		update_of_the_protect = false

#Ecoute si un input se produit
func _input(event):
	var mouse_pos = get_local_mouse_position()
	
	if player_in_game != null :
		if player_in_game.keys()[0] == get_tree().get_network_unique_id():
			
			if king_in_check == false:
				#Vérifie si la pièce est sur sa case de départ et si c'est le tour des blancs
				if player_turn == "white":
					
					# Pour sélectionner l'ID unique de la pièce en cliquant dessus
					if event is InputEventMouseButton and event.is_pressed() \
					and event.button_index == BUTTON_LEFT and piece_select == "No piece selected":
						if mouse_pos.x >= 0 and mouse_pos.x <= texture.get_width() \
						and mouse_pos.y >= 0 and mouse_pos.y <= texture.get_height():
							piece_select = my_node_name
							print(piece_select)
						
					# Vérifie si c'est bien le bouton gauche de la souris qui est cliquer
					# et que la pièce sélectionner correspond avec l'ID
					elif event is InputEventMouseButton and event.is_pressed() \
					and event.button_index == BUTTON_LEFT and piece_select == my_node_name:
						
						if piece_protects_against_an_attack == false:
							#Vérifie qu'on clique bien sur la bonne case
							#Déplacement en haut à droite
							if mouse_pos.x >= 0 + move_one_square and mouse_pos.x <= texture.get_width() + move_one_square\
							and mouse_pos.y >= 0 - 2*move_one_square and mouse_pos.y <= texture.get_height() - 2*move_one_square \
							and (position_piece_on_the_chessboard[i-2][j+1] == "0" or position_piece_on_the_chessboard[i-2][j+1] == "pawn_black"\
							or position_piece_on_the_chessboard[i-2][j+1] == "knight_black" or position_piece_on_the_chessboard[i-2][j+1] == "bishop_black"\
							or position_piece_on_the_chessboard[i-2][j+1] == "rook_black" or position_piece_on_the_chessboard[i-2][j+1] == "queen_black"):
								#Bouge la pièce de move_one_square = 100 en y
								var move_piece_y = -2*move_one_square
								var move_piece_x = move_one_square
								move_local_y(move_piece_y)
								move_local_x(move_piece_x)
								#Met à jour la position de la pièce dans le tableau avant déplacement
								position_piece_on_the_chessboard[i][j] = "0"
								i -= 2
								j += 1
								#Met à jour la position de la pièce dans le tableau après déplacement
								position_piece_on_the_chessboard[i][j] = "knight_white"
								# Déselectionne la pièce après le déplacement
								piece_select = "No piece selected"
								get_node("Sound_piece_move").play()
								
								print(piece_select)
								print("i: ", i)
								print("j: ", j)
								print(position_piece_on_the_chessboard)
								#Envoie un signal à la scène plateau_echec pour mettre à jour le tour de toutes les pièces et
								#Et la position dans le tableau.
								rpc("position_update_for_other_players",move_piece_y, move_piece_x, position_piece_on_the_chessboard)
								emit_signal("opponent_turned",position_piece_on_the_chessboard)
								
							#Déplacement en haut à gauche
							elif mouse_pos.x >= 0 - move_one_square and mouse_pos.x <= texture.get_width() - move_one_square\
							and mouse_pos.y >= 0 - 2*move_one_square and mouse_pos.y <= texture.get_height() - 2*move_one_square \
							and (position_piece_on_the_chessboard[i-2][j-1] == "0" or position_piece_on_the_chessboard[i-2][j-1] == "pawn_black"\
							or position_piece_on_the_chessboard[i-2][j-1] == "knight_black" or position_piece_on_the_chessboard[i-2][j-1] == "bishop_black"\
							or position_piece_on_the_chessboard[i-2][j-1] == "rook_black" or position_piece_on_the_chessboard[i-2][j-1] == "queen_black"):
								#Bouge la pièce de move_one_square = 100 en y
								var move_piece_y = -2*move_one_square
								var move_piece_x = -move_one_square
								move_local_y(move_piece_y)
								move_local_x(move_piece_x)
								#Met à jour la position de la pièce dans le tableau avant déplacement
								position_piece_on_the_chessboard[i][j] = "0"
								i -= 2
								j -= 1
								#Met à jour la position de la pièce dans le tableau après déplacement
								position_piece_on_the_chessboard[i][j] = "knight_white"
								# Déselectionne la pièce après le déplacement
								piece_select = "No piece selected"
								get_node("Sound_piece_move").play()
								
								print(piece_select)
								print("i: ", i)
								print("j: ", j)
								print(position_piece_on_the_chessboard)
								#Envoie un signal à la scène plateau_echec pour mettre à jour le tour de toutes les pièces et
								#Et la position dans le tableau.
								rpc("position_update_for_other_players",move_piece_y, move_piece_x, position_piece_on_the_chessboard)
								emit_signal("opponent_turned",position_piece_on_the_chessboard)
							
							#Déplacement vers la droite en haut
							elif mouse_pos.x >= 0 + 2*move_one_square and mouse_pos.x <= texture.get_width() + 2*move_one_square\
							and mouse_pos.y >= 0 - move_one_square and mouse_pos.y <= texture.get_height() - move_one_square \
							and (position_piece_on_the_chessboard[i-1][j+2] == "0" or position_piece_on_the_chessboard[i-1][j+2] == "pawn_black"\
							or position_piece_on_the_chessboard[i-1][j+2] == "knight_black" or position_piece_on_the_chessboard[i-1][j+2] == "bishop_black"\
							or position_piece_on_the_chessboard[i-1][j+2] == "rook_black" or position_piece_on_the_chessboard[i-1][j+2] == "queen_black"):
								#Bouge la pièce de move_one_square = 100 en y
								var move_piece_y = -move_one_square
								var move_piece_x = 2*move_one_square
								move_local_y(move_piece_y)
								move_local_x(move_piece_x)
								#Met à jour la position de la pièce dans le tableau avant déplacement
								position_piece_on_the_chessboard[i][j] = "0"
								i -= 1
								j += 2
								#Met à jour la position de la pièce dans le tableau après déplacement
								position_piece_on_the_chessboard[i][j] = "knight_white"
								# Déselectionne la pièce après le déplacement
								piece_select = "No piece selected"
								get_node("Sound_piece_move").play()
								
								print(piece_select)
								print("i: ", i)
								print("j: ", j)
								print(position_piece_on_the_chessboard)
								#Envoie un signal à la scène plateau_echec pour mettre à jour le tour de toutes les pièces et
								#Et la position dans le tableau.
								rpc("position_update_for_other_players",move_piece_y, move_piece_x, position_piece_on_the_chessboard)
								emit_signal("opponent_turned",position_piece_on_the_chessboard)
								
							#Déplacement vers la droite en bas
							elif mouse_pos.x >= 0 + 2*move_one_square and mouse_pos.x <= texture.get_width() + 2*move_one_square\
							and mouse_pos.y >= 0 + move_one_square and mouse_pos.y <= texture.get_height() + move_one_square \
							and (position_piece_on_the_chessboard[i+1][j+2] == "0" or position_piece_on_the_chessboard[i+1][j+2] == "pawn_black"\
							or position_piece_on_the_chessboard[i+1][j+2] == "knight_black" or position_piece_on_the_chessboard[i+1][j+2] == "bishop_black"\
							or position_piece_on_the_chessboard[i+1][j+2] == "rook_black" or position_piece_on_the_chessboard[i+1][j+2] == "queen_black"):
								#Bouge la pièce de move_one_square = 100 en y
								var move_piece_y = move_one_square
								var move_piece_x = 2*move_one_square
								move_local_y(move_piece_y)
								move_local_x(move_piece_x)
								#Met à jour la position de la pièce dans le tableau avant déplacement
								position_piece_on_the_chessboard[i][j] = "0"
								i += 1
								j += 2
								#Met à jour la position de la pièce dans le tableau après déplacement
								position_piece_on_the_chessboard[i][j] = "knight_white"
								# Déselectionne la pièce après le déplacement
								piece_select = "No piece selected"
								get_node("Sound_piece_move").play()
								
								print(piece_select)
								print("i: ", i)
								print("j: ", j)
								print(position_piece_on_the_chessboard)
								#Envoie un signal à la scène plateau_echec pour mettre à jour le tour de toutes les pièces et
								#Et la position dans le tableau.
								rpc("position_update_for_other_players",move_piece_y, move_piece_x, position_piece_on_the_chessboard)
								emit_signal("opponent_turned",position_piece_on_the_chessboard)
								
							#Déplacement en bas à droite
							elif mouse_pos.x >= 0 + move_one_square and mouse_pos.x <= texture.get_width() + move_one_square\
							and mouse_pos.y >= 0 + 2*move_one_square and mouse_pos.y <= texture.get_height() + 2*move_one_square \
							and (position_piece_on_the_chessboard[i+2][j+1] == "0" or position_piece_on_the_chessboard[i+2][j+1] == "pawn_black"\
							or position_piece_on_the_chessboard[i+2][j+1] == "knight_black" or position_piece_on_the_chessboard[i+2][j+1] == "bishop_black"\
							or position_piece_on_the_chessboard[i+2][j+1] == "rook_black" or position_piece_on_the_chessboard[i+2][j+1] == "queen_black"):
								#Bouge la pièce de move_one_square = 100 en y
								var move_piece_y = 2*move_one_square
								var move_piece_x = move_one_square
								move_local_y(move_piece_y)
								move_local_x(move_piece_x)
								#Met à jour la position de la pièce dans le tableau avant déplacement
								position_piece_on_the_chessboard[i][j] = "0"
								i += 2
								j += 1
								#Met à jour la position de la pièce dans le tableau après déplacement
								position_piece_on_the_chessboard[i][j] = "knight_white"
								# Déselectionne la pièce après le déplacement
								piece_select = "No piece selected"
								get_node("Sound_piece_move").play()
								
								print(piece_select)
								print("i: ", i)
								print("j: ", j)
								print(position_piece_on_the_chessboard)
								#Envoie un signal à la scène plateau_echec pour mettre à jour le tour de toutes les pièces et
								#Et la position dans le tableau.
								rpc("position_update_for_other_players",move_piece_y, move_piece_x, position_piece_on_the_chessboard)
								emit_signal("opponent_turned",position_piece_on_the_chessboard)
								
							#Déplacement en bas à gauche
							elif mouse_pos.x >= 0 - move_one_square and mouse_pos.x <= texture.get_width() - move_one_square\
							and mouse_pos.y >= 0 + 2*move_one_square and mouse_pos.y <= texture.get_height() + 2*move_one_square \
							and (position_piece_on_the_chessboard[i+2][j-1] == "0" or position_piece_on_the_chessboard[i+2][j-1] == "pawn_black"\
							or position_piece_on_the_chessboard[i+2][j-1] == "knight_black" or position_piece_on_the_chessboard[i+2][j-1] == "bishop_black"\
							or position_piece_on_the_chessboard[i+2][j-1] == "rook_black" or position_piece_on_the_chessboard[i+2][j-1] == "queen_black"):
								#Bouge la pièce de move_one_square = 100 en y
								var move_piece_y = 2*move_one_square
								var move_piece_x = -move_one_square
								move_local_y(move_piece_y)
								move_local_x(move_piece_x)
								#Met à jour la position de la pièce dans le tableau avant déplacement
								position_piece_on_the_chessboard[i][j] = "0"
								i += 2
								j -= 1
								#Met à jour la position de la pièce dans le tableau après déplacement
								position_piece_on_the_chessboard[i][j] = "knight_white"
								# Déselectionne la pièce après le déplacement
								piece_select = "No piece selected"
								get_node("Sound_piece_move").play()
								
								print(piece_select)
								print("i: ", i)
								print("j: ", j)
								print(position_piece_on_the_chessboard)
								#Envoie un signal à la scène plateau_echec pour mettre à jour le tour de toutes les pièces et
								#Et la position dans le tableau.
								rpc("position_update_for_other_players",move_piece_y, move_piece_x, position_piece_on_the_chessboard)
								emit_signal("opponent_turned",position_piece_on_the_chessboard)
								
							#Déplacement vers la gauche en haut
							elif mouse_pos.x >= 0 - 2*move_one_square and mouse_pos.x <= texture.get_width() - 2*move_one_square\
							and mouse_pos.y >= 0 - move_one_square and mouse_pos.y <= texture.get_height() - move_one_square \
							and (position_piece_on_the_chessboard[i-1][j-2] == "0" or position_piece_on_the_chessboard[i-1][j-2] == "pawn_black"\
							or position_piece_on_the_chessboard[i-1][j-2] == "knight_black" or position_piece_on_the_chessboard[i-1][j-2] == "bishop_black"\
							or position_piece_on_the_chessboard[i-1][j-2] == "rook_black" or position_piece_on_the_chessboard[i-1][j-2] == "queen_black"):
								#Bouge la pièce de move_one_square = 100 en y
								var move_piece_y = -move_one_square
								var move_piece_x = -2*move_one_square
								move_local_y(move_piece_y)
								move_local_x(move_piece_x)
								#Met à jour la position de la pièce dans le tableau avant déplacement
								position_piece_on_the_chessboard[i][j] = "0"
								i -= 1
								j -= 2
								#Met à jour la position de la pièce dans le tableau après déplacement
								position_piece_on_the_chessboard[i][j] = "knight_white"
								# Déselectionne la pièce après le déplacement
								piece_select = "No piece selected"
								get_node("Sound_piece_move").play()
								
								print(piece_select)
								print("i: ", i)
								print("j: ", j)
								print(position_piece_on_the_chessboard)
								
								#Envoie un signal à la scène plateau_echec pour mettre à jour le tour de toutes les pièces et
								#Et la position dans le tableau.
								rpc("position_update_for_other_players",move_piece_y, move_piece_x, position_piece_on_the_chessboard)
								emit_signal("opponent_turned",position_piece_on_the_chessboard)
								
							#Déplacement vers la gauche en bas
							elif mouse_pos.x >= 0 - 2*move_one_square and mouse_pos.x <= texture.get_width() - 2*move_one_square\
							and mouse_pos.y >= 0 + move_one_square and mouse_pos.y <= texture.get_height() + move_one_square \
							and (position_piece_on_the_chessboard[i+1][j-2] == "0" or position_piece_on_the_chessboard[i+1][j-2] == "pawn_black"\
							or position_piece_on_the_chessboard[i+1][j-2] == "knight_black" or position_piece_on_the_chessboard[i+1][j-2] == "bishop_black"\
							or position_piece_on_the_chessboard[i+1][j-2] == "rook_black" or position_piece_on_the_chessboard[i+1][j-2] == "queen_black"):
								#Bouge la pièce de move_one_square = 100 en y
								var move_piece_y = move_one_square
								var move_piece_x = -2*move_one_square
								move_local_y(move_piece_y)
								move_local_x(move_piece_x)
								#Met à jour la position de la pièce dans le tableau avant déplacement
								position_piece_on_the_chessboard[i][j] = "0"
								i += 1
								j -= 2
								#Met à jour la position de la pièce dans le tableau après déplacement
								position_piece_on_the_chessboard[i][j] = "knight_white"
								# Déselectionne la pièce après le déplacement
								piece_select = "No piece selected"
								get_node("Sound_piece_move").play()
								
								print(piece_select)
								print("i: ", i)
								print("j: ", j)
								print(position_piece_on_the_chessboard)
								#Envoie un signal à la scène plateau_echec pour mettre à jour le tour de toutes les pièces et
								#Et la position dans le tableau.
								rpc("position_update_for_other_players",move_piece_y, move_piece_x, position_piece_on_the_chessboard)
								emit_signal("opponent_turned",position_piece_on_the_chessboard)
							
							else:
								piece_select = "No piece selected"
								print(piece_select)
								
						elif piece_protects_against_an_attack == true:
							piece_select = "No piece selected"
							print(piece_select)
							
			elif king_in_check == true and can_protect_the_king == true:
				#Vérifie si la pièce est sur sa case de départ et si c'est le tour des blancs
				if player_turn == "white":
					
					# Pour sélectionner l'ID unique de la pièce en cliquant dessus
					if event is InputEventMouseButton and event.is_pressed() \
					and event.button_index == BUTTON_LEFT and piece_select == "No piece selected":
						if mouse_pos.x >= 0 and mouse_pos.x <= texture.get_width() \
						and mouse_pos.y >= 0 and mouse_pos.y <= texture.get_height():
							piece_select = my_node_name
							print(piece_select)
							
							print("attacker_position_shift_i: ",attacker_position_shift_i)
							print("attacker_position_shift_j: ",attacker_position_shift_j)
							print("position x: ",(attacker_position_shift_j - j) * 100)
							print("position y: ",(attacker_position_shift_i - i) * 100)
							
							print("attacker_position_shift2_i: ",attacker_position_shift2_i)
							print("attacker_position_shift2_j: ",attacker_position_shift2_j)
							print("position x: ",(attacker_position_shift2_j - j) * 100)
							print("position y: ",(attacker_position_shift2_i - i) * 100)
							
							print("direction_of_attack: ", direction_of_attack)
						
					# Vérifie si c'est bien le bouton gauche de la souris qui est cliquer
					# et que la pièce sélectionner correspond avec l'ID
					elif event is InputEventMouseButton and event.is_pressed() \
					and event.button_index == BUTTON_LEFT and piece_select == my_node_name:
						
						if piece_protects_against_an_attack == false:
							#Vérifie qu'on clique bien sur la bonne case
							#Déplacement en haut à droite
							if mouse_pos.x >= (attacker_position_shift_j - j) * 100 and mouse_pos.x <= (attacker_position_shift_j - j) * 100 + move_one_square\
							and mouse_pos.y >= (attacker_position_shift_i - i) * 100 and mouse_pos.y <= (attacker_position_shift_i - i) * 100 + move_one_square \
							and (position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] == "0" or position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] == "pawn_black"\
							or position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] == "knight_black" or position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] == "bishop_black"\
							or position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] == "rook_black" or position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] == "queen_black"):
								#Bouge la pièce de move_one_square = 100 en y
								var move_piece_y = (attacker_position_shift_i - i) * 100
								var move_piece_x = (attacker_position_shift_j - j) * 100
								move_local_y(move_piece_y)
								move_local_x(move_piece_x)
								#Met à jour la position de la pièce dans le tableau avant déplacement
								position_piece_on_the_chessboard[i][j] = "0"
								i = attacker_position_shift_i
								j = attacker_position_shift_j
								#Met à jour la position de la pièce dans le tableau après déplacement
								position_piece_on_the_chessboard[i][j] = "knight_white"
								
								attacker_position_shift_i = 0
								attacker_position_shift_j = 0
								attacker_position_shift2_i = 0
								attacker_position_shift2_j = 0
								# Déselectionne la pièce après le déplacement
								piece_select = "No piece selected"
								get_node("Sound_piece_move").play()
								
								print(piece_select)
								print("i: ", i)
								print("j: ", j)
								print(position_piece_on_the_chessboard)
								#Envoie un signal à la scène plateau_echec pour mettre à jour le tour de toutes les pièces et
								#Et la position dans le tableau.
								rpc("position_update_for_other_players",move_piece_y, move_piece_x, position_piece_on_the_chessboard)
								emit_signal("opponent_turned",position_piece_on_the_chessboard)
								
							else:
								piece_select = "No piece selected"
								print(piece_select)
							###############################################################################################
							###############################################################################################
							###############################################################################################
							#Seconde case à protéger si elle existe
							#Déplacement en haut à droite
							if mouse_pos.x >= (attacker_position_shift2_j - j) * 100 and mouse_pos.x <= (attacker_position_shift2_j - j) * 100 + move_one_square\
							and mouse_pos.y >= (attacker_position_shift2_i - i) * 100 and mouse_pos.y <= (attacker_position_shift2_i - i) * 100 + move_one_square \
							and (position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] == "0" or position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] == "pawn_black"\
							or position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] == "knight_black" or position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] == "bishop_black"\
							or position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] == "rook_black" or position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] == "queen_black"):
								#Bouge la pièce de move_one_square = 100 en y
								var move_piece_y = (attacker_position_shift2_i - i) * 100
								var move_piece_x = (attacker_position_shift2_j - j) * 100
								move_local_y(move_piece_y)
								move_local_x(move_piece_x)
								#Met à jour la position de la pièce dans le tableau avant déplacement
								position_piece_on_the_chessboard[i][j] = "0"
								i = attacker_position_shift2_i
								j = attacker_position_shift2_j
								#Met à jour la position de la pièce dans le tableau après déplacement
								position_piece_on_the_chessboard[i][j] = "knight_white"
								
								attacker_position_shift_i = 0
								attacker_position_shift_j = 0
								attacker_position_shift2_i = 0
								attacker_position_shift2_j = 0
								# Déselectionne la pièce après le déplacement
								piece_select = "No piece selected"
								get_node("Sound_piece_move").play()
								
								print(piece_select)
								print("i: ", i)
								print("j: ", j)
								print(position_piece_on_the_chessboard)
								#Envoie un signal à la scène plateau_echec pour mettre à jour le tour de toutes les pièces et
								#Et la position dans le tableau.
								rpc("position_update_for_other_players",move_piece_y, move_piece_x, position_piece_on_the_chessboard)
								emit_signal("opponent_turned",position_piece_on_the_chessboard)
								
							else:
								piece_select = "No piece selected"
								print(piece_select)
								
						elif piece_protects_against_an_attack == true:
							piece_select = "No piece selected"
							print(piece_select)
							
		#	if Global.preview_piece_move_option == true:
		#		if my_node_name != null:
		#			preview_move()

func preview_move():
	#Pré-visualisation des mouvements de la pièce
#	get_child()
	var Move_Preview = get_node("Move_preview")
	if piece_select == my_node_name and king_in_check == false and piece_protects_against_an_attack == false:
		#Déplacement en haut à droite
		if position_piece_on_the_chessboard[i-2][j+1] == "0":
			Move_Preview.get_node("Knight_white_preview_move").visible = true
		elif (position_piece_on_the_chessboard[i-2][j+1] == "pawn_black"\
		or position_piece_on_the_chessboard[i-2][j+1] == "knight_black" or position_piece_on_the_chessboard[i-2][j+1] == "bishop_black"\
		or position_piece_on_the_chessboard[i-2][j+1] == "rook_black" or position_piece_on_the_chessboard[i-2][j+1] == "queen_black"):
			Move_Preview.get_node("Square_attack_preview").visible = true
			
		#Déplacement en haut à gauche
		if position_piece_on_the_chessboard[i-2][j-1] == "0":
			Move_Preview.get_node("Knight_white_preview_move2").visible = true
		elif (position_piece_on_the_chessboard[i-2][j-1] == "pawn_black"\
		or position_piece_on_the_chessboard[i-2][j-1] == "knight_black" or position_piece_on_the_chessboard[i-2][j-1] == "bishop_black"\
		or position_piece_on_the_chessboard[i-2][j-1] == "rook_black" or position_piece_on_the_chessboard[i-2][j-1] == "queen_black"):
			Move_Preview.get_node("Square_attack_preview2").visible = true
			
		#Déplacement vers la droite en haut
		if position_piece_on_the_chessboard[i-1][j+2] == "0":
			Move_Preview.get_node("Knight_white_preview_move3").visible = true
		elif (position_piece_on_the_chessboard[i+1][j+2] == "pawn_black"\
		or position_piece_on_the_chessboard[i-1][j+2] == "knight_black" or position_piece_on_the_chessboard[i-1][j+2] == "bishop_black"\
		or position_piece_on_the_chessboard[i-1][j+2] == "rook_black" or position_piece_on_the_chessboard[i-1][j+2] == "queen_black"):
			Move_Preview.get_node("Square_attack_preview3").visible = true
			
		#Déplacement vers la droite en bas
		if position_piece_on_the_chessboard[i+1][j+2] == "0":
			Move_Preview.get_node("Knight_white_preview_move4").visible = true
		elif (position_piece_on_the_chessboard[i+1][j+2] == "pawn_black"\
		or position_piece_on_the_chessboard[i+1][j+2] == "knight_black" or position_piece_on_the_chessboard[i+1][j+2] == "bishop_black"\
		or position_piece_on_the_chessboard[i+1][j+2] == "rook_black" or position_piece_on_the_chessboard[i+1][j+2] == "queen_black"):
			Move_Preview.get_node("Square_attack_preview4").visible = true
			
		#Déplacement en bas à droite
		if position_piece_on_the_chessboard[i+2][j+1] == "0":
			Move_Preview.get_node("Knight_white_preview_move5").visible = true
		elif (position_piece_on_the_chessboard[i+2][j+1] == "pawn_black"\
		or position_piece_on_the_chessboard[i+2][j+1] == "knight_black" or position_piece_on_the_chessboard[i+2][j+1] == "bishop_black"\
		or position_piece_on_the_chessboard[i+2][j+1] == "rook_black" or position_piece_on_the_chessboard[i+2][j+1] == "queen_black"):
			Move_Preview.get_node("Square_attack_preview5").visible = true
			
		#Déplacement en bas à gauche
		if position_piece_on_the_chessboard[i+2][j-1] == "0":
			Move_Preview.get_node("Knight_white_preview_move6").visible = true
		elif (position_piece_on_the_chessboard[i+2][j-1] == "pawn_black"\
		or position_piece_on_the_chessboard[i+2][j-1] == "knight_black" or position_piece_on_the_chessboard[i+2][j-1] == "bishop_black"\
		or position_piece_on_the_chessboard[i+2][j-1] == "rook_black" or position_piece_on_the_chessboard[i+2][j-1] == "queen_black"):
			Move_Preview.get_node("Square_attack_preview6").visible = true
			
		#Déplacement vers la gauche en haut
		if position_piece_on_the_chessboard[i-1][j-2] == "0":
			Move_Preview.get_node("Knight_white_preview_move7").visible = true
		elif (position_piece_on_the_chessboard[i-1][j-2] == "pawn_black"\
		or position_piece_on_the_chessboard[i-1][j-2] == "knight_black" or position_piece_on_the_chessboard[i-1][j-2] == "bishop_black"\
		or position_piece_on_the_chessboard[i-1][j-2] == "rook_black" or position_piece_on_the_chessboard[i-1][j-2] == "queen_black"):
			Move_Preview.get_node("Square_attack_preview7").visible = true
			
		#Déplacement vers la gauche en bas
		if position_piece_on_the_chessboard[i+1][j-2] == "0":
			Move_Preview.get_node("Knight_white_preview_move8").visible = true
		elif (position_piece_on_the_chessboard[i+1][j-2] == "pawn_black"\
		or position_piece_on_the_chessboard[i+1][j-2] == "knight_black" or position_piece_on_the_chessboard[i+1][j-2] == "bishop_black"\
		or position_piece_on_the_chessboard[i+1][j-2] == "rook_black" or position_piece_on_the_chessboard[i+1][j-2] == "queen_black"):
			Move_Preview.get_node("Square_attack_preview8").visible = true
			
	elif piece_select == my_node_name and king_in_check == true and piece_protects_against_an_attack == false:
		if position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] == "0"\
		and Move_Preview.get_node("Knight_white_preview_move").position.y == (attacker_position_shift_i - i) * 100\
		and Move_Preview.get_node("Knight_white_preview_move").position.x == (attacker_position_shift_j - j) * 100:
			Move_Preview.get_node("Knight_white_preview_move").visible = true
		elif position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] != "0"\
		and Move_Preview.get_node("Square_attack_preview").position.y == (attacker_position_shift_i - i) * 100\
		and Move_Preview.get_node("Square_attack_preview").position.x == (attacker_position_shift_j - j) * 100:
			Move_Preview.get_node("Square_attack_preview").visible = true
			
		if position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] == "0"\
		and Move_Preview.get_node("Knight_white_preview_move2").position.y == (attacker_position_shift_i - i) * 100\
		and Move_Preview.get_node("Knight_white_preview_move2").position.x == (attacker_position_shift_j - j) * 100:
			Move_Preview.get_node("Knight_white_preview_move2").visible = true
		elif position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] != "0"\
		and Move_Preview.get_node("Square_attack_preview2").position.y == (attacker_position_shift_i - i) * 100\
		and Move_Preview.get_node("Square_attack_preview2").position.x == (attacker_position_shift_j - j) * 100:
			Move_Preview.get_node("Square_attack_preview2").visible = true
		
		if position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] == "0"\
		and Move_Preview.get_node("Knight_white_preview_move3").position.y == (attacker_position_shift_i - i) * 100\
		and Move_Preview.get_node("Knight_white_preview_move3").position.x == (attacker_position_shift_j - j) * 100:
			Move_Preview.get_node("Knight_white_preview_move3").visible = true
		elif position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] != "0"\
		and Move_Preview.get_node("Square_attack_preview3").position.y == (attacker_position_shift_i - i) * 100\
		and Move_Preview.get_node("Square_attack_preview3").position.x == (attacker_position_shift_j - j) * 100:
			Move_Preview.get_node("Square_attack_preview3").visible = true
		
		if position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] == "0"\
		and Move_Preview.get_node("Knight_white_preview_move4").position.y == (attacker_position_shift_i - i) * 100\
		and Move_Preview.get_node("Knight_white_preview_move4").position.x == (attacker_position_shift_j - j) * 100:
			Move_Preview.get_node("Knight_white_preview_move4").visible = true
		elif position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] != "0"\
		and Move_Preview.get_node("Square_attack_preview4").position.y == (attacker_position_shift_i - i) * 100\
		and Move_Preview.get_node("Square_attack_preview4").position.x == (attacker_position_shift_j - j) * 100:
			Move_Preview.get_node("Square_attack_preview4").visible = true
			
		if position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] == "0"\
		and Move_Preview.get_node("Knight_white_preview_move5").position.y == (attacker_position_shift_i - i) * 100\
		and Move_Preview.get_node("Knight_white_preview_move5").position.x == (attacker_position_shift_j - j) * 100:
			Move_Preview.get_node("Knight_white_preview_move5").visible = true
		elif position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] != "0"\
		and Move_Preview.get_node("Square_attack_preview5").position.y == (attacker_position_shift_i - i) * 100\
		and Move_Preview.get_node("Square_attack_preview5").position.x == (attacker_position_shift_j - j) * 100:
			Move_Preview.get_node("Square_attack_preview5").visible = true
			
		if position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] == "0"\
		and Move_Preview.get_node("Knight_white_preview_move6").position.y == (attacker_position_shift_i - i) * 100\
		and Move_Preview.get_node("Knight_white_preview_move6").position.x == (attacker_position_shift_j - j) * 100:
			Move_Preview.get_node("Knight_white_preview_move6").visible = true
		elif position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] != "0"\
		and Move_Preview.get_node("Square_attack_preview6").position.y == (attacker_position_shift_i - i) * 100\
		and Move_Preview.get_node("Square_attack_preview6").position.x == (attacker_position_shift_j - j) * 100:
			Move_Preview.get_node("Square_attack_preview6").visible = true
			
		if position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] == "0"\
		and Move_Preview.get_node("Knight_white_preview_move7").position.y == (attacker_position_shift_i - i) * 100\
		and Move_Preview.get_node("Knight_white_preview_move7").position.x == (attacker_position_shift_j - j) * 100:
			Move_Preview.get_node("Knight_white_preview_move7").visible = true
		elif position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] != "0"\
		and Move_Preview.get_node("Square_attack_preview7").position.y == (attacker_position_shift_i - i) * 100\
		and Move_Preview.get_node("Square_attack_preview7").position.x == (attacker_position_shift_j - j) * 100:
			Move_Preview.get_node("Square_attack_preview7").visible = true
		
		if position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] == "0"\
		and Move_Preview.get_node("Knight_white_preview_move8").position.y == (attacker_position_shift_i - i) * 100\
		and Move_Preview.get_node("Knight_white_preview_move8").position.x == (attacker_position_shift_j - j) * 100:
			Move_Preview.get_node("Knight_white_preview_move8").visible = true
		elif position_piece_on_the_chessboard[attacker_position_shift_i][attacker_position_shift_j] != "0"\
		and Move_Preview.get_node("Square_attack_preview8").position.y == (attacker_position_shift_i - i) * 100\
		and Move_Preview.get_node("Square_attack_preview8").position.x == (attacker_position_shift_j - j) * 100:
			Move_Preview.get_node("Square_attack_preview8").visible = true
			
		############################################################################################################
		############################################################################################################
		
		if position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] == "0"\
		and Move_Preview.get_node("Knight_white_preview_move").position.y == (attacker_position_shift2_i - i) * 100\
		and Move_Preview.get_node("Knight_white_preview_move").position.x == (attacker_position_shift2_j - j) * 100:
			Move_Preview.get_node("Knight_white_preview_move").visible = true
		elif position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] != "0"\
		and Move_Preview.get_node("Square_attack_preview").position.y == (attacker_position_shift2_i - i) * 100\
		and Move_Preview.get_node("Square_attack_preview").position.x == (attacker_position_shift2_j - j) * 100:
			Move_Preview.get_node("Square_attack_preview").visible = true
			
		if position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] == "0"\
		and Move_Preview.get_node("Knight_white_preview_move2").position.y == (attacker_position_shift2_i - i) * 100\
		and Move_Preview.get_node("Knight_white_preview_move2").position.x == (attacker_position_shift2_j - j) * 100:
			Move_Preview.get_node("Knight_white_preview_move2").visible = true
		elif position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] != "0"\
		and Move_Preview.get_node("Square_attack_preview2").position.y == (attacker_position_shift2_i - i) * 100\
		and Move_Preview.get_node("Square_attack_preview2").position.x == (attacker_position_shift2_j - j) * 100:
			Move_Preview.get_node("Square_attack_preview2").visible = true
		
		if position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] == "0"\
		and Move_Preview.get_node("Knight_white_preview_move3").position.y == (attacker_position_shift2_i - i) * 100\
		and Move_Preview.get_node("Knight_white_preview_move3").position.x == (attacker_position_shift2_j - j) * 100:
			Move_Preview.get_node("Knight_white_preview_move3").visible = true
		elif position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] != "0"\
		and Move_Preview.get_node("Square_attack_preview3").position.y == (attacker_position_shift2_i - i) * 100\
		and Move_Preview.get_node("Square_attack_preview3").position.x == (attacker_position_shift2_j - j) * 100:
			Move_Preview.get_node("Square_attack_preview3").visible = true
		
		if position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] == "0"\
		and Move_Preview.get_node("Knight_white_preview_move4").position.y == (attacker_position_shift2_i - i) * 100\
		and Move_Preview.get_node("Knight_white_preview_move4").position.x == (attacker_position_shift2_j - j) * 100:
			Move_Preview.get_node("Knight_white_preview_move4").visible = true
		elif position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] != "0"\
		and Move_Preview.get_node("Square_attack_preview4").position.y == (attacker_position_shift2_i - i) * 100\
		and Move_Preview.get_node("Square_attack_preview4").position.x == (attacker_position_shift2_j - j) * 100:
			Move_Preview.get_node("Square_attack_preview4").visible = true
			
		if position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] == "0"\
		and Move_Preview.get_node("Knight_white_preview_move5").position.y == (attacker_position_shift2_i - i) * 100\
		and Move_Preview.get_node("Knight_white_preview_move5").position.x == (attacker_position_shift2_j - j) * 100:
			Move_Preview.get_node("Knight_white_preview_move5").visible = true
		elif position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] != "0"\
		and Move_Preview.get_node("Square_attack_preview5").position.y == (attacker_position_shift2_i - i) * 100\
		and Move_Preview.get_node("Square_attack_preview5").position.x == (attacker_position_shift2_j - j) * 100:
			Move_Preview.get_node("Square_attack_preview5").visible = true
			
		if position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] == "0"\
		and Move_Preview.get_node("Knight_white_preview_move6").position.y == (attacker_position_shift2_i - i) * 100\
		and Move_Preview.get_node("Knight_white_preview_move6").position.x == (attacker_position_shift2_j - j) * 100:
			Move_Preview.get_node("Knight_white_preview_move6").visible = true
		elif position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] != "0"\
		and Move_Preview.get_node("Square_attack_preview6").position.y == (attacker_position_shift2_i - i) * 100\
		and Move_Preview.get_node("Square_attack_preview6").position.x == (attacker_position_shift2_j - j) * 100:
			Move_Preview.get_node("Square_attack_preview6").visible = true
			
		if position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] == "0"\
		and Move_Preview.get_node("Knight_white_preview_move7").position.y == (attacker_position_shift2_i - i) * 100\
		and Move_Preview.get_node("Knight_white_preview_move7").position.x == (attacker_position_shift2_j - j) * 100:
			Move_Preview.get_node("Knight_white_preview_move7").visible = true
		elif position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] != "0"\
		and Move_Preview.get_node("Square_attack_preview7").position.y == (attacker_position_shift2_i - i) * 100\
		and Move_Preview.get_node("Square_attack_preview7").position.x == (attacker_position_shift2_j - j) * 100:
			Move_Preview.get_node("Square_attack_preview7").visible = true
		
		if position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] == "0"\
		and Move_Preview.get_node("Knight_white_preview_move8").position.y == (attacker_position_shift2_i - i) * 100\
		and Move_Preview.get_node("Knight_white_preview_move8").position.x == (attacker_position_shift2_j - j) * 100:
			Move_Preview.get_node("Knight_white_preview_move8").visible = true
		elif position_piece_on_the_chessboard[attacker_position_shift2_i][attacker_position_shift2_j] != "0"\
		and Move_Preview.get_node("Square_attack_preview8").position.y == (attacker_position_shift2_i - i) * 100\
		and Move_Preview.get_node("Square_attack_preview8").position.x == (attacker_position_shift2_j - j) * 100:
			Move_Preview.get_node("Square_attack_preview8").visible = true
		
	else:
		preview_no_move_valable()

func preview_no_move_valable():
	var Move_Preview = get_node("Move_preview")
	Move_Preview.get_node("Knight_white_preview_move").visible = false
	Move_Preview.get_node("Square_attack_preview").visible = false
	Move_Preview.get_node("Knight_white_preview_move2").visible = false
	Move_Preview.get_node("Square_attack_preview2").visible = false
	Move_Preview.get_node("Knight_white_preview_move3").visible = false
	Move_Preview.get_node("Square_attack_preview3").visible = false
	Move_Preview.get_node("Knight_white_preview_move4").visible = false
	Move_Preview.get_node("Square_attack_preview4").visible = false
	Move_Preview.get_node("Knight_white_preview_move5").visible = false
	Move_Preview.get_node("Square_attack_preview5").visible = false
	Move_Preview.get_node("Knight_white_preview_move6").visible = false
	Move_Preview.get_node("Square_attack_preview6").visible = false
	Move_Preview.get_node("Knight_white_preview_move7").visible = false
	Move_Preview.get_node("Square_attack_preview7").visible = false
	Move_Preview.get_node("Knight_white_preview_move8").visible = false
	Move_Preview.get_node("Square_attack_preview8").visible = false

func verif_piece_protects_against_an_attack_the_king():
	#On regarde d'où vient l'attaque
	#Lignes
	#Vers le haut
	for f in range(1,9):
		if position_piece_on_the_chessboard[i-f][j] == "x":
			break
		elif position_piece_on_the_chessboard[i-f][j] != "0":
			
			if position_piece_on_the_chessboard[i-f][j] == "rook_black"\
			or position_piece_on_the_chessboard[i-f][j] == "queen_black":
				direction_attack_protect_king = "Haut"
				break
			else:
				break
	#Vers le bas
	for f in range(1,9):
		if position_piece_on_the_chessboard[i+f][j] == "x":
			break
		elif position_piece_on_the_chessboard[i+f][j] != "0":
			
			if position_piece_on_the_chessboard[i+f][j] == "rook_black"\
			or position_piece_on_the_chessboard[i+f][j] == "queen_black":
				direction_attack_protect_king = "Bas"
				break
			else:
				break
	#Vers la droite
	for f in range(1,9):
		if position_piece_on_the_chessboard[i][j+f] == "x":
			break
		elif position_piece_on_the_chessboard[i][j+f] != "0":
			
			if position_piece_on_the_chessboard[i][j+f] == "rook_black"\
			or position_piece_on_the_chessboard[i][j+f] == "queen_black":
				direction_attack_protect_king = "Droite"
				break
			else:
				break
	#Vers la gauche
	for f in range(1,9):
		if position_piece_on_the_chessboard[i][j-f] == "x":
			break
		elif position_piece_on_the_chessboard[i][j-f] != "0":
			
			if position_piece_on_the_chessboard[i][j-f] == "rook_black"\
			or position_piece_on_the_chessboard[i][j-f] == "queen_black":
				direction_attack_protect_king = "Gauche"
				break
			else:
				break
	#Diagonales
	#Vers le haut à droite
	for f in range(1,9):
		if position_piece_on_the_chessboard[i-f][j+f] == "x":
			break
		elif position_piece_on_the_chessboard[i-f][j+f] != "0":
			
			if position_piece_on_the_chessboard[i-f][j+f] == "bishop_black"\
			or position_piece_on_the_chessboard[i-f][j+f] == "queen_black":
				direction_attack_protect_king = "Haut/Droite"
				break
			else:
				break
	#Vers le haut à gauche
	for f in range(1,9):
		if position_piece_on_the_chessboard[i-f][j-f] == "x":
			break
		elif position_piece_on_the_chessboard[i-f][j-f] != "0":
			
			if position_piece_on_the_chessboard[i-f][j-f] == "bishop_black"\
			or position_piece_on_the_chessboard[i-f][j-f] == "queen_black":
				direction_attack_protect_king = "Haut/Gauche"
				break
			else:
				break
	#Vers le bas à droite
	for f in range(1,9):
		if position_piece_on_the_chessboard[i+f][j+f] == "x":
			break
		elif position_piece_on_the_chessboard[i+f][j+f] != "0":
			
			if position_piece_on_the_chessboard[i+f][j+f] == "bishop_black"\
			or position_piece_on_the_chessboard[i+f][j+f] == "queen_black":
				direction_attack_protect_king = "Bas/Droite"
				break
			else:
				break
	#Vers le bas à gauche
	for f in range(1,9):
		if position_piece_on_the_chessboard[i+f][j-f] == "x":
			break
		elif position_piece_on_the_chessboard[i+f][j-f] != "0":
			
			if position_piece_on_the_chessboard[i+f][j-f] == "bishop_black"\
			or position_piece_on_the_chessboard[i+f][j-f] == "queen_black":
				direction_attack_protect_king = "Bas/Gauche"
				break
			else:
				break
	
	#Ensuite, on regarde si le roi est derrière la pièce
	#qui le protège de l'attaque qui vient dans cette direction
	if direction_attack_protect_king == "Haut":
		#On cherche vers le bas
		for f in range(1,9):
			if position_piece_on_the_chessboard[i+f][j] == "x":
				break
			elif position_piece_on_the_chessboard[i+f][j] != "0":
				
				if position_piece_on_the_chessboard[i+f][j] == "king_white":
					piece_protects_against_an_attack = true
					break
				else:
					break
	elif direction_attack_protect_king == "Bas":
		#On cherche vers le haut
		for f in range(1,9):
			if position_piece_on_the_chessboard[i-f][j] == "x":
				break
			elif position_piece_on_the_chessboard[i-f][j] != "0":
				
				if position_piece_on_the_chessboard[i-f][j] == "king_white":
					piece_protects_against_an_attack = true
					break
				else:
					break
	elif direction_attack_protect_king == "Droite":
		#On cherche vers la gauche
		for f in range(1,9):
			if position_piece_on_the_chessboard[i][j-f] == "x":
				break
			elif position_piece_on_the_chessboard[i][j-f] != "0":
				
				if position_piece_on_the_chessboard[i][j-f] == "king_white":
					piece_protects_against_an_attack = true
					break
				else:
					break
	elif direction_attack_protect_king == "Gauche":
		#On cherche vers la droite
		for f in range(1,9):
			if position_piece_on_the_chessboard[i][j+f] == "x":
				break
			elif position_piece_on_the_chessboard[i][j+f] != "0":
				
				if position_piece_on_the_chessboard[i][j+f] == "king_white":
					piece_protects_against_an_attack = true
					break
				else:
					break
	elif direction_attack_protect_king == "Haut/Droite":
		#On cherche vers le Bas/Gauche
		for f in range(1,9):
			if position_piece_on_the_chessboard[i+f][j-f] == "x":
				break
			elif position_piece_on_the_chessboard[i+f][j-f] != "0":
				
				if position_piece_on_the_chessboard[i+f][j-f] == "king_white":
					piece_protects_against_an_attack = true
					break
				else:
					break
	elif direction_attack_protect_king == "Haut/Gauche":
		#On cherche vers le Bas/Droite
		for f in range(1,9):
			if position_piece_on_the_chessboard[i+f][j+f] == "x":
				break
			elif position_piece_on_the_chessboard[i+f][j+f] != "0":
				
				if position_piece_on_the_chessboard[i+f][j+f] == "king_white":
					piece_protects_against_an_attack = true
					break
				else:
					break
	elif direction_attack_protect_king == "Bas/Droite":
		#On cherche vers le Haut/Gauche
		for f in range(1,9):
			if position_piece_on_the_chessboard[i-f][j-f] == "x":
				break
			elif position_piece_on_the_chessboard[i-f][j-f] != "0":
				
				if position_piece_on_the_chessboard[i-f][j-f] == "king_white":
					piece_protects_against_an_attack = true
					break
				else:
					break
	elif direction_attack_protect_king == "Bas/Gauche":
		#On cherche vers le Haut/Droite
		for f in range(1,9):
			if position_piece_on_the_chessboard[i-f][j+f] == "x":
				break
			elif position_piece_on_the_chessboard[i-f][j+f] != "0":
				
				if position_piece_on_the_chessboard[i-f][j+f] == "king_white":
					piece_protects_against_an_attack = true
					break
				else:
					break
					
func _on_Area2D_area_entered(area):
	if player_turn == "black":
		get_node("/root/Main/MatchGame/BoardGame/" + area.get_parent().get_name()).queue_free()
		print("piece pris: ",area.get_parent().get_name())

remote func position_update_for_other_players(move_piece_y, move_piece_x, position_piece_on_the_chessboard):
	move_local_y(move_piece_y)
	move_local_x(move_piece_x)
	emit_signal("opponent_turned",position_piece_on_the_chessboard)
