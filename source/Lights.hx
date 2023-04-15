package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;

class Lights extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.lights_assets__png, true, 16, 16);
		animation.add('lights', [0, 1], 2, true);
		
		animation.play('lights');
		antialiasing = false;
	}
	override public function update(elapsed:Float){
		super.update(elapsed);
	}
}