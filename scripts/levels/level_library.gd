extends Node

enum levels{
	TEST,
	BATTLE_LEVEL,
}

var level_scenes = {
	levels.TEST: "res://scenes/levels/test_level.tscn",
	levels.BATTLE_LEVEL: "res://scenes/levels/battle_level.tscn",
}
