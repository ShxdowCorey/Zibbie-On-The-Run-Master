package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.system.FlxSound;

class FreeplayState3 extends FlxState
{
	var curLevelName:FlxText;
	var curSelectedScore:Int;
	
	var curSelected:Int = 1;
	var curSelectedWorld:Int = 1;
	
	var bg1:FlxSprite;
	var bg2:FlxSprite;
	
	var outerBox:FlxSprite;
	
	var ground:FlxSprite;
	var left_arrow:FlxSprite;
	
	var selectSound:FlxSound;
	var scrollSound:FlxSound;
	
	var cloudsMoving:Bool = true;
	override public function create(){
		loadSounds();
		startFreeplayState();
	}
	function loadSounds(){
		selectSound = new FlxSound();
		selectSound = FlxG.sound.load(AssetPaths.select__wav);
		
		scrollSound = new FlxSound();
		scrollSound = FlxG.sound.load(AssetPaths.scroll__wav);
	}
	function startFreeplayState(){
		//FlxG.camera.fade(FlxColor.WHITE, 1, true);
		bg1 = new FlxSprite(0, 0).loadGraphic(AssetPaths.skyBG_full__png); add(bg1);
		bg2 = new FlxSprite( -1280, 0).loadGraphic(AssetPaths.skyBG_full__png); add(bg2);
		
		final one = new FlxSprite(91, 285).loadGraphic('assets/images/Freeplay_stuff/1.png'); add(one);
		final two = new FlxSprite(334, 285).loadGraphic('assets/images/Freeplay_stuff/2.png'); add(two);
		final three = new FlxSprite(574, 285).loadGraphic('assets/images/Freeplay_stuff/3.png'); add(three);
		final four = new FlxSprite(812, 285).loadGraphic('assets/images/Freeplay_stuff/4.png'); add(four);
		final boss = new FlxSprite(1050, 285).loadGraphic('assets/images/Freeplay_stuff/boss.png'); add(boss);
		
		outerBox = new FlxSprite(64, 260).loadGraphic(AssetPaths.outer_box__png); add(outerBox);
		
		left_arrow = new FlxSprite(20, 600).loadGraphic(AssetPaths.left_arrow__png); 
		ground = new FlxSprite(0, 0).loadGraphic(AssetPaths.world3Ground__png); add(ground);
		add(left_arrow);
		
		curLevelName = new FlxText(50, 72, 0, "FAHRENBYTE");
		curLevelName.setFormat(AssetPaths.pixel__ttf);
		curLevelName.color = FlxColor.BLACK;
		curLevelName.size = 60;
		add(curLevelName);
	}
	function updateState(){
		if (FlxG.keys.justPressed.BACKSPACE){
			FlxG.camera.fade(FlxColor.BLACK, 1, false, function(){
				FlxG.switchState(new MainMenuState());
			});
		}
		if (curSelected == 1){
			curLevelName.text = "FAHRENBYTE";
		}
		else if (curSelected == 2){
			curLevelName.text = "FROZEN FIELDS";
		}
		else if (curSelected == 3){
			curLevelName.text = "GOODNESS GLACIERS";
		}
		else if (curSelected == 4){
			curLevelName.text = "HOME STRETCH";
		}
		else if (curSelected == 5){
			curLevelName.text = "ARGERECHER";
		}
		
		//scoreText.text = "SCORE: " + curSelectedScore;
	}
	function updateRightKey(){
		if (curSelected == 1){
			outerBox.setPosition(64, 260);
			if (FlxG.keys.anyJustPressed([RIGHT])){
				curSelected = 2;
				scrollSound.play(true);
				outerBox.setPosition(305, 260);
				curLevelName.text = "FROZEN FIELDS";
			}
		}
		else if (curSelected == 2){
			outerBox.setPosition(305, 260);
			if (FlxG.keys.anyJustPressed([RIGHT])){
				curSelected = 3;
				scrollSound.play(true);
				outerBox.setPosition(545, 260);
				curLevelName.text = "GOODNESS GLACIERS";
			}
		}
		else if (curSelected == 3){
			outerBox.setPosition(545, 260);
			if (FlxG.keys.anyJustPressed([RIGHT])){
				curSelected = 4;
				scrollSound.play(true);
				outerBox.setPosition(785, 260);
				curLevelName.text = "HOME STRETCH";
			}
		}
		else if (curSelected == 4){
			outerBox.setPosition(785, 260);
			if (FlxG.keys.anyJustPressed([RIGHT])){
				curSelected = 5;
				scrollSound.play(true);
				outerBox.setPosition(1025, 260);
				curLevelName.text = "ARGERECHER";
			}
		}
		else if (curSelected == 5){
			outerBox.setPosition(1025, 260);
			if (FlxG.keys.anyJustPressed([RIGHT])){
				curSelected = 1;
				scrollSound.play(true);
				outerBox.setPosition(64, 260);
				curLevelName.text = "FAHRENBYTE";
			}
		}
	}
	function updateLeftKey(){
		if (curSelected == 1){
			outerBox.setPosition(64, 260);
			if (FlxG.keys.anyJustPressed([LEFT])){
				curSelected = 5;
				scrollSound.play(true);
				outerBox.setPosition(1025, 260);
				curLevelName.text = "ARGERECHER";
			}
		}
		else if (curSelected == 5){
			outerBox.setPosition(1025, 260);
			if (FlxG.keys.anyJustPressed([LEFT])){
				curSelected = 4;
				scrollSound.play(true);
				outerBox.setPosition(785, 260);
				curLevelName.text = "HOME STRETCH";
			}
		}
		else if (curSelected == 4){
			outerBox.setPosition(785, 260);
			if (FlxG.keys.anyJustPressed([LEFT])){
				curSelected = 3;
				scrollSound.play(true);
				outerBox.setPosition(545, 260);
				curLevelName.text = "GOODNESS GLACIERS";
			}
		}
		else if (curSelected == 3){
			outerBox.setPosition(545, 260);
			if (FlxG.keys.anyJustPressed([LEFT])){
				curSelected = 2;
				scrollSound.play(true);
				outerBox.setPosition(305, 260);
				curLevelName.text = "FROZEN FIELDS";
			}
		}
		else if (curSelected == 2){
			outerBox.setPosition(305, 260);
			if (FlxG.keys.anyJustPressed([LEFT])){
				curSelected = 1;
				scrollSound.play(true);
				outerBox.setPosition(64, 260);
				curLevelName.text = "FAHRENBYTE";
			}
		}
	}
	
	function updateOptions(){
		if (FlxG.keys.anyJustPressed([ENTER, SPACE])){
			if (curSelected == 1){
				FlxG.camera.fade(FlxColor.WHITE, 1, false, function(){
					//selectSound.play();
					FlxG.sound.music.stop();
					PlayState.curLevel = 'lvl9';
					Variables.FreeplayMode = true;
					FlxG.switchState(new PlayState());
				});
			}
			else if (curSelected == 2){
				if(Scores.unlockedLvl2 == true){
					FlxG.camera.fade(FlxColor.BLACK, 1, false, function(){
						//selectSound.play();
						FlxG.sound.music.stop();
						PlayState.curLevel = 'lvl10';
						Variables.FreeplayMode = true;
						FlxG.switchState(new PlayState());
					});
				}
			}
			else if (curSelected == 3){
				if(Scores.unlockedLvl3 == true){
					FlxG.camera.fade(FlxColor.BLACK, 1, false, function(){
						//selectSound.play();
						FlxG.sound.music.stop();
						PlayState.curLevel = 'lvl11';
						Variables.FreeplayMode = true;
						FlxG.switchState(new PlayState());
					});
				}
			}
			else if (curSelected == 4){
				if(Scores.unlockedLvl4 == true){
					FlxG.camera.fade(FlxColor.BLACK, 1, false, function(){
						//selectSound.play();
						FlxG.sound.music.stop();
						PlayState.curLevel = 'lvl12';
						Variables.FreeplayMode = true;
						FlxG.switchState(new PlayState());			
					});
				}
			}
			else if (curSelected == 5){
				if(Scores.unlockedLvlBoss == true){
					FlxG.camera.fade(FlxColor.BLACK, 1, false, function(){
						//selectSound.play();
						FlxG.sound.music.stop();
						PlayState.curLevel = 'boss3';
						Variables.FreeplayMode = true;
						FlxG.switchState(new PlayState());
					});
				}
			}
		}
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
	function updateArrows(){
		if (FlxG.mouse.justPressed){
			if (FlxG.mouse.overlaps(left_arrow)){
				//scrollSound.play();
				FlxG.switchState(new FreeplayState2());
			}
		}
	}
	override public function update(elapsed:Float){
		//updateBG();
		updateArrows();
		updateOptions();
		updateLeftKey();
		updateRightKey();
		
		super.update(elapsed);
	}
}