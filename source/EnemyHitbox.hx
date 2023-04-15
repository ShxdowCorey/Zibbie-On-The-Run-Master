package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.math.FlxMath;
import flixel.FlxObject;
import flixel.math.FlxVelocity;
import flixel.math.FlxPoint;
import flixel.graphics.frames.FlxAtlasFrames;

class EnemyHitbox extends FlxSprite
{
	var playerPosition:FlxPoint;
	
	public function new(x:Float, y:Float):Void 
	{
		super(x, y);
		makeGraphic(112, 16, FlxColor.YELLOW);
		alpha = 0.5;
		
		//playerPosition = FlxPoint.get(PlayState.char.x, PlayState.char.y);
	}
	override function update(elapsed:Float){
		
		super.update(elapsed);
		
		if (this.overlaps(PlayState.char)){
			//FlxVelocity.moveTowardsPoint(this, playerPosition, 50);
		}
	}
}