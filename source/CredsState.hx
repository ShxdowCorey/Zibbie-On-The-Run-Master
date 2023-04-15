package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;
import flixel.system.FlxSound;

class CredsState extends FlxState
{
	var counter:Int = 0;
	var selectSound:FlxSound;
	var creditScreen:FlxSprite;
	var moving:Bool = true;
	override public function create(){
		loadSounds();
		
		credsScreen();
	}
	function loadSounds(){
	}
	function credsScreen(){
		//FlxG.mouse.visible = true;
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		FlxG.sound.playMusic(AssetPaths.The_End__wav, 1, false);
		creditScreen = new FlxSprite(0, 720).loadGraphic(AssetPaths.credits__png); add(creditScreen);
	}
	override function update(elapsed:Float){
		super.update(elapsed);
		counter++;
		
		if (moving == true){
			creditScreen.y -= 1;
		}
		if (creditScreen.y == 0){
			moving = false;
		}
		if (counter >= 1400){
			FlxG.camera.fade(FlxColor.BLACK, 2, false, function(){
				FlxG.switchState(new TitleState());
			});
		}
	}
}