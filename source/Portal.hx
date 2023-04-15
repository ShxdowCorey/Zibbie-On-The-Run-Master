package;
import flixel.FlxSprite;

class Portal extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.portal__png, true, 32, 48);
		animation.add('idle', [0, 1, 2, 3, 4, 5], 10, true);
		animation.play('idle');
	}
}