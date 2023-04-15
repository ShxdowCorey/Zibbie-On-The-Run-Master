package;
import flixel.FlxSprite;

class Door extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.door__png, true, 32, 48);
		animation.add('idle', [0], 1);
		animation.add('open', [1], 1);
		animation.play('idle');
	}
}