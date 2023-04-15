package;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class Apple extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.apple__png);
		FlxTween.tween(this, {y: this.y - 10}, 1, {ease: FlxEase.quadInOut, type: PINGPONG});
	}
}