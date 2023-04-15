package;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class Inventory extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		//loadGraphic(AssetPaths.inventory__png);
	}
}