package;
import flixel.FlxSprite;

class PauseButton extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.ui_buttons__png, true, 16, 16);
		animation.add('pause', [6], 1);
		animation.play('pause');
		scrollFactor.set(0, 0);
	}
}