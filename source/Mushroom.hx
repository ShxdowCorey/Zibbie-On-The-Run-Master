package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.math.FlxVelocity;

class Mushroom extends FlxSprite
{
	var count:Int = 0;
	var moveL:Bool = true;
	var moveR:Bool = false;
	
	var deathCounter:Int = 0;
	var idleCounter:Int = 0;
	var CHASE_SPEED:Int = 50;
	
	var L:Bool = false;
	var R:Bool = true;
	
	var stopMoving:Int = 1;
	
	var addScore:Bool = false;
	
	var playerSpeed:Float = 100;
	var SPEED:Int = 100;//the lower this is, the lower the player will jump in vice versa i think
	var GRAVITY:Int = 450; //the higher this is, the higher the player will jump in vice versa i think
    public function new(x:Float, y:Float):Void
	{
        super(x, y);
        loadGraphic("assets/images/mushroom-walk.png", true, 16, 16);
        animation.add("idle", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 12, true);
		animation.add("die", [4, 10, 11, 12, 13, 14, 15, 16, 16, 16, 16, 16, 16], 22, false);
		
        animation.play('idle');
		
		health = 1;
		
		drag.x = SPEED * 8.5; 
		acceleration.y = GRAVITY * 1.5; //the lower this number is, the floatier the jump
		maxVelocity.set(playerSpeed, 400);
		drag.set(playerSpeed * 8.5, playerSpeed * 3);
    }
	function updateMovement()
	{
		if(stopMoving == 1){
			if (moveL == true) {
				count++;
				this.x -= 0.5;
				flipX = false;
			}
			if (moveR == true) {
				count--;
				this.x += 0.5;
				moveR = true;
				flipX = true;
			}
			if (count>=75) {
				moveL = false;
				moveR = true;
			}
			if (count<=0) {
				moveL = true;
				moveR = false;
			}
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
		
		updateFollow();
		updateIdleOrSomething();
		
		if (this.health <= 0){
			deathCounter++;
			this.animation.play('die');
		}
		else
		{
			updateFollow();
			updateMovement();
		}
		if (deathCounter >= 35){
			this.kill();
		}
    }
}