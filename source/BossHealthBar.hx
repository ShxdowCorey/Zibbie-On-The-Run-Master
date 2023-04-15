package;
import flixel.FlxSprite;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class BossHealthBar extends FlxBar
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		makeGraphic(96, 6, FlxColor.RED);
		//createFilledBar(empty:FlxColor, fill:FlxColor, showBorder:Bool = false, border:FlxColor = FlxColor.WHITE):FlxBar
	}
	override function update(elapsed:Float){
		super.update(elapsed);
		
		if(PlayState.curLevel == 'boss1'){
			frameWidth = Variables.boss1Health;
		}
		else if(PlayState.curLevel == 'boss2'){
			frameWidth = Variables.boss2Health;
		}
		else if(PlayState.curLevel == 'boss3'){
			frameWidth = Variables.boss3Health;
		}
	}
}