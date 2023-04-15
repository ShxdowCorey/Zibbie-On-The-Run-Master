package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.math.FlxMath;
import flixel.FlxObject;
import flixel.graphics.frames.FlxAtlasFrames;

class Bat extends FlxSprite
{
	var count:Int = 0;
	var moveL:Bool = true;
	var moveR:Bool = false;
	var deathCounter:Int = 0;
	var idleCounter:Int = 0;
	
	var L:Bool = false;
	var R:Bool = true;
	
	var stopMoving:Int = 1;
	
	var addScore:Bool = false;
	
	var playerSpeed:Float = 100;
	var SPEED:Int = 100;//the lower this is, the lower the player will jump in vice versa
	var GRAVITY:Int = 450; //the higher this is, the higher the player will jump in vice versa
	public function new(x:Float, y:Float):Void 
	{
		super(x, y);
		loadGraphic(AssetPaths.bat_assets__png, true, 16, 16);
		animation.add('fly', [0, 1, 2, 3], 10, true);
		animation.add('blood', [6, 7, 8, 9, 10, 11], 22, false);
		
		animation.play('fly');
		antialiasing = false;
		health = 2;
		
		drag.x = SPEED * 8.5; 
		acceleration.y = GRAVITY * 1.5; //the lower this number is, the floatier the jump
		maxVelocity.set(playerSpeed, 400);
		drag.set(playerSpeed * 8.5, playerSpeed * 3);
	}
	function updateMovement()
	{
		if (moveL == true) {
			count++;
			this.x -= 0.5;
			flipX = false;
		}
		else if (moveR == true) {
			count--;
			this.x += 0.5;
			flipX = true;
		}
		
		if (count>=65) {
			moveL = false;
			moveR = true;
		}
		if (count<=0) {
			moveL = true;
			moveR = false;
		}
		
	}
	function updateIdleOrSomething(){
		if (L == true) {
			idleCounter++;
		}
		else if (R == true) {
			idleCounter--;
		}
		
		if (idleCounter>=FlxG.random.int(40, 60)) {
			L = false;
			R = true;
			stopMoving = 2;
		}
		if (idleCounter<=FlxG.random.int(0, -20)) {
			L = true;
			R = false;
			stopMoving = 1;
		}
	}
	function updateFollow(){
		if (this.overlaps(PlayState.charEyesL)){
			this.x += 0.5;
			flipX = true;
		}else if (this.overlaps(PlayState.charEyesR)){
			this.x -= 0.5;
			flipX = false;
		}
	}
    override function update(elapsed:Float){
		
		super.update(elapsed);
		
		updateIdleOrSomething();
		
		if(addScore == false){
			if (this.health <= 0){
				addScore = true;
				Variables.score+= 75;
				//Variables.killCount++;
				//Variables.curKillCount++;
				animation.play('blood');
			}else{
				updateFollow();
				updateMovement();
			}
		}
		if (this.animation.curAnim.name == 'blood' && this.animation.curAnim.finished){
			this.kill();
		}
    }
}