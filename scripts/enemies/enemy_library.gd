extends Node

enum enemies {
	DRAGON,
}

var enemy_scenes = {
	enemies.DRAGON: "res://scenes/enemies/dragon.tscn"
}

func random_enemy() -> String:
	return enemy_scenes[Global.rng.randi_range(0, len(enemies) - 1)]
