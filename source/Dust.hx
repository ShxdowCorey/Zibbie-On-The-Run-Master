package;

import flixel.FlxG;
import flixel.FlxSprite;

class Dust extends FlxSprite
{
    public function new(x:Float, y:Float) {
        super(x, y);


        this.x += 2;
        //this.y -=  8; 
		
		this.y += 6;

        loadGraphic(AssetPaths.dust_effect__png, true, 16, 16);
        animation.add("play", [0, 1, 2, 3, 4, 5, 6, 7], FlxG.random.int(19,24), false);
        animation.play('play');

        //flipX = FlxG.random.bool();
		flipX = true;
    }

    override function update(elapsed:Float) {
		
		this.alpha -= 0.1;
		
        if (animation.curAnim.finished){
            kill();
		}
        
        super.update(elapsed);
    }
}