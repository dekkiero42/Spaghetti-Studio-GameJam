extends Node

@export var highMoodMusic : AudioStream
@export var midMoodMusic : AudioStream
@export var lowMoodMusic : AudioStream

@onready var musicPlayerOne : AudioStreamPlayer = $MusicPlayer1
@onready var musicPlayerTwo : AudioStreamPlayer = $MusicPlayer2

var currentMusicPlayer : AudioStreamPlayer

@export var moodLevel: float = 1.0

func getCurrentMusic() -> AudioStream:
	if (moodLevel > 1.0 / 3.0 * 2.0):
		return highMoodMusic
	elif (moodLevel > 1.0 / 3.0):
		return midMoodMusic
	else:
		return lowMoodMusic

func playCurrentMusic() -> void:
	var currentMusic = getCurrentMusic()
	currentMusicPlayer.stream = currentMusic
	currentMusicPlayer.play()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentMusicPlayer = musicPlayerOne
	playCurrentMusic()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
