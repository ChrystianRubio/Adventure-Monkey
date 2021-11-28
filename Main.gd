extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):

	$labelBananas/Label.set_text(": " + str($PlayerGood.quantidadeDeBananas))
	$labelVidas/Label.set_text(": " + str($PlayerGood.vidas))
	
	if not $MusicaDeFundo.playing:
		$MusicaDeFundo.play()
	
