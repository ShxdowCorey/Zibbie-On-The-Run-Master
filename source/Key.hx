package;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class Key extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.key__png);
		FlxTween.tween(this, {y: this.y - 5}, 0.5, {ease: FlxEase.quadInOut, type: PINGPONG});
	}
}