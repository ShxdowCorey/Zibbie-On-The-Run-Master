package;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class CharEyesL extends FlxSprite
{
	public function new(x:Float, y:Float):Void 
	{
		super(x, y);
		makeGraphic(40, 80, FlxColor.RED);
		alpha = 0;
		
		//antialiasing = true;
		//FlxTween.tween(this, {y: this.y + 8}, 0.75, {ease: FlxEase.quadInOut, type: PINGPONG});
	}
}