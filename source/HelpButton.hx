package;
import flixel.FlxSprite;

class HelpButton extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.ui_buttons__png, true, 16, 16);
		animation.add('info', [29], 1);
		animation.play('info');
		scrollFactor.set(0, 0);
	}
}