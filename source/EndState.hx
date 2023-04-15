package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;
import flixel.system.FlxSound;

import io.newgrounds.NG;

class EndState extends FlxState
{
	var counter:Int = 0;
	var selectSound:FlxSound;
	var endScreen:FlxSprite;
	
	var winSound:FlxSound;
	
	override public function create(){
		loadSounds();
		
		ending();
	}
	function loadSounds(){
		winSound = new FlxSound();
		winSound = FlxG.sound.load(AssetPaths.Win__wav);
	}
	function ending(){
		counter = 0;
		winSound.play();
		//FlxG.mouse.visible = true;
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		//FlxG.sound.music.persist = true;
		
		//FlxG.sound.playMusic(AssetPaths.The_End__wav, 1, false);
		endScreen = new FlxSprite(0, 0).loadGraphic(AssetPaths.end_state__png); add(endScreen);
	}
	override function update(elapsed:Float){
		super.update(elapsed);
		counter++;
		if (counter >= 250){
			//FlxG.sound.playMusic(AssetPaths.The_End__wav, 1, false);
		}
		if (counter >= 650){
			FlxG.camera.fade(FlxColor.BLACK, 1.5, false, function(){
				
				FlxG.switchState(new CredsState());
			});
		}
	}
}