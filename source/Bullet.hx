package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.math.FlxMath;
import flixel.FlxObject;
import flixel.system.FlxSound;
import flixel.graphics.frames.FlxAtlasFrames;

class Bullet extends FlxSprite
{
	var count:Int = 0;
	var moveL:Bool = false;
	var moveR:Bool = false;
	
	var hitGhost:FlxSound;
	var boxSound:FlxSound;
	var hitShield:FlxSound;
	public function new(x:Float, y:Float):Void 
	{
		super(x, y);
		loadSounds();
		loadGraphic(AssetPaths.bullet__png);
		//animation.add('bullet', [3], 1);
		//animation.play('bullet');
		
		y += 16;
		
		if (PlayState.char.flipX == false){
			moveR = true;
			x += 8;
		}
		else if (PlayState.char.flipX == true){
			this.flipX = true;
			moveL = true;
			
		}
	}
	function loadSounds(){
		hitGhost = new FlxSound();
		hitGhost = FlxG.sound.load(AssetPaths.hitghost__wav);
		
		boxSound = new FlxSound();
		boxSound = FlxG.sound.load(AssetPaths.box__wav);
		
		hitShield = new FlxSound();
		hitShield = FlxG.sound.load(AssetPaths.shield__wav);
	}
	function updateMovement()
	{
		count++;
		if (moveR == true){
			this.x += 3.5;
		}
		else if (moveL == true){
			this.x -= 3.5;
		}
		if (count >= 100){
			this.kill();
		}
		else if (this.overlaps(PlayState.levelGround)){
			this.kill();
		}
	}
	function killGhost(_, g:FlxSprite){
		hitGhost.play();
		Variables.score+= 20;
		
		if (g.animation.curAnim.name != 'blood'){
			g.health--;
			this.kill();
			Variables.ghostKills++;
		}
	}
	function killBat(_, b:FlxSprite){
		hitGhost.play();
		Variables.score+= 10;
		if (b.animation.curAnim.name != 'blood'){
			b.health--;
			this.kill();
			Variables.batsKills++;
		}
	}
	function killSpider(_, s:FlxSprite){
		hitGhost.play();
		Variables.score+= 15;
		if (s.animation.curAnim.name != 'blood'){
			s.health--;
			this.kill();
			Variables.spiderKills++;
		}
	}
	function destroyBox(_, b:FlxSprite){
		boxSound.play();
		Variables.score+= 5;
		if (b.animation.curAnim.name != 'break'){
			b.health--;
			this.kill();
		}
	}
	function hitBoss(_, b:FlxSprite){
		if(PlayState.curLevel == 'boss'){
			//this.kill();
			//hitGhost.play();
		}
		else if(PlayState.curLevel == 'boss2'){
			hitGhost.play();
			Variables.score += 10;
			if (b.animation.curAnim.name != 'die'){
				this.kill();
				Boss.Health--;
			}
		}
		else if(PlayState.curLevel == 'boss3'){
			hitGhost.play();
			Variables.score += 10;
			if (b.animation.curAnim.name != 'die'){
				this.kill();
				Boss.Health--;
			}
		}
	}
	function hitBossShield(_, s:FlxSprite){
		this.kill();
		hitShield.play();
	}
	override function update(elapsed:Float){
		super.update(elapsed);
		updateMovement();
		FlxG.overlap(this, PlayState.boss, hitBoss);
		FlxG.overlap(this, PlayState.batsGrp, killBat);
		FlxG.overlap(this, PlayState.ghostsGrp, killGhost);
		FlxG.overlap(this, PlayState.boxesGrp, destroyBox);
		FlxG.overlap(this, PlayState.spidersGrp, killSpider);
		FlxG.overlap(this, PlayState.bossShield, hitBossShield);
		
		if (this.isTouching(FlxObject.WALL)){
			this.kill();
		}
	}
}