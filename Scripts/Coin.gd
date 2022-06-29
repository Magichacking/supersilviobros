extends Area2D
class_name Coin

signal on_collect

var value = 1
onready var coincollect = $CollectCoin



func _on_Coin_body_entered(body):
	emit_signal("on_collect",value)
	coincollect.play(true)
	queue_free()
