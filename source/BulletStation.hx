package;
import flixel.FlxG;
import flixel.FlxSprite;

class BulletStation extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.bullet_station_assets__png, true, 16, 16);
		animation.add('loading', [0, 1, 2, 3, 4, 5, 6], 1.5, false);
		animation.add('loaded', [7], 1);
		
		animation.play('loaded');
	}
	override public function update(elapsed:Float){
		super.update(elapsed);
		
		if (this.animation.curAnim.name == 'loading' && this.animation.curAnim.finished){
			this.animation.play('loaded');
		}
	}
}