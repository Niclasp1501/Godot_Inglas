extends Control


onready var dialog=["Halllo Ingling",
 "Suche mir die verstreuten Raketenteile, damit wir von diesem Planeten runter kommen.","Du solltes mir zunächst 5 Teile bringen, damit ich schon mal anfangen kann."]

onready var dialog_index=0
onready var finished=false


func _ready():
	visible = false
	#print(dialog)
	#$RichTextLabel.bbcode_text = "Hallo Ingling."
	
func _process(delta):
		
		if Input.is_action_just_pressed("ui_accept"):
			load_dialog()
	
func load_dialog():
	print("hmm",dialog)
	if dialog_index < dialog.size():
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible=0
		$Tween.interpolate_property(
			$RichTextLabel,"percent_visible",
			0,1,1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		#queue_free()
		close()
	dialog_index+=1

func close():
	visible = false

func open():
	grab_focus()
	visible = true
	if dialog_index ==0:
		load_dialog()
	
