extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RichTextLabel.push_font_size(64)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func update_score(new_score: int):
	$RichTextLabel.clear()
	$RichTextLabel.push_font_size(64)
	if new_score > 9:
		$RichTextLabel.push_color(Color.GOLD)
	else:
		$RichTextLabel.push_color(Color.ROYAL_BLUE)
	$RichTextLabel.add_text(str(new_score))
