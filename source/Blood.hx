package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.math.FlxMath;
import flixel.FlxObject;
import flixel.graphics.frames.FlxAtlasFrames;

class Blood extends FlxSprite
{
	public function new(x:Float, y:Float):Void 
	{
		super(x, y);
		loadGraphic(AssetPaths.blood_assets__png, true, 16, 16);
		animation.add('blood', [0, 1, 2, 3, 4, 5], 18, false);
		
		animation.play('blood');
		antialiasing = false;
	}
	override function update(elapsed:Float){
		
		super.update(elapsed);
		
		if (this.animation.curAnim.name == 'blood' && this.animation.curAnim.finished){
			this.kill();
		}
	}
}