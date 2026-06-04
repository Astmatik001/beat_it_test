extends Node2D


func _ready() -> void:
	$RichTextLabel.push_font_size(64)


func update_score(new_score: int):
	$RichTextLabel.clear()
	$RichTextLabel.push_font_size(64)
	if new_score > 9:
		$RichTextLabel.push_color(Color.GOLD)
	else:
		$RichTextLabel.push_color(Color.ROYAL_BLUE)
	$RichTextLabel.add_text(str(new_score))
