package;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class Diamond extends FlxSprite
{
	public function new(x:Float, y:Float):Void 
	{
		super(x, y);
		loadGraphic(AssetPaths.diamond__png, true, 16, 16);
		animation.add('idle', [0, 1, 2, 3, 4], 12, true);
		animation.play('idle');
		
		//antialiasing = true;
		FlxTween.tween(this, {y: this.y - 3}, 1, {ease: FlxEase.quadInOut, type: PINGPONG});
	}
}