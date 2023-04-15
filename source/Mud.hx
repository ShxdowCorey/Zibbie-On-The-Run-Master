package;
import flixel.FlxSprite;

class Mud extends FlxSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadGraphic(AssetPaths.mud_assets__png, true, 16, 16);
		animation.add('idle', [0, 1, 2, 3], 8, true);
		animation.play('idle');
	}
	override public function update(elapsed:Float){
		updateMud();
		super.update(elapsed);
	}
	function updateMud(){
		if (!this.overlaps(PlayState.char)){
			PlayState.char.playerSpeed = 100;
			PlayState.char.playerJump = 265;
		}
	}
}