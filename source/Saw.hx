package;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.system.FlxSound;

class Saw extends FlxSprite
{
	var SPEED:Int = 100;//the lower this is, the lower the player will jump in vice versa
	var GRAVITY:Int = 90; //the higher this is, the higher the player will jump in vice versa
	var hitSound:FlxSound;
	
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadSounds();
		loadGraphic(AssetPaths.saw__png);
		
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
			velocity.y = -GRAVITY;
		}else{
			this.angle += 4;
		}
	}
	function updateThis(){
		if (PlayState.char.overlaps(this)){
			if (PlayState.char.alpha == 1){
				this.kill();
				hitSound.play(true);
				Variables.health -= 1;
				PlayState.char.alpha = 0.5;
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