package;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class Speed extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.speed__png);
		FlxTween.tween(this, {y: this.y - 8}, 1.5, {ease: FlxEase.quadInOut, type: PINGPONG});
	}
}