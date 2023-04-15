package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class ColoredBlock extends FlxSprite
{
	var count:Int = 0;
	public static var off:Bool = true;
	public static var on:Bool = false;
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.colored_blocks_assets__png, true, 16, 16);
		animation.add('empty', [0], 1);
		animation.add('activated', [1], 1);
		
		animation.play('empty');
		antialiasing = false;
	}
	function updateAnimations(){
		if (off == true && on == false){
			animation.play('empty');
		}
		else if (off == false && on == true){
			animation.play('activated');
		}
	}
	override public function update(elapsed:Float){
		updateAnimations();
		super.update(elapsed);
		
		if (off == true) {
			count++;
		}
		if (on == true) {
			count--;
		}
		if (count>=400) {
			off = false;
			on = true;
		}
		if (count<=0) {
			off = true;
			on = false;
		}
	}
}