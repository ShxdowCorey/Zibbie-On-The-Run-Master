package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.ui.FlxBar;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.system.FlxSound;
import flixel.math.FlxPoint;
import flixel.text.FlxText.FlxTextBorderStyle;
import flixel.input.keyboard.FlxKey;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.graphics.frames.FlxAtlasFrames;
using flixel.util.FlxSpriteUtil;

class HUD extends FlxTypedGroup<FlxSprite>
{
	//public stuff
	var txtCounter:Int = 0;
	public static var txt:FlxTypeText;
	public static var charTalking:FlxText;
	
	public static var textbox:FlxSprite;
	
	//counters
	public static var keysCounter:FlxText;
	public static var coinsCounter:FlxText;
	public static var livesCounter:FlxText;
	public static var bulletsCounter:FlxText;
	public static var diamondCounter:FlxText;
	public static var wrenchCounter:FlxText;
	public static var generatorCounter:FlxText;
	public static var killCounter:FlxText;
	public static var silverCoinCounter:FlxText;
	public static var powerupCounter:FlxText;
	
	public static var scoreCounter:FlxText;
	
	//sprites
	public static var keySprt:FlxSprite;
	public static var powerSprt:PowerupSprt;
	public static var generatorDisplay:FlxSprite;
	
	public static var emptyHeart1:FlxSprite;
	public static var emptyHeart2:FlxSprite;
	public static var emptyHeart3:FlxSprite;
	public static var emptyHeart4:FlxSprite;
	public static var emptyHeart5:FlxSprite;
	
	public static var heart1:Heart;
	public static var heart2:Heart;
	public static var heart3:Heart;
	public static var heart4:Heart;
	public static var heart5:Heart;
	
	//sounds
	var pauseSound:FlxSound;
	
	//booleans
	var lostLife:Bool = false;
	var startTextB:Bool = false;
	
	//customs
	public static var helpButton:HelpButton;
	public static var pauseButton:PauseButton;
	public static var restartButton:RestartButton;
	public static var accessHUDButton:AccessHUDButton;
	
	public static var textboxMessages:Array<String> = ["WELCOME TO ZIBBIE ON THE RUN! USE TAB TO SHOW/HIDE HUD. HAVE FUN!", "WOAH, LOOKS LIKE YOU'RE IN A NEW WORLD. WATCH OUT FOR THOSE CACTI!!!", "AYY, IT LOOKS LIKE YOU ARE ALMOST THERE, DON'T GIVE UP NOW"];
	
	public function new()
	{
		super();
		createHearts();
		
		livesCounter = new FlxText(727.9, 271.2, 0, "" + Variables.lives);
		livesCounter.setFormat(AssetPaths.pixel__ttf);
		livesCounter.scrollFactor.set(0, 0);
		livesCounter.color = FlxColor.WHITE;
		livesCounter.visible = false;
		livesCounter.size = 8;
		livesCounter.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
		add(livesCounter);
		
		coinsCounter = new FlxText(727.9, 287.2, 0, "" + Variables.coins);
		coinsCounter.setFormat(AssetPaths.pixel__ttf);
		coinsCounter.scrollFactor.set(0, 0);
		coinsCounter.color = FlxColor.WHITE;
		coinsCounter.visible = false;
		coinsCounter.size = 8;
		coinsCounter.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
		add(coinsCounter);
		
		silverCoinCounter = new FlxText(773.5, 303.2, 0, "" + Variables.silverCoins);
		silverCoinCounter.setFormat(AssetPaths.pixel__ttf);
		silverCoinCounter.scrollFactor.set(0, 0);
		silverCoinCounter.color = FlxColor.WHITE;
		silverCoinCounter.visible = false;
		silverCoinCounter.size = 8;
		silverCoinCounter.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
		add(silverCoinCounter);
		
		bulletsCounter = new FlxText(773.5, 271.2, 0, "" + Variables.bullets);
		bulletsCounter.setFormat(AssetPaths.pixel__ttf);
		bulletsCounter.scrollFactor.set(0, 0);
		bulletsCounter.color = FlxColor.WHITE;
		bulletsCounter.visible = false;
		bulletsCounter.size = 8;
		bulletsCounter.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
		add(bulletsCounter);
		
		wrenchCounter = new FlxText(727.9, 303.2, 0, "" + Variables.wrenches);
		wrenchCounter.setFormat(AssetPaths.pixel__ttf);
		wrenchCounter.scrollFactor.set(0, 0);
		wrenchCounter.color = FlxColor.WHITE;
		wrenchCounter.visible = false;
		wrenchCounter.size = 8;
		wrenchCounter.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
		add(wrenchCounter);
		
		diamondCounter = new FlxText(773.5, 287.2, 0, "" + Variables.diamonds);
		diamondCounter.setFormat(AssetPaths.pixel__ttf);
		diamondCounter.scrollFactor.set(0, 0);
		diamondCounter.color = FlxColor.WHITE;
		diamondCounter.visible = false;
		diamondCounter.size = 8;
		diamondCounter.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
		add(diamondCounter);
		
		generatorCounter = new FlxText(508, 280, 0, "" + Variables.generators + "/" + Variables.neededGenerators);
		generatorCounter.setFormat(AssetPaths.pixel__ttf);
		generatorCounter.scrollFactor.set(0, 0);
		generatorCounter.color = FlxColor.WHITE;
		generatorCounter.visible = false;
		generatorCounter.size = 10;
		generatorCounter.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
		add(generatorCounter);
		
		keysCounter = new FlxText(508, 280 + 20, 0, "" + Variables.keys + "/" + Variables.neededKeys);
		keysCounter.setFormat(AssetPaths.pixel__ttf);
		keysCounter.scrollFactor.set(0, 0);
		keysCounter.color = FlxColor.WHITE;
		keysCounter.visible = false;
		keysCounter.size = 10;
		keysCounter.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
		add(keysCounter);
		
		scoreCounter = new FlxText(590, 295, 0, "SCORE: " + Variables.score);
		scoreCounter.setFormat(AssetPaths.pixel__ttf);
		scoreCounter.scrollFactor.set(0, 0);
		scoreCounter.color = FlxColor.WHITE;
		scoreCounter.visible = false;
		scoreCounter.size = 10;
		scoreCounter.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
		add(scoreCounter);
		
		//bottom buttons (they dont need to invisible on start)
		pauseButton = new PauseButton(490, 425);
		add(pauseButton);
		
		//restartButton = new RestartButton(510, 425);
		//add(restartButton);
		
		accessHUDButton = new AccessHUDButton(510, 425);
		add(accessHUDButton);
		
		//-----------------------------------------------------
		
		generatorDisplay = new FlxSprite(490, 280).loadGraphic(AssetPaths.generator_assets__png, true, 16, 16);
		generatorDisplay.animation.add('gene', [11], 1); generatorDisplay.animation.play('gene');
		generatorDisplay.scrollFactor.set(0, 0);
		generatorDisplay.visible = false;
		add(generatorDisplay);
		
		keySprt = new FlxSprite(generatorDisplay.x, generatorDisplay.y + 20).loadGraphic(AssetPaths.key__png);
		keySprt.scrollFactor.set(0, 0);
		keySprt.visible = false;
		add(keySprt);
		
		textbox = new FlxSprite(560, 380).loadGraphic(AssetPaths.textbox__png); textbox.scrollFactor.set(0, 0); textbox.visible = true; 
		
		if (PlayState.curLevel == 'lvl1'){
			txt = new FlxTypeText(562.8, 396, 160, textboxMessages[0]);
			txt.sounds = [FlxG.sound.load(AssetPaths.txt1__wav)];
			txt.setFormat(AssetPaths.pixel__ttf);
			txt.scrollFactor.set(0, 0);
			txt.color = FlxColor.WHITE;
			txt.finishSounds = true;
			txt.autoErase = true;
			txt.waitTime = 2;
			txt.size = 8;
			txt.start();
			add(textbox);
			add(txt);
		}
		else if (PlayState.curLevel == 'lvl5'){
			txt = new FlxTypeText(562.8, 396, 160, textboxMessages[1]);
			txt.sounds = [FlxG.sound.load(AssetPaths.txt1__wav)];
			txt.setFormat(AssetPaths.pixel__ttf);
			txt.scrollFactor.set(0, 0);
			txt.color = FlxColor.WHITE;
			txt.finishSounds = true;
			txt.autoErase = true;
			txt.waitTime = 2;
			txt.size = 8;
			txt.start();
			add(textbox);
			add(txt);
		}
		else if (PlayState.curLevel == 'lvl9'){
			txt = new FlxTypeText(562.8, 396, 160, textboxMessages[2]);
			txt.sounds = [FlxG.sound.load(AssetPaths.txt1__wav)];
			txt.setFormat(AssetPaths.pixel__ttf);
			txt.scrollFactor.set(0, 0);
			txt.color = FlxColor.WHITE;
			txt.finishSounds = true;
			txt.autoErase = true;
			txt.waitTime = 2;
			txt.size = 8;
			txt.start();
			add(textbox);
			add(txt);
		}
		
		charTalking = new FlxText(563, 383, 160, "SYSTEM");
		charTalking.setFormat(AssetPaths.pixel__ttf);
		charTalking.scrollFactor.set(0, 0);
		charTalking.color = FlxColor.WHITE;
		charTalking.size = 8;
		
		if(PlayState.curLevel == 'lvl1' || PlayState.curLevel == 'lvl5' || PlayState.curLevel == 'lvl9'){	
			add(charTalking);
		}
	}
	function createHearts(){
		emptyHeart1 = new FlxSprite(596, 275).loadGraphic(AssetPaths.empty_heart__png); emptyHeart1.scrollFactor.set(0, 0); add(emptyHeart1); emptyHeart1.visible = false;
		emptyHeart2 = new FlxSprite(614, 275).loadGraphic(AssetPaths.empty_heart__png); emptyHeart2.scrollFactor.set(0, 0); add(emptyHeart2); emptyHeart2.visible = false;
		emptyHeart3 = new FlxSprite(632, 275).loadGraphic(AssetPaths.empty_heart__png); emptyHeart3.scrollFactor.set(0, 0); add(emptyHeart3); emptyHeart3.visible = false;
		emptyHeart4 = new FlxSprite(650, 275).loadGraphic(AssetPaths.empty_heart__png); emptyHeart4.scrollFactor.set(0, 0); add(emptyHeart4); emptyHeart4.visible = false;
		emptyHeart5 = new FlxSprite(668, 275).loadGraphic(AssetPaths.empty_heart__png); emptyHeart5.scrollFactor.set(0, 0); add(emptyHeart5); emptyHeart5.visible = false;
		
		heart1 = new Heart(596, 275); heart1.visible = true; heart1.scrollFactor.set(0, 0); add(heart1); heart1.alpha = 0;
		heart2 = new Heart(614, 275); heart2.visible = true; heart2.scrollFactor.set(0, 0); add(heart2); heart2.alpha = 0;
		heart3 = new Heart(632, 275); heart3.visible = true; heart3.scrollFactor.set(0, 0); add(heart3); heart3.alpha = 0;
		heart4 = new Heart(650, 275); heart4.visible = true; heart4.scrollFactor.set(0, 0); add(heart4); heart4.alpha = 0;
		heart5 = new Heart(668, 275); heart5.visible = true; heart5.scrollFactor.set(0, 0); add(heart5); heart5.alpha = 0;
	}
	public function resetHearts(){
		heart1.visible = true;
		heart2.visible = true;
		heart3.visible = true;
		heart4.visible = true;
		heart5.visible = true;
	}
	function updateHearts(){
		switch(Variables.health){
			case 5:
				heart1.visible = true;
				heart2.visible = true;
				heart3.visible = true;
				heart4.visible = true;
				heart5.visible = true;
			case 4:
				heart1.visible = true;
				heart2.visible = true;
				heart3.visible = true;
				heart4.visible = true;
				heart5.visible = false;
			case 3:
				heart1.visible = true;
				heart2.visible = true;
				heart3.visible = true;
				heart4.visible = false;
				heart5.visible = false;
			case 2:
				heart1.visible = true;
				heart2.visible = true;
				heart3.visible = false;
				heart4.visible = false;
				heart5.visible = false;
			case 1:
				heart1.visible = true;
				heart2.visible = false;
				heart3.visible = false;
				heart4.visible = false;
				heart5.visible = false;
			case 0:
				heart1.visible = false;
				heart2.visible = false;
				heart3.visible = false;
				heart4.visible = false;
				heart5.visible = false;
		}
		lostLife = false;
		if (heart1.visible == false){
			if (heart2.visible == false){
				if (heart3.visible == false){
					if (heart4.visible == false){
						if (heart5.visible == false){
							Variables.health = 5;
							resetHearts();
							lostLife = true;
							if (lostLife == true){
								Variables.lives--;
								if(Variables.lives > 0){
									PlayState.char.x = PlayState.charX;
									PlayState.char.y = PlayState.charY - 32;
								}
								else if (Variables.lives <= 0){
									PlayState.char.alpha = 1;
									PlayState.char.canWalk = false;
									PlayState.char.animation.play('die');
									
									FlxG.sound.music.fadeOut(2);
									FlxG.camera.fade(FlxColor.BLACK, 2, false, function(){
										if(Variables.FreeplayMode == false){
											FlxG.switchState(new LoseState());
										}else
										{
											if (Variables.FreeplayMode == true){
												Variables.FreeplayMode = false;
											}
											FlxG.sound.music.stop();
											FlxG.mouse.visible = true;
											//FlxG.sound.playMusic(AssetPaths.The_Screen_With_The_Title__wav, 1, true);
											FlxG.switchState(new FreeplayState());
										}
									});
								}
							}
							lostLife = false;
						}
					}
				}
			}
		}
	}
	
	override function update(elapsed:Float){
		updateHearts();
		scoreCounter.screenCenter(X);
		
		livesCounter.text = "" + Variables.lives;
		coinsCounter.text = "" + Variables.coins;
		bulletsCounter.text = "" + Variables.bullets;
		wrenchCounter.text = "" + Variables.wrenches;
		diamondCounter.text = "" + Variables.diamonds;
		scoreCounter.text = "SCORE: " + Variables.score;
		silverCoinCounter.text = "" + Variables.silverCoins;
		keysCounter.text = "" + Variables.keys + "/" + Variables.neededKeys;
		generatorCounter.text = "" + Variables.generators + "/" + Variables.neededGenerators;
		
		if (PlayState.curLevel == 'lvl1' || PlayState.curLevel == 'lvl5' || PlayState.curLevel == 'lvl9'){
			txtCounter++;
		}
		if (PlayState.curLevel == 'lvl1' || PlayState.curLevel == 'lvl5' || PlayState.curLevel == 'lvl9'){
			if (txtCounter >= 800){
				textbox.visible = false;
				txt.visible = false;
				charTalking.visible = false;
			}
		}
		super.update(elapsed);
	}
}