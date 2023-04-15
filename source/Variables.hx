package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;

class Variables {
	public static var keys:Int = 0;
	public static var lives:Int = 4;
	public static var coins:Int = 0;
	public static var health:Int = 5;
	public static var hearts:Int = 0;
	public static var diamonds:Int = 0;
	public static var wrenches:Int = 0;
	public static var generators:Int = 0;
	public static var silverCoins:Int = 0;
	
	public static var neededKeys:Int = 0;
	public static var neededGenerators:Int = 0;
	
	public static var score:Int = 0;
	public static var bullets:Int = 0;
	
	public static var afterTitle:Bool = true;
	
	public static var boss1Health:Int = 100;
	public static var boss2Health:Int = 100;
	public static var boss3Health:Int = 100;
	
	public static var FreeplayMode:Bool = false;
	
	public static var showingHud:Bool = false;
	
	public static var curPowerup:String = '';
	
	//medals thingies
	public static var neededMushroomKills:Int = 54;
	public static var mushroomKills:Int = 0;
	
	public static var neededSpiderKills:Int = 47;
	public static var spiderKills:Int = 0;
	
	public static var neededGhostKills:Int = 92;
	public static var ghostKills:Int = 0;
	
	public static var neededBatsKills:Int = 43;
	public static var batsKills:Int = 0;
	
	public static var neededDiamonds:Int = 32;
	public static var collectedDimonds:Int = 0;
}