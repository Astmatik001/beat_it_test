extends Node

enum levels{
	TEST,
	TEST_CHOOSER,
	BATTLE_LEVEL,
}

var level_scenes = {
	levels.TEST: "res://scenes/levels/test_level.tscn",
	levels.BATTLE_LEVEL: "res://scenes/levels/battle_level.tscn",
	levels.TEST_CHOOSER: "res://scenes/levels/test_item_chooser.tscn"
}
