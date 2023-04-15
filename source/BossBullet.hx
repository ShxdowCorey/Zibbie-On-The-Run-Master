package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.math.FlxMath;
import flixel.FlxObject;
import flixel.system.FlxSound;
import flixel.graphics.frames.FlxAtlasFrames;

class BossBullet extends FlxSprite
{
	var count:Int = 0;
	var moveL:Bool = false;
	var moveR:Bool = false;
	
	var hitGhost:FlxSound;
	var boxSound:FlxSound;
	public function new(x:Float, y:Float):Void 
	{
		super(x, y);
		loadSounds();
		loadGraphic(AssetPaths.boss_bullet__png);
		//animation.add('bullet', [3], 1);
		//animation.play('bullet');
		
		//y += 16;
		
		if (PlayState.boss.flipX == false){
			moveR = true;
			x += 8;
		}
		else if (PlayState.boss.flipX == true){
			this.flipX = true;
			moveL = true;
			
		}
	}
	function loadSounds(){
		hitGhost = new FlxSound();
		hitGhost = FlxG.sound.load(AssetPaths.hitghost__wav);
		
		boxSound = new FlxSound();
		boxSound = FlxG.sound.load(AssetPaths.box__wav);
	}
	function updateMovement()
	{
		count++;
		if (moveR == true){
			this.x += 3.5;
		}
		else if (moveL == true){
			this.x -= 3.5;
		}
		if (count >= 100){
			this.kill();
		}
	}
	function hitChar(_, c:FlxSprite){
		this.kill();
		
		if (c.alpha == 1){
			c.alpha = 0.5;
			Variables.health -= 1;
			PlayState.hitSound.play(true);
		}
	}
	override function update(elapsed:Float){
		super.update(elapsed);
		updateMovement();
		
		FlxG.overlap(this, PlayState.char, hitChar);
		
		if (this.isTouching(FlxObject.WALL)){
			this.kill();
		}
	}
}