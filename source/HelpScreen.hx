package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.system.FlxSound;

class HelpScreen extends FlxSubState
{
	var pauseSound:FlxSound;
	var boundingBox:FlxSprite;
	public function new()
	{
		super(0x61000000);
	}
	override public function create()
	{
		super.create();
		pauseSound = new FlxSound();
		pauseSound = FlxG.sound.load(AssetPaths.pause__wav);
	}
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.H){
			pauseSound.play();
			PlayState.helpScreen.visible = false;
			FlxG.sound.music.volume = 1;
			close();
		}
		else if (FlxG.mouse.overlaps(HUD.helpButton)){
			if(FlxG.mouse.justPressed){
				pauseSound.play();
				PlayState.helpScreen.visible = false;
				FlxG.sound.music.volume = 1;
				close();
			}
		}
	}
}