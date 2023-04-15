package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.math.FlxMath;
import flixel.FlxObject;
import flixel.tweens.FlxTween;
import flixel.system.FlxSound;
import flixel.graphics.frames.FlxAtlasFrames;

class Player extends FlxSprite
{
	public static var faceX:Bool;
	public var dead:Bool = false;
	
	var DRAGSpeed:Int = 110;//the lower this is, the slower the player will run in vice versa (i think)
	var GRAVITY:Int = 450; //the higher this is, the higher the player will jump in vice versa (i think)
	var jumpSound:FlxSound;
	var shootSound:FlxSound;
	var noBullets:FlxSound;
	
	var alphaCounter:Int = 0;

	public var canWalk:Bool = true;
	
	public var playerSpeed:Float = 95;
	public var fasterPlayerSpeed:Float = 160;
	public var playerJump:Float = 275;
	var _flagWalking:Bool = false;
	
	var jumpTimer:Float = 0;
	var jumping:Bool = false;
	var completeLevel:Bool = false;
	
	public static var bossMode:Bool = false;
	
	public function new(x:Float, y:Float){
		super(x, y);
		createSounds();
		bossMode = false;
		loadGraphic(AssetPaths.player_assets__png, true, 16, 16);
		animation.add('idle', [0, 1, 2, 3], 12, true);
		animation.add('walk', [4, 5, 6, 7], 12, true);
		animation.add('punch', [12, 13, 14], 12, true);
		animation.add('die', [16, 16, 17, 18, 19, 19], 12, false);
		animation.add('jump', [22], 1);
		animation.add('fall', [23], 1);
		animation.play('idle');
		antialiasing = false; //eliminates smoothing //duuhhh i already knew that //bro shut up, i wasnt talking to you dang
		drag.x = DRAGSpeed * 5; 
		acceleration.y = GRAVITY * 1.5; //the lower this number is, the floatier the jump
		maxVelocity.set(playerSpeed, 400);
		drag.set(playerSpeed * 4, playerSpeed * 3);
		
		height -= 5;
        offset.y = 5;
        width -= 5;
        offset.x = 2;
	}
	function createSounds(){
		jumpSound = new FlxSound();
		jumpSound = FlxG.sound.load(AssetPaths.jump__wav);
		
		shootSound = new FlxSound();
		shootSound = FlxG.sound.load(AssetPaths.shoot__wav);
		
		noBullets = new FlxSound();
		noBullets = FlxG.sound.load(AssetPaths.nobullets__wav);
	}
	function updateMovement(){
		var left = FlxG.keys.anyPressed([LEFT, A]);
		var right = FlxG.keys.anyPressed([RIGHT, D]);
		var down = FlxG.keys.anyPressed([DOWN, S]);
		var up = FlxG.keys.anyJustPressed([UP, W]);
		
		if (this.isTouching(FlxObject.FLOOR))
		{
			if (!_flagWalking)
			{
				this.animation.play("idle");
			}
		}
		else if (this.velocity.y > 0)
		{
			this.animation.play("fall");
		}
		
		
		if (left && right)
		{
			if (!this.isTouching(FlxObject.FLOOR)){
				if(this.velocity.y > 0){
					this.velocity.x = 0;
					animation.play('fall');
				}
				else
				{
					this.velocity.x = 0;
					animation.play('jump');
				}
			}
		}
		else if (left && right){
			if (this.isTouching(FlxObject.FLOOR)){
				this.velocity.x = 0;
				animation.play('idle');
			}
		}

		else if (left)
		{
			this.velocity.x = -playerSpeed;
			this.flipX = true;

			if (this.isTouching(FlxObject.FLOOR) && !this.isTouching(FlxObject.WALL))
			{
				_flagWalking = true;
				this.animation.play("walk");
			}
		}
		else if (right)
		{
			this.velocity.x = playerSpeed;
			this.flipX = false;

			if (this.isTouching(FlxObject.FLOOR) && !this.isTouching(FlxObject.WALL))
			{
				_flagWalking = true;
				this.animation.play("walk");
			}
		}
		else
		{
			_flagWalking = false;
		}

		if (up)
		{
			if (this.isTouching(FlxObject.FLOOR))
			{
				jumpSound.play(true);
				this.animation.play("jump");
				this.velocity.y = -playerJump;
			}
		}
	}
	function updateAlpha(){
		if (this.alpha == 0.5){
			alphaCounter++;
		}
		if (alphaCounter >= 40){
			alphaCounter = 0;
			alpha = 1;
		}
	}
	public function hitSpike(){
		//gotHit = true;
		velocity.y = -GRAVITY / 3.5;
		
		if (this.flipX == false){
			velocity.x = -100;
		}
		else if (this.flipX == true){
			velocity.x = 100;
		}
	}
	public function hitTramp(){
		var up = FlxG.keys.anyPressed([UP, W]);
		
		if(!up){
			velocity.y = -GRAVITY / 3;
		}
		
		if (up){
			velocity.y = -GRAVITY / 1.25;
		}
	}
	public function killMushroom(){
		if(FlxG.keys.anyPressed([UP, W])){
			velocity.y = -GRAVITY / 2;
		}
		else
		{
			velocity.y = -GRAVITY / 3;
		}
	}
	function updateShoot(){
		if (FlxG.keys.anyJustPressed([X])){
			if (Variables.bullets > 0){
				shootSound.play(true);
				//animation.play('shoot');
			}else{
				noBullets.play(true);
			}
		}else{
			//animation.play('idle');
		}
	}
	//update everything
	override function update(elapsed:Float){
		if (canWalk == true){
			updateAlpha();
			updateShoot();
			updateMovement();
		}
		
		if (bossMode == true){
			canWalk = false;
			
			this.x += 1;
			flipX = false;
			animation.play('walk');
			if (this.isTouching(FlxObject.FLOOR)){
				//animation.play('jump');
				//this.velocity.y = -playerJump;
			}
		}
		
		super.update(elapsed);
	}
}