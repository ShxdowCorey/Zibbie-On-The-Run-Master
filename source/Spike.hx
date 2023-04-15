package;
import flixel.FlxSprite;

class Spike extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.spike__png);
		//animation.add('spike', [2], 1);
		//animation.play('spike');
		this.x += 2;
		this.y += 7;
	}
}