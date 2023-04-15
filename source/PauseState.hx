package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.system.FlxSound;

class PauseState extends FlxSubState
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
		//boundingBox = new FlxSprite(200, 50).loadGraphic(AssetPaths.pauseBox__png);
		//boundingBox.screenCenter(XY);
		//boundingBox.antialiasing = true;
		//add(boundingBox);
		
		pauseSound = new FlxSound();
		pauseSound = FlxG.sound.load(AssetPaths.pause__wav);
	}
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.P){
			pauseSound.play();
			PlayState.pauseScreen.visible = false;
			FlxG.sound.music.volume = 1;
			close();
		}
		else if (FlxG.mouse.overlaps(HUD.pauseButton)){
			if(FlxG.mouse.justPressed){
				pauseSound.play();
				PlayState.pauseScreen.visible = false;
				FlxG.sound.music.volume = 1;
				close();
			}
		}
		else if (FlxG.keys.justPressed.ESCAPE){
			PlayState.pauseScreen.visible = false;
			pauseSound.play();
			
			FlxG.camera.fade(FlxColor.BLACK, 1, false, function(){
				FlxG.mouse.visible = true;
				//FlxG.sound.playMusic(AssetPaths.The_Screen_With_The_Title__wav, 1, true);
				FlxG.switchState(new MainMenuState());
			});
		}
	}
}