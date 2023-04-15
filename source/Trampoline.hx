package;
import flixel.FlxSprite;

class Trampoline extends FlxSprite
{

	public function new(x:Float, y:Float):Void 
	{
		super(x, y);
		loadGraphic(AssetPaths.trampoline_assets__png, true, 16, 16);
		animation.add('idle', [0], 1);
		animation.add('bounce', [1, 2, 1, 0], 20, false);
		animation.play('idle');
	}
}