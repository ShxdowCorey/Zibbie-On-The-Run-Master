package;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class Shield extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.shield__png);
		FlxTween.tween(this, {y: this.y - 10}, 0.8, {ease: FlxEase.quadInOut, type: PINGPONG});
	}
}