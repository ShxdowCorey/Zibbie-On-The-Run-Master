package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;
import flixel.system.FlxSound;

class WinState extends FlxState
{
	var titleScreen:FlxButton;
	var selectSound:FlxSound;
	var you_win:FlxSprite;
	var finalS:FlxText;
	override public function create(){
		winScreen();
		makeButtons();
		
		selectSound = new FlxSound();
		selectSound = FlxG.sound.load(AssetPaths.select__wav);
	}
	function winScreen(){
		FlxG.mouse.visible = true;
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		FlxG.sound.playMusic(AssetPaths.Win__wav, 1, false);
		
		
	}
	function makeButtons(){
		titleScreen = new FlxButton(439.6, 463.9, "", goBack);
		titleScreen.loadGraphic(AssetPaths.title_screen_button__png);
		add(titleScreen);
	}
	function goBack(){
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
			Variables.killCount = 0;
			PlayState.curLevel = 'lvl1';
				
			FlxG.switchState(new TitleState());
		});
	}
	override function update(elapsed:Float){
		super.update(elapsed);
	}
}