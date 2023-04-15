package;
import io.newgrounds.NG;
import flash.net.SharedObject;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import flixel.text.FlxText;
import flixel.system.FlxSound;
import flixel.text.FlxText.FlxTextBorderStyle;

class MainMenuState extends FlxState
{
	var bg1:FlxSprite;
	var bg2:FlxSprite;
	
	var curSelected:Int = 1;
	
	var selectSound:FlxSound;
	var scrollSound:FlxSound;
	
	var cloudsMoving:Bool = true;
	var selectedAnything:Bool = false;
	
	var arrow:FlxSprite;
	var nameText:FlxText;
	
	//buttons
	var new_game:FlxSprite;
	var freeplay:FlxSprite;
	var options:FlxSprite;
	var credits:FlxSprite;
	
	var name:String;
	
	private var mainClass:Main;
	override public function create(){
		loadSounds();
		startMainMenu();
	}
	function loadSounds(){
		selectSound = new FlxSound();
		selectSound = FlxG.sound.load(AssetPaths.select__wav);
		
		scrollSound = new FlxSound();
		scrollSound = FlxG.sound.load(AssetPaths.scroll__wav);
	}
	function startMainMenu(){
		TitleState.resetMedals();
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		FlxG.sound.playMusic(AssetPaths.The_Screen_With_The_Title__wav, 1, true);
		bg1 = new FlxSprite(0, 0).loadGraphic(AssetPaths.skyBG_full__png); add(bg1);
		bg2 = new FlxSprite(-1280, 0).loadGraphic(AssetPaths.skyBG_full__png); add(bg2);
		
		new_game = new FlxSprite(340, 130);
		new_game.loadGraphic(AssetPaths.menu_ui_assets__png, true, 600, 100);
		new_game.animation.add('new', [0], 1); new_game.animation.play('new');
		add(new_game);
		
		freeplay = new FlxSprite(340, 260);
		freeplay.loadGraphic(AssetPaths.menu_ui_assets__png, true, 600, 100);
		freeplay.animation.add('free', [1], 1); freeplay.animation.play('free');
		add(freeplay);
		
		options = new FlxSprite(340, 390);
		options.loadGraphic(AssetPaths.menu_ui_assets__png, true, 600, 100);
		options.animation.add('options', [2], 1); options.animation.play('options');
		add(options);
		
		credits = new FlxSprite(340, 520);
		credits.loadGraphic(AssetPaths.menu_ui_assets__png, true, 600, 100);
		credits.animation.add('credits', [3], 1); credits.animation.play('credits');
		add(credits);
		
		arrow = new FlxSprite(200, 130).loadGraphic(AssetPaths.arrow_title__png); add(arrow);
		
		
		/*
		if (NG.core.loggedIn == true){
			name = NG.core.user.name + '!';
		}else{
			name = 'Unknown Newgrounds User :(';
		}
		*/
		
		nameText = new FlxText(10, 660, 0, "Logged In As: " + name);
		nameText.setFormat(AssetPaths.pixel__ttf);
		nameText.color = FlxColor.ORANGE;
		nameText.size = 30;
		nameText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
		//add(nameText);
		
		//i also cant add this because of newgrounds reasons, sorry!!!
	}
	function updateThisState(){
		if (FlxG.keys.justPressed.BACKSPACE){
			FlxG.camera.fade(FlxColor.WHITE, 1, false, function(){
				FlxG.sound.music.stop();
				FlxG.switchState(new TitleState());
			});
		}
		/*
		if (NG.core.loggedIn == true){
			if (FlxG.mouse.overlaps(nameText)){
				if (FlxG.mouse.justPressed){
					selectSound.play();
					FlxG.openURL('https://' + NG.core.user.name + '.newgrounds.com/');
				}
			}
		}
		*/
		if (curSelected == 1){
			arrow.x = 200;
			arrow.y = 130;
			if (FlxG.keys.anyJustPressed([DOWN])){
				arrow.x = 200;
				arrow.y = 260;
				curSelected = 2;
				scrollSound.play(true);
			}
		}
		else if (curSelected == 2){
			arrow.x = 200;
			arrow.y = 260;
			if (FlxG.keys.anyJustPressed([DOWN])){
				arrow.x = 200;
				arrow.y = 390;
				curSelected = 3;
				scrollSound.play(true);
			}
		}
		else if (curSelected == 3){
			arrow.x = 200;
			arrow.y = 390;
			if (FlxG.keys.anyJustPressed([DOWN])){
				arrow.x = 200;
				arrow.y = 520;
				curSelected = 4;
				scrollSound.play(true);
			}
		}
		else if (curSelected == 4){
			arrow.x = 200;
			arrow.y = 520;
			if (FlxG.keys.anyJustPressed([DOWN])){
				arrow.x = 200;
				arrow.y = 130;
				curSelected = 1;
				scrollSound.play(true);
			}
		}
		
		
		if (curSelected == 1){
			arrow.x = 200;
			arrow.y = 130;
			if (FlxG.keys.anyJustPressed([UP])){
				arrow.x = 200;
				arrow.y = 520;
				curSelected = 4;
				scrollSound.play(true);
			}
		}
		else if (curSelected == 4){
			arrow.x = 200;
			arrow.y = 520;
			if (FlxG.keys.anyJustPressed([UP])){
				arrow.x = 200;
				arrow.y = 390;
				curSelected = 3;
				scrollSound.play(true);
			}
		}
		else if (curSelected == 3){
			arrow.x = 200;
			arrow.y = 390;
			if (FlxG.keys.anyJustPressed([UP])){
				arrow.x = 200;
				arrow.y = 260;
				curSelected = 2;
				scrollSound.play(true);
			}
		}
		else if (curSelected == 2){
			arrow.x = 200;
			arrow.y = 260;
			if (FlxG.keys.anyJustPressed([UP])){
				arrow.x = 200;
				arrow.y = 130;
				curSelected = 1;
				scrollSound.play(true);
			}
		}
		
		if (FlxG.keys.anyJustPressed([ENTER, SPACE])){
			selectSound.play();
			if (curSelected == 1){
				FlxG.camera.fade(FlxColor.WHITE, 1, false, function(){
					PlayState.curLevel = 'lvl1';
					FlxG.sound.music.fadeOut(1);
					Variables.FreeplayMode = false;
					FlxG.switchState(new PlayState());
				});
			}
			else if (curSelected == 2){
				FlxG.camera.fade(FlxColor.WHITE, 1, false, function(){
					FlxG.switchState(new FreeplayState());
				});
			}
			else if (curSelected == 3){
				FlxG.camera.fade(FlxColor.WHITE, 1, false, function(){
					FlxG.switchState(new HTPState());
				});
			}
			else if (curSelected == 4){
				FlxG.camera.fade(FlxColor.BLACK, 1, false, function(){
					FlxG.switchState(new CredsState());
					
				});
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
	override public function update(elapsed:Float){
		super.update(elapsed);
		updateBG();
		updateThisState();
	}
}