package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.math.FlxMath;
import flixel.FlxObject;
import flixel.graphics.frames.FlxAtlasFrames;

class Snow extends FlxSprite
{
	public function new(x:Float, y:Float):Void 
	{
		super(x, y);
		loadGraphic(AssetPaths.snow_falling__png, true, 16, 16);
		animation.add('fall', [0, 1, 2, 3, 4, 5, 6, 7], 8, true);
		
		animation.play('fall');
		
		alpha = 0.5;
		
		antialiasing = false;
	}
    override function update(elapsed:Float){
		super.update(elapsed);
	}
}