extends Node2D

var level = null
onready var in_game = $InGame
onready var camera = $Camera2D
var player = null
#onready var coin_label: Label = $CanvasLayer/Coin_Label
#var coins_value = 1

	
func _ready():
	add_level()
	listen_for_coins()
	connect_to_tubes()
	check_for_tube()
	put_camera_on_player()
	#update_coin_label()
	
	
func add_level():
	level = load(str("res://Levels/Level",G.next_level_number,".tscn")).instance()
	in_game.add_child(level)
	
	player = level.find_node("Player")
	
	
func put_camera_on_player():
	remove_child(camera)
	player.add_child(camera)
	
func connect_to_tubes():
	for child in level.find_node("Objects").get_children():
		if child.name.begins_with("Tube"):
			child.connect("enter_door",self, "_on_enter_tube")
			
			
func check_for_tube():
	if G.next_level_tube != null:
		var tube = level.find_node(G.next_level_tube)
		player.position = tube.position
		G.next_level_tube = null

func _on_enter_tube():
	get_tree().reload_current_scene()
	
func listen_for_coins():
	var coins = get_tree().get_nodes_in_group("coin")
	for coin in coins:
		coin.connect("on_collect", self, "on_coin_collected")
		

#func on_coin_collected(value):
#	coins_value += value
	#update_coin_label()
	
#func update_coin_label():
	#coin_label.text = str("Coins:", coins_value)
