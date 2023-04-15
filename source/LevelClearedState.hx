package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import flixel.text.FlxText;
import flixel.system.FlxSound;

class LevelClearedState extends FlxState
{
	var bg1:FlxSprite;
	var bg2:FlxSprite;
	var next:FlxButton;
	var levelCom:FlxSprite;
	var cloudsMoving:Bool = true;
	
	var finalScore:FlxText;
	
	var message:FlxText;
	var messages:Array<String> = ["NICE!!!", "AWESOME!", "EPIC!", "AMAZING!", "INCREDIBLE!", "EXCELLENT!"];
	override public function create(){
		loadSounds();
		startLevelState();
	}
	function loadSounds(){
		
	}
	function startLevelState(){
		FlxG.mouse.visible = true;
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		FlxG.sound.playMusic(AssetPaths.Win__wav, 1, false);
		bg1 = new FlxSprite(0, 0).loadGraphic(AssetPaths.skyBG_full__png); add(bg1); bg1.alpha = 0.9;
		bg2 = new FlxSprite( -1280, 0).loadGraphic(AssetPaths.skyBG_full__png); add(bg2); bg2.alpha = 0.9;
		
		levelCom = new FlxSprite(150, 85).loadGraphic(AssetPaths.level_complete__png); add(levelCom);
		
		finalScore = new FlxText(263, 240, 0, "FINAL SCORE: " + Variables.score + "!");
		finalScore.setFormat(AssetPaths.pixel__ttf);
		finalScore.color = FlxColor.WHITE;
		finalScore.size = 50;
		add(finalScore);
		
		message = new FlxText(547.3, 346, 0, messages[FlxG.random.int(0, 5)]);
		message.setFormat(AssetPaths.pixel__ttf);
		message.color = FlxColor.WHITE;
		message.screenCenter(X);
		message.size = 50;
		add(message);
		
		next = new FlxButton(1070, 570, "", nextLevel);
		next.loadGraphic(AssetPaths.right_arrow__png);
		add(next);
	}
	function config(){
		if (Variables.FreeplayMode == false){
			FlxG.mouse.visible = false;
			FlxG.switchState(new PlayState());
		}else{
			if (Variables.FreeplayMode == true){
				Variables.FreeplayMode = false;
			}
			FlxG.sound.music.stop();
			FlxG.mouse.visible = true;
			FlxG.sound.playMusic(AssetPaths.The_Screen_With_The_Title__wav, 1, true);
			FlxG.switchState(new FreeplayState());
		}
	}
	function nextLevel(){
		FlxG.camera.fade(FlxColor.BLACK, 1, false, function(){
			PlayState.resetVariables();
			config();
		});
	}
	function updateBG(){
		if(cloudsMoving == true){
			bg1.x += 1;
			bg2.x += 1;
		}
		
		if (bg2.x == 0){
			cloudsMoving = false;
			
			bg1.x = 0;
			bg2.x = -1280;
			cloudsMoving = true;
		}
	}
	override public function update(elapsed:Float){
		super.update(elapsed);
		updateBG();
		message.screenCenter(X);
		finalScore.text = "FINAL SCORE: " + Variables.score + "!";
	}
}