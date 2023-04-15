package;
import flixel.FlxSprite;

class RestartButton extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.ui_buttons__png, true, 16, 16);
		animation.add('restart', [15], 1);
		animation.play('restart');
		scrollFactor.set(0, 0);
	}
}