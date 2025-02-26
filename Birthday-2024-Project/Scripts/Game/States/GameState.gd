class_name GameState
extends Node2D

var manager: GameManager

func next_puzzle(skipConfirm : bool = true):
	if skipConfirm:
		manager.myScreen.ScreenEnter.connect(SkipConfirmation)
		manager.myScreen.ShowConfirmationPopup("Skip Level", "Do you want to skip to the next level?", "Yes", "No")
	else:
		manager.go_to_next_level()
		
func SkipConfirmation():
	manager.myScreen.ScreenEnter.disconnect(SkipConfirmation)
	if manager.myScreen.transitionData[ConfirmationPopupController.RESPONSE_KEY]:
		manager.go_to_next_level()

func reset_puzzle():
	manager.myScreen.ScreenEnter.connect(ResetConfirmation)
	manager.myScreen.ShowConfirmationPopup("Restart", "Clear pieces and restart from the beginning?", "Yes", "No")
	
func ResetConfirmation():
	manager.myScreen.ScreenEnter.disconnect(ResetConfirmation)
	if manager.myScreen.transitionData[ConfirmationPopupController.RESPONSE_KEY]:
		_reset_puzzle()

func _reset_puzzle():
	manager.grid.ReloadLevel()

func back_to_level_select(askConfirm : bool = true):
	if askConfirm:
		manager.myScreen.ScreenEnter.connect(BackToMenuConfirmation)
		manager.myScreen.ShowConfirmationPopup("Level Select", "Go back to Level Select?", "Yes", "No")
	else:
		manager.go_to_level_select()
		
func BackToMenuConfirmation():
	manager.myScreen.ScreenEnter.disconnect(BackToMenuConfirmation)
	if manager.myScreen.transitionData[ConfirmationPopupController.RESPONSE_KEY]:
		manager.go_to_level_select()

func exit_game():
	manager.myScreen.ExitApplication()

func set_manager(manager: GameManager):
	self.manager = manager

func enter_state():
	pass

func exit_state():
	pass

func update_state():
	pass

