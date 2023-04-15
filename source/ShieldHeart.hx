package;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class ShieldHeart extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.shield_heart_assets__png, true, 16, 16);
		animation.add('idle', [0, 1, 2, 3, 4, 5], 12, true);
		animation.play('idle');
	}
}