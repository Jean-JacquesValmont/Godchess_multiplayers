extends Control

var image_pawn = load("res://Image/Pieces/Déesse de la Téléportation/Base pièce doubler - Pion.png")
var image_knight = load("res://Image/Pieces/Déesse de la Téléportation/Base pièce doubler - Cavalier.png")
var image_bishop = load("res://Image/Pieces/Déesse de la Téléportation/Base pièce doubler - Fou.png")
var image_rook = load("res://Image/Pieces/Déesse de la Téléportation/Base pièce doubler - Tour.png")
var image_queen = load("res://Image/Pieces/Déesse de la Téléportation/Base pièce doubler - Reine.png")
var image_king = load("res://Image/Pieces/Déesse de la Téléportation/Base pièce doubler - Roi.png")

var text_passif = "Chaque pièces possèdent sa zone de téléportation. La téléportation est obligatoirement symétrique par rapport à la pièce. Une pièce jouée sur une case comprenant deux zones de téléportation ou plus, la téléportation ne s’effectue pas. Il ne peut y avoir qu’une téléportation au cours d’un mouvement. Les pièces adverses ne peuvent pas activer la téléportation."
var text_pawn = "Zone de téléportation d’une case derrière."
var text_knight = "Quand elle enjambe une pièce active la téléportation"
var text_bishop = "Zone de téléportation en croix."
var text_rook = "Zone de téléportation en diagonale"
var text_queen = "Zone de téléportation tout autour d’elle."
var text_king = "Zone de téléportation de trois cases en losange"

# Called when the node enters the scene tree for the first time.
func _ready():
	$PowerGodsScreenDisplay/SpritePawn.texture = image_pawn
	$PowerGodsScreenDisplay/SpriteKnight.texture = image_knight
	$PowerGodsScreenDisplay/SpriteBishop.texture = image_bishop
	$PowerGodsScreenDisplay/SpriteRook.texture = image_rook
	$PowerGodsScreenDisplay/SpriteQueen.texture = image_queen
	$PowerGodsScreenDisplay/SpriteKing.texture = image_king


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_PassifButton_pressed():
	$PowerGodsScreenDisplay/Description/ExplanationGifPowers.play("Passif")
	$PowerGodsScreenDisplay/Description/ExplanationTextPowers.text = text_passif


func _on_PawnButton_pressed():
	$PowerGodsScreenDisplay/Description/ExplanationGifPowers.play("Pawn")
	$PowerGodsScreenDisplay/Description/ExplanationTextPowers.text = text_pawn


func _on_KnightButton_pressed():
	$PowerGodsScreenDisplay/Description/ExplanationGifPowers.play("Knight")
	$PowerGodsScreenDisplay/Description/ExplanationTextPowers.text = text_knight


func _on_BishopButton_pressed():
	$PowerGodsScreenDisplay/Description/ExplanationGifPowers.play("Bishop")
	$PowerGodsScreenDisplay/Description/ExplanationTextPowers.text = text_bishop


func _on_RookButton_pressed():
	$PowerGodsScreenDisplay/Description/ExplanationGifPowers.play("Rook")
	$PowerGodsScreenDisplay/Description/ExplanationTextPowers.text = text_rook


func _on_QueenButton_pressed():
	$PowerGodsScreenDisplay/Description/ExplanationGifPowers.play("Queen")
	$PowerGodsScreenDisplay/Description/ExplanationTextPowers.text = text_queen


func _on_KingButton_pressed():
	$PowerGodsScreenDisplay/Description/ExplanationGifPowers.play("King")
	$PowerGodsScreenDisplay/Description/ExplanationTextPowers.text = text_king


func _on_PlayAnimated_mouse_entered():
	$PowerGodsScreenDisplay/Description/ExplanationGifPowers.play()


func _on_PlayAnimated_mouse_exited():
	$PowerGodsScreenDisplay/Description/ExplanationGifPowers.stop()
	$PowerGodsScreenDisplay/Description/ExplanationGifPowers.frame = 0


func _on_ExplanationGifPowers_animation_finished():
	$PowerGodsScreenDisplay/Description/ExplanationGifPowers.stop()
	$PowerGodsScreenDisplay/Description/ExplanationGifPowers.frame = 0
