package;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.system.FlxSound;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxGroup.FlxTypedGroup;

class BossText extends FlxTypedGroup<FlxSprite>
{
	var txt:FlxTypeText;
	public static var done:Bool = false;
	
	public static var bossMessages:Array<String> = ["", "HEY ZIBBIE, THE ARGERECHER HAS TOLD ME ABOUT YOU. WELL, IF YOU WANT TO GET PASS, YOU'LL HAVE TO DEFEAT ME, AND THERES NO WAY YOU CAN JUMP ON MY HEAD 10 TIMES MUAHAHAHAHA"
	, "HELLO THERE ZIBBIE, IM NOT GONNA LET YOU PASS ME BECAUSE THE ARGERCHER TOLD ME ABOUT YOU, EVEN THOUGH HE STILL HASNT PAYED ME. ANYWAY, YOU CANT SHOOT ME 70 TIMES, ITS IMPOSSIBLE"
	, "WELL WELL WELL, IF IT ISNT ZIBBIE. YOU'RE ALREADY TOO LATE. MY MACHINE IS FINALLY COMPLETE AND NOTHING WILL STOP ME NOW. SAY GOODBYE TO KIBBIE FOREVER!!!"];
	
	public function new(bossNum:Int)
	{
		super();
		
		loadSounds();
		done = false;
		
		final textbox = new FlxSprite(0, 0).loadGraphic(AssetPaths.bossTextbox__png); add(textbox);
		
		PlayState.boss1Talk.play();
		
		txt = new FlxTypeText(0, 0, 320, bossMessages[bossNum]);
		txt.sounds = [FlxG.sound.load(AssetPaths.txt1__wav)];
		txt.setFormat(AssetPaths.pixel__ttf);
		txt.color = FlxColor.WHITE;
		txt.finishSounds = true;
		txt.size = 10;
		txt.start();
		add(txt);
	}
	function loadSounds(){
		
	}
	override function update(elapsed:Float){
		super.update(elapsed);
	}
}