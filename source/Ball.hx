package;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.system.FlxSound;

class Ball extends FlxSprite
{
	var SPEED:Int = 100;//the lower this is, the lower the player will jump in vice versa
	var GRAVITY:Int = 150; //the higher this is, the higher the player will jump in vice versa
	var hitSound:FlxSound;
	
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadSounds();
		loadGraphic(AssetPaths.ball_assets__png, true, 16, 16);
		animation.add('ball', [0], 1);
		animation.add('bounce', [1], 1);
		
		animation.play('ball');
		
		drag.x = SPEED * 5; 
		acceleration.y = GRAVITY * 1.5;
		maxVelocity.set(SPEED, 400);
		drag.set(SPEED * 4, SPEED * 3);
	}
	function loadSounds(){
		hitSound = new FlxSound();
		hitSound = FlxG.sound.load(AssetPaths.hurt__wav);
	}
	function updateMovement(){
		this.angle += 4;
		this.velocity.x = -80;
		
		if (this.justTouched(FlxObject.FLOOR)){
			this.angle = 0;
			velocity.y = -GRAVITY;
			animation.play('bounce');
		}else{
			this.angle += 4;
			animation.play('ball');
		}
	}
	function updateThis(){
		if (PlayState.char.overlaps(this)){
			this.kill();
			if (PlayState.char.alpha == 1){
				PlayState.char.alpha = 0.5;
				hitSound.play(true);
				Variables.health -= 1;
			}
			if(FlxG.keys.anyPressed([RIGHT, D])){
				PlayState.char.velocity.x = -1550;
			}else{
				PlayState.char.velocity.x = -300;
			}
		}
	}
	override function update(elapsed:Float){
		updateMovement();
		super.update(elapsed);
		
		updateThis();
		FlxG.collide(this, PlayState.levelGround);
	}
}