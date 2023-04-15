package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.system.FlxSound;

class PauseGameSubstate extends FlxSubState
{
	var bossText:BossText;
	var pauseSound:FlxSound;
	var boundingBox:FlxSprite;
	public function new()
	{
		super();
	}
	override public function create()
	{
		super.create();
		
		if (PlayState.curLevel == 'boss'){
			bossText = new BossText(1); add(bossText);
		}
		else if (PlayState.curLevel == 'boss2'){
			bossText = new BossText(2); add(bossText);
		}
		else if (PlayState.curLevel == 'boss3'){
			bossText = new BossText(3); add(bossText);
		}
	}
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		
		if (BossText.done == true){
			close();
		}
	}
}