package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.system.FlxSound;

class Generator extends FlxSprite
{
	var fixing:Bool = false;
	var touched:Bool = false;
	
	var fixedSound:FlxSound;
	var fixingSound:FlxSound;
	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		loadSounds();
		loadGraphic(AssetPaths.generator_assets__png, true, 16, 16);
		animation.add('broken', [0], 1);
		animation.add('fixing', [1, 2, 3, 4, 5, 6, 7, 8, 10], 1.5, false);
		animation.add('fixed', [11], 1);
		
		animation.play('broken');
		antialiasing = false;
	}
	function loadSounds(){
		fixedSound = new FlxSound();
		fixedSound = FlxG.sound.load(AssetPaths.generator__wav);
		
		fixingSound = new FlxSound();
		fixingSound = FlxG.sound.load(AssetPaths.fixing__wav);
	}
	override public function update(elapsed:Float){
		super.update(elapsed);
		
		if (this.animation.curAnim.name == 'fixing' && this.animation.curAnim.finished){
			animation.play('fixed');
		}
		
		if (PlayState.char.overlaps(this)){
			if (FlxG.keys.anyPressed([C])){
				if (this.animation.curAnim.name == 'fixing'){
					fixingSound.resume();
					this.animation.resume();
				}
			}
		}else{
			fixingSound.pause();
			this.animation.pause();
		}
		
		if (this.animation.curAnim.name == 'fixing'){
			if (fixing == false){
				if(PlayState.char.overlaps(this)){
					fixing = true;
					fixingSound.play();
				}
			}
		}
		else if (this.animation.curAnim.name == 'fixed'){
			if(touched == false){
				//fixing = false;
				
				if(Variables.wrenches > 0){
					Variables.wrenches--;
				}else{
					Variables.wrenches = 0;
				}
				Variables.score += 50;
				Variables.generators++;
				fixedSound.play();
				touched = true;
			}
		}
	}
}