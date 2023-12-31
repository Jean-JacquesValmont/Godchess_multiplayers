extends HBoxContainer

onready var name_label := $NameLabel
onready var status_label := $StatusLabel

var status := "" setget set_status

func initialize(_name: String, _status: String = "Connected.", _score: int = 0) -> void:
	name_label.text = _name
	self.status = _status

func set_status(_status: String) -> void:
	status = _status
	status_label.text = status
