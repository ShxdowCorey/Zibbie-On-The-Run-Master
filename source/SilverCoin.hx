package;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class SilverCoin extends FlxSprite
{
	public function new(x:Float, y:Float):Void 
	{
		super(x, y);
		loadGraphic(AssetPaths.silver_coin_assets__png, true, 16, 16);
		animation.add('idle', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 12, true);
		animation.play('idle');
		//antialiasing = true;
		//FlxTween.tween(this, {y: this.y + 8}, 0.75, {ease: FlxEase.quadInOut, type: PINGPONG});
	}
}