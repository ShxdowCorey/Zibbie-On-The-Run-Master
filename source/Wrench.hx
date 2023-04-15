package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class Wrench extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.wrench__png);
		FlxTween.tween(this, {y: this.y - 15}, 0.75, {ease: FlxEase.quadInOut, type: PINGPONG});
	}
}