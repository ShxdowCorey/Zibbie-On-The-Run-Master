package;
import flixel.FlxSprite;

class Sparkle extends FlxSprite 
{

	public function new(x:Float, y:Float):Void 
	{
		super(x, y);
		loadGraphic(AssetPaths.sparkle_assets__png, true, 16, 16);
		animation.add('sparkle', [0, 1, 2, 3], 12, false);
		animation.play('sparkle');
	}
	override function update(elapsed:Float){
		super.update(elapsed);
		if (this.animation.curAnim.name == 'sparkle' && this.animation.curAnim.finished){
			this.kill();
		}
	}
}