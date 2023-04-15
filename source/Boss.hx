package;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.system.FlxSound;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class Boss extends FlxSprite
{
	public static var Health:Int = 10;
	
	public static var dead:Bool = false;
	
	public static var bossMovement:Int = 1;
	
	var count:Int = 0;
	var moveL:Bool = true;
	var moveR:Bool = false;
	
	var moveUp:Bool = true;
	var moveDown:Bool = true;
	
	var idleCounter:Int = 0;
	var stopCounter:Int = 0;
	var hitCounter:Int = 0;
	var deadCounter:Int = 0;
	
	var L:Bool = false;
	var R:Bool = true;
	
	var stopMoving:Int = 1;
	
	var addScore:Bool = false;
	
	var playerSpeed:Float = 100;
	var SPEED:Int = 100;//the lower this is, the lower the player will jump in vice versa
	var GRAVITY:Int = 450; //the higher this is, the higher the player will jump in vice versa
	
	var lrCounter:Int = 0;
	
	var hitBoss:FlxSound;
	var bossPoweredUp:FlxSound;
	public function new(x:Float, y:Float, bossNum:Int):Void
	{
		super(x, y);
		loadSounds();
		if (bossNum == 1){
			Health = 10;
			bossMovement = 1;
			loadGraphic(AssetPaths.boss_assets__png, true, 32, 32);
			animation.add('idle', [0, 1, 2, 3], 6, true);
			animation.add('die', [5, 6, 7, 8], 6);
			animation.add('hit', [4], 1);
		
			animation.play('idle');
		}
		else if (bossNum == 2){
			Health = 70;
			bossMovement = 2;
			loadGraphic(AssetPaths.boss2_assets__png, true, 32, 32);
			animation.add('idle', [0], 1);
			animation.add('die', [4, 6, 8, 10, 2, 5, 7, 9, 11, 2], 12, true);
		
			animation.play('idle');
		}
		else if (bossNum == 3){
			Health = 120;
			bossMovement = 3;
			loadGraphic(AssetPaths.argerecher__png, true, 32, 32);
			
			animation.add('idle', [0], 1);
			animation.add('die', [4, 6, 8, 10, 2, 5, 7, 9, 11, 2], 10, true);
		
			animation.play('idle');
		}
		
		antialiasing = false;
	}
	function loadSounds(){
		hitBoss = new FlxSound();
		hitBoss = FlxG.sound.load(AssetPaths.hitboss__wav);
		
		bossPoweredUp = new FlxSound();
		bossPoweredUp = FlxG.sound.load(AssetPaths.poweredupboss__wav);
	}
	function updateMovement()
	{
		if(stopMoving == 1){
			if (moveL == true) {
				count++;
				this.x -= FlxG.random.float(0.4, 0.8);
				flipX = true;
			}
			else if (moveR == true) {
				count--;
				this.x += FlxG.random.float(0.4, 0.8);
				flipX = true;
			}
		
			if (count>=FlxG.random.float(60, 75)) {
				moveL = false;
				moveR = true;
			}
			if (count<=0) {
				moveL = true;
				moveR = false;
			}
		}
	}
	function updateMovement2()
	{
		if (moveUp == true) {
			count++;
			this.y -= FlxG.random.float(0.5, 0.5);
			flipX = false;
		}
		else if (moveDown == true) {
			count--;
			this.y += FlxG.random.float(0.5, 0.5);
			flipX = false;
		}
		
		if (count>=FlxG.random.float(70, 70)) {
			moveUp = false;
			moveDown = true;
		}
		if (count<=0) {
			moveUp = true;
			moveDown = false;
		}
	}
	function updateMovement3()
	{
		if (moveUp == true) {
			count++;
			this.y -= FlxG.random.float(0.3, 0.3);
			flipX = false;
		}
		else if (moveDown == true) {
			count--;
			this.y += FlxG.random.float(0.3, 0.3);
			flipX = false;
		}
		
		if (count>=FlxG.random.float(50, 40)) {
			moveUp = false;
			moveDown = true;
		}
		if (count<=0) {
			moveUp = true;
			moveDown = false;
		}
	}
	function secondMovement3(){
		if (moveL == true) {
			lrCounter++;
			this.x -= FlxG.random.float(1, 1);
			flipX = true;
		}
		else if (moveR == true) {
			lrCounter--;
			this.x += FlxG.random.float(1, 1);
			flipX = true;
		}
		
		if (lrCounter>=FlxG.random.float(300, 300)) {
			moveL = false;
			moveR = true;
		}
		if (lrCounter<=0) {
			moveL = true;
			moveR = false;
		}
	}
	function updateIdleOrSomething(){
		if (L == true) {
			idleCounter++;
		}
		else if (R == true) {
			idleCounter--;
		}
		
		if (idleCounter>=FlxG.random.int(40, 60)) {
			L = false;
			R = true;
			stopMoving = 2;
		}
		if (idleCounter<=FlxG.random.int(0, -20)) {
			L = true;
			R = false;
			stopMoving = 1;
		}
	}
	function updateBoss(){
		if(bossMovement == 1){
			if (Health != 0){
				updateMovement();
			}
			if (Health <= 0){
				//dead = true;
				deadCounter++;
				animation.play('die');
				PlayState.explosion.play();
				FlxG.sound.music.fadeOut(0.5);
			}
			if (animation.curAnim.name == 'hit'){
				hitCounter++;
			}
			if (hitCounter == 55){
				hitCounter = 0;
				bossPoweredUp.play();
				animation.play('idle');
			}
			if (hitCounter > 0){
				stopMoving = 2;
			}
		}
		else if (bossMovement == 2){
			if (Health != 0){
				updateMovement2();
			}
			if (Health <= 0){
				deadCounter++;
				
			
				FlxG.sound.music.fadeOut(0.5);
			}
		}
		else if (bossMovement == 3){
			if (Health != 0){
				secondMovement3();
				updateMovement3();
			}
			if (Health <= 0){
				deadCounter++;
				
			
				FlxG.sound.music.fadeOut(0.5);
			}
		}
	}
	function resetVariables(){
		Variables.keys = 0;
		Variables.generators = 0;
		Variables.coins = 0;
		Variables.wrenches = 0;
		Variables.lives = 4;
		Variables.health = 5;
		Variables.diamonds = 0;
		Variables.bullets = 0;
		Variables.score = 0;
		Variables.silverCoins = 0;
	}
    override function update(elapsed:Float){
		if(dead == false){
			updateBoss();
			if(bossMovement == 1){
				updateIdleOrSomething();
			}
		}
		if (deadCounter >= 20){
			dead = true;
			
			PlayState.ghostsGrp.kill();
			PlayState.spidersGrp.kill();
			PlayState.mushroomGrp.kill();
			
			if (PlayState.curLevel == 'boss'){
				this.kill();
				Player.bossMode = true;
				PlayState.char.animation.play('walk');
				
				FlxG.camera.fade(FlxColor.BLACK, 2, false, function(){
					if (Variables.FreeplayMode == false){
						Player.bossMode = false;
						PlayState.curWorld = '2';
						PlayState.curLevel = 'lvl5';
						PlayState.curTiledLevel = 'Five';
						resetVariables();
						FlxG.resetState();
					}else{
						if (Variables.FreeplayMode == true){
							Variables.FreeplayMode = false;
						}
						resetVariables();
						FlxG.sound.music.stop();
						FlxG.mouse.visible = true;
						FlxG.sound.playMusic(AssetPaths.The_Screen_With_The_Title__wav, 1, true);
						FlxG.switchState(new FreeplayState());
					}
				});
			}
			else if (PlayState.curLevel == 'boss2'){
				FlxG.camera.fade(FlxColor.BLACK, 2, false, function(){
					if(Variables.FreeplayMode == false){
						PlayState.curWorld = '3';
						PlayState.curLevel = 'lvl9';
						PlayState.curTiledLevel = 'Nine';
						resetVariables();
						FlxG.resetState();
					}else{
						if (Variables.FreeplayMode == true){
							Variables.FreeplayMode = false;
						}
						resetVariables();
						FlxG.sound.music.stop();
						FlxG.mouse.visible = true;
						FlxG.sound.playMusic(AssetPaths.The_Screen_With_The_Title__wav, 1, true);
						FlxG.switchState(new FreeplayState());
					}
				});
			}
			else if (PlayState.curLevel == 'boss3'){
				FlxG.camera.fade(FlxColor.BLACK, 2, false, function(){
					if (Variables.FreeplayMode == false){
						resetVariables();
						PlayState.curWorld = '1';
						PlayState.curLevel = 'lvl1';
						FlxG.switchState(new EndState());
					}else{
						if (Variables.FreeplayMode == true){
							Variables.FreeplayMode = false;
						}
						resetVariables();
						FlxG.sound.music.stop();
						FlxG.mouse.visible = true;
						FlxG.sound.playMusic(AssetPaths.The_Screen_With_The_Title__wav, 1, true);
						FlxG.switchState(new FreeplayState());
					}
				});
			}
		}
		super.update(elapsed);
	}
}