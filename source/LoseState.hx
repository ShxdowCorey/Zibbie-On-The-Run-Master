package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;
import flixel.system.FlxSound;

class LoseState extends FlxState
{
	var bg:FlxSprite;
	var you_lose:FlxText;
	var retry:FlxButton;
	var titleScreen:FlxButton;
	var gameOver:FlxSprite;
	var selectSound:FlxSound;
	
	override public function create(){
		loseScreen();
		makeButtons();
		
		selectSound = new FlxSound();
		selectSound = FlxG.sound.load(AssetPaths.select__wav);
	}
	function loseScreen(){
		FlxG.mouse.visible = true;
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		final screen = new FlxSprite(0, 0).loadGraphic(AssetPaths.lose_screen__png); add(screen);
		if(PlayState.curLevel == 'lvl1' || PlayState.curLevel == 'lvl2' || PlayState.curLevel == 'lvl3' || PlayState.curLevel == 'lvl4' || PlayState.curLevel == 'boss'){
			FlxG.sound.playMusic(AssetPaths.GameOver_1__wav, 1, false);
		}
		else if(PlayState.curLevel == 'lvl5' || PlayState.curLevel == 'lvl6' || PlayState.curLevel == 'lvl7' || PlayState.curLevel == 'lvl8' || PlayState.curLevel == 'boss2'){
			FlxG.sound.playMusic(AssetPaths.GameOver_2__wav, 1, false);
		}
		else if(PlayState.curLevel == 'lvl9' || PlayState.curLevel == 'lvl10' || PlayState.curLevel == 'lvl11' || PlayState.curLevel == 'lvl12' || PlayState.curLevel == 'boss3'){
			FlxG.sound.playMusic(AssetPaths.GameOver_3__wav, 1, false);
		}
	}
	function makeButtons(){
		retry = new FlxButton(175, 550, "", retryFunc);
		retry.loadGraphic(AssetPaths.continue_button__png);
		add(retry);
		
		titleScreen = new FlxButton(815, 550, "", goBack);
		titleScreen.loadGraphic(AssetPaths.title_screen_button__png);
		add(titleScreen);
	}
	function retryFunc(){
		selectSound.play();
		FlxG.sound.music.stop();
		FlxG.camera.fade(FlxColor.BLACK, 1, false, function(){
			Variables.diamonds = 0;
			Variables.lives = 4;
			Variables.coins = 0;
			Variables.score = 0;
			Variables.bullets = 0;
			Variables.generators = 0;
			Variables.wrenches = 0;
			Variables.health = 5;
			Variables.silverCoins = 0;
				
			FlxG.switchState(new PlayState());
		});
	}
	function goBack(){
		FlxG.camera.fade(FlxColor.BLACK, 1, false, function(){
			PlayState.resetVariables();
			Variables.lives = 5;
			FlxG.switchState(new TitleState());
		});
	}
	override function update(elapsed:Float){
		super.update(elapsed);
	}
}