package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;
import flixel.graphics.FlxGraphic;

import io.newgrounds.objects.Medal;
import io.newgrounds.Call;
import io.newgrounds.NG;
import io.newgrounds.NGLite;
import io.newgrounds.objects.Error;
import io.newgrounds.objects.events.Outcome;

import flixel.addons.transition.FlxTransitionableState;
//import flixel.addons.transition.GraphicTransTileDiamond;
import flixel.addons.transition.Transition;
import flixel.addons.transition.TransitionData;
//import flixel.addons.transition.TransitionType;

class TitleState extends FlxState
{
	var count:Int = 0;
	
	var creds:FlxSprite;
	var pstp:FlxSprite;
	var star_anim:StarAnim;
	
	var selectSound:FlxSound;
	
	var cloud1:FlxSprite;
	var cloud2:FlxSprite;
	var backCloud1:FlxSprite;
	var backCloud2:FlxSprite;
	
	var aliveT:Bool = true;
	var deadT:Bool = false;
	var cloudsMoving:Bool = true;
	var BcloudsMoving:Bool = true;
	
	var cutscene:OpeningCutscene;
	
	var isLoggedIn:Bool = false;
	
	//var mainState:Main;
	override public function create() 
	{
		loadSounds();
		titleScreen();
		FlxG.autoPause = false;
	}
	function loadSounds(){
		selectSound = new FlxSound();
		selectSound = FlxG.sound.load(AssetPaths.select__wav);
	}
	function titleScreen(){
		
		resetMedals();
		FlxG.camera.zoom = 2;
		//FlxG.mouse.load(AssetPaths.cursor__png, 1, 0, -3);
		FlxG.sound.playMusic(AssetPaths.Adventure__wav, 1, true);
		
		final bg = new FlxSprite(320, 180).loadGraphic(AssetPaths.titleBG__png); add(bg);
		
		backCloud1 = new FlxSprite(320, 180).loadGraphic(AssetPaths.back_clouds__png); add(backCloud1);
		backCloud2 = new FlxSprite(-320, 180).loadGraphic(AssetPaths.back_clouds__png); add(backCloud2);
		
		cloud1 = new FlxSprite(320, 180).loadGraphic(AssetPaths.clouds__png); add(cloud1);
		cloud2 = new FlxSprite( -320, 180).loadGraphic(AssetPaths.clouds__png); add(cloud2);
		
		final title = new FlxSprite(365, 220).loadGraphic(AssetPaths.title__png); add(title);
		
		star_anim = new StarAnim(320, 180, true, 20);
		star_anim.animation.play('starout');
		add(star_anim);
		
		pstp = new FlxSprite(452.8, 444.7).loadGraphic(AssetPaths.pstp__png); add(pstp);
		creds = new FlxSprite(346.4, 492.6).loadGraphic(AssetPaths.creds__png); add(creds);
		
		//cant leave the newgrounds part or i'll get cucked
	}
	public static function resetMedals(){
		Variables.ghostKills = 0;
		Variables.mushroomKills = 0;
		Variables.spiderKills = 0;
		Variables.batsKills = 0;
		Variables.collectedDimonds = 0;
	}
	
	function clickPlay(){
		if (FlxG.keys.anyJustPressed([SPACE])){
			selectSound.play();
			FlxG.camera.fade(FlxColor.BLACK, 1, false, function(){
				FlxG.sound.music.stop();
				FlxG.switchState(new MainMenuState());
			});
		}
	}
	function clickCreds(){
		if (FlxG.mouse.overlaps(creds)){
			if (FlxG.mouse.justPressed){
				//selectSound.play();
				//FlxG.openURL('https://www.newgrounds.com/portal/view/4368879');
			}
		}
	}
	function updateClouds(){
		if(cloudsMoving == true){
			cloud1.x += 1;
			cloud2.x += 1;
		}
		
		if (cloud2.x == 320){
			cloudsMoving = false;
			
			cloud1.x = 320;
			cloud2.x = -320;
			cloudsMoving = true;
		}
		
		
		//back clouds
		if(BcloudsMoving == true){
			backCloud1.x += 0.8;
			backCloud2.x += 0.8;
		}
		
		if (backCloud2.x == 320){
			BcloudsMoving = false;
			
			backCloud1.x = 320;
			backCloud2.x = -320;
			
			BcloudsMoving = true;
		}
		
	}
	function updateText(){
		if (aliveT == true) {
			count++;
			pstp.alpha = 1;
		}
		if (deadT == true) {
			count--;
			pstp.alpha = 0;
		}
		if (count>=40) {
			aliveT = false;
			deadT = true;
		}
		if (count<=0) {
			aliveT = true;
			deadT = false;
		}
	}
	override public function update(elapsed:Float){
		super.update(elapsed);
		
		clickPlay();
		updateText();
		clickCreds();
		updateClouds();
	}
}