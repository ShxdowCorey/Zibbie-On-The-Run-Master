package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.math.FlxMath;
import flixel.FlxObject;
import flixel.system.FlxSound;
import flixel.graphics.frames.FlxAtlasFrames;

class EnemyBullet extends FlxSprite
{
	var count:Int = 0;
	public static var moveL:Bool = false;
	public static var moveR:Bool = false;
	
	var hitGhost:FlxSound;
	var boxSound:FlxSound;
	public function new(x:Float, y:Float, enemyType:String, dir:String):Void 
	{
		super(x, y);
		loadSounds();
		if(enemyType == 'ghost'){
			loadGraphic(AssetPaths.boss_bullet__png);
		}else if (enemyType == 'spider'){
			loadGraphic(AssetPaths.spider_bullet__png);
		}
		
		if (dir == 'L'){
			moveL = true;
		}
		else if (dir == 'R'){
			moveR = true;
		}
		//y += 16;
	}
	function loadSounds(){
		hitGhost = new FlxSound();
		hitGhost = FlxG.sound.load(AssetPaths.hitghost__wav);
		
		boxSound = new FlxSound();
		boxSound = FlxG.sound.load(AssetPaths.box__wav);
	}
	function updateMovement()
	{
		if (moveR == true){
			this.flipX = false;
			this.x += 3;
		}
		if (moveL == true){
			this.flipX = true;
			this.x -= 3;
		}
	}
	override function update(elapsed:Float){
		super.update(elapsed);
		updateMovement();
		count++;
		if (count >= 100){
			this.kill();
		}
	}
}