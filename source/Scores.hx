package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;

class Scores {
	//save files
	public static var lvl1Score:Int = 0;
	public static var lvl2Score:Int = 0;
	public static var lvl3Score:Int = 0;
	public static var lvl4Score:Int = 0;
	public static var lvlBossScore:Int = 0;
	
	public static var lvl5Score:Int = 0;
	public static var lvl6Score:Int = 0;
	public static var lvl7Score:Int = 0;
	public static var lvl8Score:Int = 0;
	
	public static var unlockedLvl2:Bool = true;
	public static var unlockedLvl3:Bool = true;
	public static var unlockedLvl4:Bool = true;
	public static var unlockedLvlBoss:Bool = true;
	
	public static var unlockedLvl5:Bool = true;
	public static var unlockedLvl6:Bool = true;
	public static var unlockedLvl7:Bool = true;
	public static var unlockedLvl8:Bool = true;
	public static var unlockedLvlBoss2:Bool = true;
}