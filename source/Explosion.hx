package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxSound;
import flixel.graphics.frames.FlxAtlasFrames;

class Explosion extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadSounds();
		loadGraphic(AssetPaths.explosion_assets__png, true, 32, 32);
		animation.add('explode', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 20, false);
		animation.play('explode');
		antialiasing = true;
	}
	function loadSounds(){
		
	}
	override function update(elapsed:Float){
		super.update(elapsed);
		
		if (this.animation.curAnim.name == 'explode' && this.animation.curAnim.finished){
			this.kill();
		}
	}
}