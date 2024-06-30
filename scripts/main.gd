extends Sprite2D

var score := [0,0]# 0:Player, 1: CPU
const PADDLE_SPEED : int = 500
@onready var score_sound: AudioStreamPlayer2D = $"score sound"

func _on_ball_timer_timeout() -> void:
	if score[0] == 7:
		$HUD/result.text = "you win"
	elif score[1] == 7:
		$HUD/result.text = "you lose"
	else:
		$Ball.new_ball()


func _on_score_left_body_entered(body: Node2D) -> void:
	score[1] += 1
	$HUD/CPUScore.text = str(score[1])
	$BallTimer.start()
	score_sound.play()

func _on_score_right_body_entered(body: Node2D) -> void:
	score[0] += 1
	$HUD/PlayerScore.text = str(score[0])
	$BallTimer.start()
	score_sound.play()
