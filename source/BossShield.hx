package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class BossShield extends FlxSprite
{
	var counter:Int = 0;
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.bossShield__png, true, 32, 32);
		animation.add('pop', [0, 1, 2, 3], 16, false);
		animation.add('close', [2, 1, 0], 14, false);
		animation.play('pop');
	}
	override function update(elapsed:Float){
		super.update(elapsed);
		
		counter++;
		
		if (counter >= 550){
			counter = 0;
			this.animation.play('close');
			PlayState.boss.animation.play('idle');
		}
		
		this.y = PlayState.boss.y;
		
		if (this.animation.curAnim.name == 'close' && this.animation.curAnim.finished){
			this.kill();
		}
	}
}