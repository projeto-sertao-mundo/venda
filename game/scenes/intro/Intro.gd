extends Node2D

var display_boy_outside = true
var display_whirlwind_animation = true

func hidden_boy_outside():
	display_boy_outside = false

func hidden_whirlwind_animation():
	display_whirlwind_animation = false

func reset_game():
	display_boy_outside = true
	display_whirlwind_animation = true
