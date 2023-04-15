package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.system.FlxSound;

class HTPState extends FlxState
{
	var bg:FlxSprite;
	var backButton:FlxButton;
	var htp:FlxSprite;
	var selectSound:FlxSound;
	override public function create()
	{
		htpScreen();
		
		selectSound = new FlxSound();
		selectSound = FlxG.sound.load(AssetPaths.select__wav);
	}
	function htpScreen(){
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		bg = new FlxSprite(0, 0).loadGraphic(AssetPaths.htpScreen__png); add(bg);
	}
	override public function update(elapsed:Float){
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.BACKSPACE){
			selectSound.play();
			FlxG.camera.fade(FlxColor.BLACK, 1, false, function(){
				FlxG.sound.music.stop();
				FlxG.switchState(new MainMenuState());
			});
		}
	}
}