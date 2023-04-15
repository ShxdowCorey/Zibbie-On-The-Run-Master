package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.system.FlxSound;

import io.newgrounds.NG;

class SecretState extends FlxState
{
	var selectSound:FlxSound;
	
	var continueButton:FlxButton;
	var titleScreenButton:FlxButton;
	override public function create(){
		loadSounds();
		startSecretState();
	}
	function loadSounds(){
		selectSound = new FlxSound();
		selectSound = FlxG.sound.load(AssetPaths.select__wav);
	}
	function startSecretState(){
		FlxG.mouse.visible = true;
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		
		final screen = new FlxSprite(0, 0).loadGraphic(AssetPaths.secret_state__png); add(screen);
		
		continueButton = new FlxButton(150, 510, "", goBackToGame);
		continueButton.loadGraphic(AssetPaths.continue_button__png); add(continueButton);
		
		titleScreenButton = new FlxButton(880, 510, "", goToTitleScreen);
		titleScreenButton.loadGraphic(AssetPaths.title_screen_button__png); add(titleScreenButton);
	}
	function goBackToGame(){
		FlxG.camera.fade(FlxColor.BLACK, 1, false, function(){
			PlayState.resetVariables();
			PlayState.curLevel = 'lvl9';
			FlxG.switchState(new PlayState());
		});
	}
	function goToTitleScreen(){
		FlxG.camera.fade(FlxColor.BLACK, 1, false, function(){
			PlayState.resetVariables();
			PlayState.curLevel = 'lvl1';
			FlxG.switchState(new TitleState());
		});
	}
	override public function update(elapsed:Float){
		super.update(elapsed);
	}
}