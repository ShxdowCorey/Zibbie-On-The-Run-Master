package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.math.FlxMath;
import flixel.FlxObject;
import flixel.graphics.frames.FlxAtlasFrames;

class Box extends FlxSprite
{
	public static var broken:Bool;
	public function new(x:Float, y:Float):Void 
	{
		super(x, y);
		loadGraphic(AssetPaths.box_assets__png, true, 16, 16);
		animation.add('box', [0], 1);
		animation.add('weak', [1], 1);
		animation.add('break', [2, 3, 4, 5], 24, false);
		
		animation.play('box');
		
		health = 2;
		
		broken = false;
	}
	function updateThis(){
		if (this.health == 1){
			animation.play('weak');
		}
		else if (this.health <= 0){
			broken = true;
			animation.play('break');
		}
	}
	override function update(elapsed:Float){
		updateThis();
		super.update(elapsed);
		
		if (this.animation.curAnim.name == 'break' && this.animation.curAnim.finished){
			this.kill();
			Variables.score += 15;
		}
	}
}