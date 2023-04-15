package;
import flixel.FlxSprite;

class AccessHUDButton extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.ui_buttons__png, true, 16, 16);
		animation.add('closed', [2], 1);
		animation.add('open', [5], 1);
		
		animation.play('closed');
		scrollFactor.set(0, 0);
	}
}