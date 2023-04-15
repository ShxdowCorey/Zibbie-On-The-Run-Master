package;
import flixel.FlxG;
import flixel.FlxSprite;

class Ladder extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.ladder__png);
		
	}
}