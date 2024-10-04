extends Area2D

var levelno = 1
var nextlevelno = 2

func _ready():
	add_to_group("doorR")



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		await get_tree().create_timer(1).timeout
		load_n_unload()

func load_n_unload():
	# Add the next level
	var next_level_resource = load("res://Levels/level" + str(nextlevelno) + ".tscn")
	var next_level = next_level_resource.instantiate()
	get_node("/root/Root").add_child(next_level)
	print("part 2 done")
	
	# Remove the current level
	var level = get_node("/root/Root/Level" + str(levelno))
	get_node("/root/Root").remove_child(level)
	level.call_deferred("free")
	print("part 1 done")