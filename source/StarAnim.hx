package;
import flixel.FlxSprite;

class StarAnim extends FlxSprite
{
	public function new(x:Float, y:Float, white:Bool, framerate:Int):Void
	{
		super(x, y);
		if(white == false){
			loadGraphic(AssetPaths.star_anim__png, true, 640, 360);
		}else{
			loadGraphic(AssetPaths.star_anim_white__png, true, 640, 360);
		}
		animation.add('starin', [0, 1, 2, 3, 4, 5, 6, 7, 8], framerate, false);
		animation.add('starout', [8, 7, 6, 5, 4, 3, 2, 1, 0], framerate, false);
	}
	override function update(elapsed:Float){
		super.update(elapsed);
		
		if (this.animation.curAnim.name == 'starin'){
			if(this.animation.curAnim.finished){
				this.kill();
			}
		}
		else if (this.animation.curAnim.name == 'starout'){
			if(this.animation.curAnim.finished){
				this.kill();
			}
		}
	}
}