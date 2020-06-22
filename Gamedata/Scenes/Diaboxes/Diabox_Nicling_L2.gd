extends Control

onready var dialog_index=0
onready var dialog=["Schnell Ingling",
 "Suche mir letzten verstreuten Raketenteile, damit wir von diesem Planeten runter kommen."]
onready var dialog_index2=0
onready var dialog2=["Du hast nun alle Teile", "Lass uns schnell los fliegen, dann kommen wir noch pünklich zu DGD"]

onready var finished=false
var score =0

func _ready():
	visible = false
	#print(dialog)
	#$RichTextLabel.bbcode_text = "Hallo Ingling."
	
func _process(delta):
		
		if Input.is_action_just_pressed("ui_accept"):
			load_dialog()
	
func load_dialog():
	print("hmm",dialog)
	if dialog_index < dialog.size() and score<3 :
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible=0
		$Tween.interpolate_property(
			$RichTextLabel,"percent_visible",
			0,1,1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
		)
		$Tween.start()
		dialog_index+=1
	elif dialog_index2 < dialog2.size() and score==5 :
		$RichTextLabel.bbcode_text = dialog2[dialog_index2]
		$RichTextLabel.percent_visible=0
		$Tween.interpolate_property(
			$RichTextLabel,"percent_visible",
			0,1,1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
		)
		$Tween.start()
		dialog_index2+=1
	else:
		#queue_free()
		close()
func close():
	visible = false

func open(x):
	score=x
	grab_focus()
	visible = true
	print(score)
	if dialog_index ==0 or score==5:
		load_dialog()
	
