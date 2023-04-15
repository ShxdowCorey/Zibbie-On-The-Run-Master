package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.FlxObject;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;
import flixel.tweens.FlxTween;
import flixel.tile.FlxTilemap;
import flixel.util.FlxCollision;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.addons.editors.tiled.TiledMap;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.addons.editors.tiled.TiledObjectLayer;

//import io.colyseus.Client;
//import io.colyseus.Room;
//import io.newgrounds.objects.ScoreBoard;
import io.newgrounds.NG;

class PlayState extends FlxState
{
	//public 
	public static var charX:Int = 0;
	public static var charY:Int = 0;
	public static var fakeBoxCount:Int = 0;
	public static var bossBulletCounter:Int = 0;
	public static var boss2BulletCounter:Int = 0;
	public static var boss2EnemyCounter:Int = 0;
	public static var boss3BulletCounter:Int = 0;
	public static var ghostBulletCounterL:Int = 0;
	public static var ghostBulletCounterR:Int = 0;

	public static var curWorld:String = '1';
	public static var curLevel:String = 'lvl1';
	public static var curTiledLevel:String = '';
	
	public static var map:TiledMap;
	public static var levelGround:FlxTilemap;
	public static var levelFlowers:FlxTilemap;
	
	public static var batsGrp:FlxTypedGroup<Bat>;
	public static var boxesGrp:FlxTypedGroup<Box>;
	public static var ghostsGrp:FlxTypedGroup<Ghost>;
	public static var spidersGrp:FlxTypedGroup<Spider>;
	public static var mushroomGrp:FlxTypedGroup<Mushroom>;
	
	public static var wrld1Card:FlxSprite;
	public static var helpScreen:FlxSprite;
	public static var pauseScreen:FlxSprite;
	
	public static var hitSound:FlxSound;
	
	public static var boss:Boss;
	public static var char:Player;
	public static var bullet:Bullet;
	public static var bossBullet:BossBullet;
	public static var bossShield:BossShield;
	public static var bossHealthBar:BossHealthBar;
	
	public static var bossHealthText:FlxText;
	
	public static var bossText:BossText;
	
	public static var boss1Talk:FlxSound;
	public static var boss2Talk:FlxSound;
	public static var boss3Talk:FlxSound;
	
	var enemyBullet:EnemyBullet;
	
	//groups
	var levelBounds:FlxGroup;
	
	//typed groups
	var mudGrp:FlxTypedGroup<Mud>;
	var keysGrp:FlxTypedGroup<Key>;
	var snowGrp:FlxTypedGroup<Snow>;
	var coinsGrp:FlxTypedGroup<Coin>;
	var speedGrp:FlxTypedGroup<Speed>;
	var applesGrp:FlxTypedGroup<Apple>;
	var spikesGrp:FlxTypedGroup<Spike>;
	var heartsGrp:FlxTypedGroup<Heart>;
	var lightsGrp:FlxTypedGroup<Lights>;
	var shieldGrp:FlxTypedGroup<Shield>;
	var laddersGrp:FlxTypedGroup<Ladder>;
	var sawsGrp:FlxTypedGroup<FlxSprite>;
	var portalsGrp:FlxTypedGroup<Portal>;
	var shieldsGrp:FlxTypedGroup<Shield>;
	var treesGrp:FlxTypedGroup<FlxSprite>;
	var wrenchesGrp:FlxTypedGroup<Wrench>;
	var hillsGrp:FlxTypedGroup<FlxSprite>;
	var cactusGrp:FlxTypedGroup<FlxSprite>;
	var diamondsGrp:FlxTypedGroup<Diamond>;
	var bushesGrp:FlxTypedGroup<FlxSprite>;
	var bulletsGrp:FlxTypedGroup<FlxSprite>;
	var hitBoxesGrp:FlxTypedGroup<EnemyHitbox>;
	var generatorsGrp:FlxTypedGroup<Generator>;
	var silverCoinsGrp:FlxTypedGroup<SilverCoin>;
	var trampolinesGrp:FlxTypedGroup<Trampoline>;
	var coloredBlocksGrp:FlxTypedGroup<ColoredBlock>;
	var bulletStationGrp:FlxTypedGroup<BulletStation>;
	
	//sprites
	var bg:FlxSprite;
	var pit:FlxSprite;
	var hudItems:FlxSprite;
	var secretBox:FlxSprite;
	var bossTextBox:FlxSprite;
	var boundarySprt:FlxSprite;
	var enemyHitBox:EnemyHitbox;
	public static var bossColider:FlxSprite;
	public static var anotherBossColider:FlxSprite;
	
	public static var boundCam:FlxSprite;
	
	
	//stupid hitboxes
	public static var hitbox1:FlxSprite;
	public static var hitbox2:FlxSprite;
	public static var hitbox3:FlxSprite;
	public static var hitbox4:FlxSprite;
	public static var hitbox5:FlxSprite;
	public static var hitbox6:FlxSprite;
	public static var hitbox7:FlxSprite;
	public static var hitbox8:FlxSprite;
	public static var hitbox9:FlxSprite;
	public static var hitbox10:FlxSprite;
	public static var hitbox11:FlxSprite;
	public static var hitbox12:FlxSprite;
	public static var hitbox13:FlxSprite;
	public static var hitbox14:FlxSprite;
	
	//objects
	var playSound:FlxObject;
	
	//portals
	var portal1:FlxSprite;
	var portal2:FlxSprite;
	var portal3:FlxSprite;
	var portal4:FlxSprite;
	var portal5:FlxSprite;
	var portal6:FlxSprite;
	var portal7:FlxSprite;
	var portal8:FlxSprite;
	var portal9:FlxSprite;
	var portal10:FlxSprite;
	
	//sounds
	var keySound:FlxSound;
	var coinSound:FlxSound;
	var trampSound:FlxSound;
	var portalSound:FlxSound;
	var killEnemy:FlxSound;
	var getBullets:FlxSound;
	var hitGhost:FlxSound;
	var wrenchSound:FlxSound;
	var geneSound:FlxSound;
	var heartSound:FlxSound;
	var diamondSound:FlxSound;
	var pauseSound:FlxSound;
	var allGeneratorSound:FlxSound;
	var appleSound:FlxSound;
	var noWrenches:FlxSound;
	var doorSound:FlxSound;
	var hitBoss:FlxSound;
	var boss_die:FlxSound;
	public static var explosion:FlxSound;
	
	//booleans
	var beginLvl:Bool = false;
	var enterDoor:Bool = false;
	var inBossLevel:Bool = false;
	
	//customs
	public static var charEyesL:CharEyesL;
	public static var charEyesR:CharEyesR;
	var door:Door;
	var hudMenu:HUD;
	var coinSparkle:Sparkle;
	
	var fakeBox:Box;
	override public function create()
	{
		super.create();
		configWorld();
		configLvls();
		loadSounds();
		posDoor();
		startGame();
		
		createBoss();
		createPortals();
		
		hudMenu = new HUD();
		add(hudMenu);
		
		FlxG.mouse.visible = false;
		hudItems = new FlxSprite(480, 270).loadGraphic(AssetPaths.cam__png);
		hudItems.scrollFactor.set(0, 0);
		hudItems.visible = false;
		add(hudItems);
		
		pauseScreen = new FlxSprite(480, 270).loadGraphic(AssetPaths.pauseScreen__png);
		pauseScreen.scrollFactor.set(0, 0);
		pauseScreen.visible = false;
		add(pauseScreen);
		
		helpScreen = new FlxSprite(480, 270).loadGraphic(AssetPaths.htpScreen__png);
		helpScreen.scrollFactor.set(0, 0);
		helpScreen.visible = false;
		add(helpScreen);
		
		playSound = new FlxObject();
		playSound.health = 1;
		
		Boss.dead = false;
	}
	function createPlayer(){
		if(curLevel == 'lvl1'){
			charX = -16;
			charY = 624;
		}
		else if (curLevel == 'lvl2'){
			charX = 1232;
			charY = 144;
		}
		else if (curLevel == 'lvl3'){
			charX = 48;
			charY = 160;
		}
		else if (curLevel == 'lvl4'){
			charX = 1200;
			charY = 624;
		}
		else if (curLevel == 'boss'){
			charX = 64;
			charY = 112;
		}
		else if (curLevel == 'lvl5'){
			charX = 1216;
			charY = 400;
		}
		else if (curLevel == 'lvl6'){
			charX = 624;
			charY = 464;
		}
		else if (curLevel == 'lvl7'){
			charX = 64;
			charY = 624;
		}
		else if (curLevel == 'lvl8'){
			charX = 64;
			charY = 624;
		}
		else if (curLevel == 'boss2'){
			charX = 64;
			charY = 112;
		}
		else if (curLevel == 'lvl9'){
			charX = 640;
			charY = 96;
		}
		else if (curLevel == 'lvl10'){
			charX = 480;
			charY = 624;
		}
		else if (curLevel == 'lvl11'){
			charX = 960;
			charY = 464;
		}
		else if (curLevel == 'lvl12'){
			charX = 624;
			charY = 352;
		}
		else if (curLevel == 'boss3'){
			charX = 32;
			charY = 112;
		}
		char = new Player(charX, charY);
		if(curLevel == 'lvl1'){
			char.canWalk = false;
		}
		add(char);
	}
	function posDoor(){
		door = new Door(0, 0);
		
		if (curLevel == 'lvl1'){
			door.setPosition(1216, 544);
		}
		else if (curLevel == 'lvl2'){
			door.setPosition(640, 96);
		}
		else if (curLevel == 'lvl3'){
			door.setPosition(624, 48);
		}
		else if (curLevel == 'lvl4'){
			door.setPosition(1168, 48);
		}
		else if (curLevel == 'boss'){
			door.setPosition(20000, -10000);
		}
		else if (curLevel == 'lvl5'){
			door.setPosition(16, 592);
		}
		else if (curLevel == 'lvl6'){
			door.setPosition(1056, 240);
		}
		else if (curLevel == 'lvl7'){
			door.setPosition(816, 96);
		}
		else if (curLevel == 'lvl8'){
			door.setPosition(16, 256);
		}
		else if (curLevel == 'boss2'){
			door.setPosition(20000, -10000);
		}
		else if (curLevel == 'lvl9'){
			door.setPosition(1200, 384);
		}
		else if (curLevel == 'lvl10'){
			door.setPosition(1152, 64);
		}
		else if (curLevel == 'lvl11'){
			door.setPosition(1120, 592);
		}
		else if (curLevel == 'lvl12'){
			door.setPosition(624, 592);
		}
		else if (curLevel == 'boss3'){
			door.setPosition(20000, -10000);
		}
	}
	function configLvls(){
		if (curLevel == 'lvl1'){
			curTiledLevel = '';
			Variables.neededKeys = 1;
			Variables.neededGenerators = 3;
		}
		else if (curLevel == 'lvl2'){
			curTiledLevel = 'Two';
			Variables.neededKeys = 3;
			Variables.neededGenerators = 5;
		}
		else if (curLevel == 'lvl3'){
			curTiledLevel = 'Three';
			Variables.neededKeys = 4;
			Variables.neededGenerators = 6;
		}
		else if (curLevel == 'lvl4'){
			curTiledLevel = 'Four';
			Variables.neededKeys = 6;
			Variables.neededGenerators = 8;
		}
		else if (curLevel == 'boss'){
			curTiledLevel = 'Boss';
			Variables.neededKeys = 0;
			Variables.neededGenerators = 0;
		}
		else if (curLevel == 'lvl5'){
			curTiledLevel = 'Five';
			Variables.neededKeys = 4;
			Variables.neededGenerators = 7;
		}
		else if (curLevel == 'lvl6'){
			curTiledLevel = 'Six';
			Variables.neededKeys = 5;
			Variables.neededGenerators = 9;
		}
		else if (curLevel == 'lvl7'){
			curTiledLevel = 'Seven';
			Variables.neededKeys = 3;
			Variables.neededGenerators = 5;
		}
		else if (curLevel == 'lvl8'){
			curTiledLevel = 'Eight';
			Variables.neededKeys = 6;
			Variables.neededGenerators = 6;
		}
		else if (curLevel == 'boss2'){
			curTiledLevel = 'BossTwo';
			Variables.neededKeys = 0;
			Variables.neededGenerators = 0;
		}
		else if (curLevel == 'lvl9'){
			curTiledLevel = 'Nine';
			Variables.neededKeys = 5;
			Variables.neededGenerators = 8;
		}
		else if (curLevel == 'lvl10'){
			curTiledLevel = 'Ten';
			Variables.neededKeys = 6;
			Variables.neededGenerators = 9;
		}
		else if (curLevel == 'lvl11'){
			curTiledLevel = 'Eleven';
			Variables.neededKeys = 7;
			Variables.neededGenerators = 12;
		}
		else if (curLevel == 'lvl12'){
			curTiledLevel = 'Twelve';
			Variables.neededKeys = 9;
			Variables.neededGenerators = 15;
		}
		else if (curLevel == 'boss3'){
			curTiledLevel = 'BossThree';
			Variables.neededKeys = 0;
			Variables.neededGenerators = 0;
		}
	}
	function configWorld(){
		if (curLevel == 'lvl1'){
			curWorld = '1';
		}
		else if (curLevel == 'lvl2'){
			curWorld = '1';
		}
		else if (curLevel == 'lvl3'){
			curWorld = '1';
		}
		else if (curLevel == 'lvl4'){
			curWorld = '1';
		}
		else if (curLevel == 'boss'){
			curWorld = '1';
		}
		else if (curLevel == 'lvl5'){
			curWorld = '2';
		}
		else if (curLevel == 'lvl6'){
			curWorld = '2';
		}
		else if (curLevel == 'lvl7'){
			curWorld = '2';
		}
		else if (curLevel == 'lvl8'){
			curWorld = '2';
		}
		else if (curLevel == 'boss2'){
			curWorld = '2';
		}
		else if (curLevel == 'lvl9'){
			curWorld = '3';
		}
		else if (curLevel == 'lvl10'){
			curWorld = '3';
		}
		else if (curLevel == 'lvl11'){
			curWorld = '3';
		}
		else if (curLevel == 'lvl12'){
			curWorld = '3';
		}
		else if (curLevel == 'boss3'){
			curWorld = '3';
		}
	}
	function createBoss(){
		if (curLevel == 'boss'){
			boss = new Boss(224, 96, 1);
			add(boss);
			
			final bossSprt = new FlxSprite(150, 40).loadGraphic(AssetPaths.bossIcon__png); add(bossSprt);
			
			FlxG.sound.playMusic(AssetPaths.Bitcrash__wav, 1, true);
			FlxG.sound.music.volume = 0.1;
			
			bossHealthText = new FlxText(169, 40, 0, "" + Boss.Health, 10); add(bossHealthText); bossHealthText.color = FlxColor.WHITE;
			bossHealthText.setFormat(AssetPaths.pixel__ttf);
			
			bossColider = new FlxSprite(320, 0).makeGraphic(16, 192); bossColider.immovable = true; add(bossColider);
			anotherBossColider = new FlxSprite(320, 0).makeGraphic(16, 192); add(anotherBossColider);
			
			openSubState(new PauseGameSubstate());
			
			PlayState.boss1Talk.onComplete = function (){
				BossText.done = true;
				remove(bossText);
				FlxG.sound.music.stop();
				FlxG.sound.playMusic(AssetPaths.Bits_and_Brawn__wav, 1, true);
				FlxG.sound.music.volume = 1;
			}
		}
		else if (curLevel == 'boss2'){
			boss = new Boss(272, 80, 2);
			add(boss);
			
			final bossSprt = new FlxSprite(150, 40).loadGraphic(AssetPaths.boss2Icon__png); add(bossSprt);
			
			FlxG.sound.playMusic(AssetPaths.Dramatic_Dunes__wav, 1, true);
			FlxG.sound.music.volume = 0.1;
			
			bossHealthText = new FlxText(169, 40, 0, "" + Boss.Health, 10); add(bossHealthText); bossHealthText.color = FlxColor.WHITE;
			bossHealthText.setFormat(AssetPaths.pixel__ttf);
			
			bossColider = new FlxSprite(320, 0).makeGraphic(16, 192); bossColider.immovable = true; add(bossColider);
			anotherBossColider = new FlxSprite(320, 0).makeGraphic(16, 192); add(anotherBossColider);
			
			openSubState(new PauseGameSubstate());
			
			PlayState.boss1Talk.onComplete = function (){
				BossText.done = true;
				remove(bossText);
				FlxG.sound.music.stop();
				FlxG.sound.playMusic(AssetPaths.Sinister_Sands__wav, 1, true);
				FlxG.sound.music.volume = 1;
			}
		}
		else if (curLevel == 'boss3'){
			boss = new Boss(272, 80, 3);
			add(boss);
			
			final bossSprt = new FlxSprite(150, 40 + 140).loadGraphic(AssetPaths.boss3Icon__png); add(bossSprt);
			
			FlxG.sound.playMusic(AssetPaths.Fahrenbyte__wav, 1, true);
			FlxG.sound.music.volume = 0.1;
			
			bossHealthText = new FlxText(169, 40 + 140, 0, "" + Boss.Health, 10); add(bossHealthText); bossHealthText.color = FlxColor.WHITE;
			
			bossColider = new FlxSprite(320, 0).makeGraphic(16, 192); bossColider.immovable = true; add(bossColider);
			anotherBossColider = new FlxSprite(320, 0).makeGraphic(16, 192); add(anotherBossColider);
			
			openSubState(new PauseGameSubstate());
			
			PlayState.boss1Talk.onComplete = function (){
				BossText.done = true;
				remove(bossText);
				FlxG.sound.music.stop();
				FlxG.sound.playMusic(AssetPaths.Argerecher__wav, 1, true);
				FlxG.sound.music.volume = 1;
			}
		}
	}
	function loadSounds(){
		coinSound = new FlxSound();
		coinSound = FlxG.sound.load(AssetPaths.coin__wav);
		
		hitBoss = new FlxSound();
		hitBoss = FlxG.sound.load(AssetPaths.hitboss__wav);
		
		diamondSound = new FlxSound();
		diamondSound = FlxG.sound.load(AssetPaths.diamond__wav);
		
		heartSound = new FlxSound();
		heartSound = FlxG.sound.load(AssetPaths.heart__wav);
		
		hitSound = new FlxSound();
		hitSound = FlxG.sound.load(AssetPaths.hurt__wav);
		
		trampSound = new FlxSound();
		trampSound = FlxG.sound.load(AssetPaths.bounce__wav);
		
		portalSound = new FlxSound();
		portalSound = FlxG.sound.load(AssetPaths.portal__wav);
		
		pauseSound = new FlxSound();
		pauseSound = FlxG.sound.load(AssetPaths.pause__wav);
		
		killEnemy = new FlxSound();
		killEnemy = FlxG.sound.load(AssetPaths.killenemy__wav);
		
		getBullets = new FlxSound();
		getBullets = FlxG.sound.load(AssetPaths.getbullets__wav);
		
		hitGhost = new FlxSound();
		hitGhost = FlxG.sound.load(AssetPaths.hitghost__wav);
		
		wrenchSound = new FlxSound();
		wrenchSound = FlxG.sound.load(AssetPaths.wrench__wav);
		
		geneSound = new FlxSound();
		geneSound = FlxG.sound.load(AssetPaths.generator__wav);
		
		allGeneratorSound = new FlxSound();
		allGeneratorSound = FlxG.sound.load(AssetPaths.all_generators__wav);
		
		appleSound = new FlxSound();
		appleSound = FlxG.sound.load(AssetPaths.apple__wav);
		
		noWrenches = new FlxSound();
		noWrenches = FlxG.sound.load(AssetPaths.nowrenches__wav);
		
		doorSound = new FlxSound();
		doorSound = FlxG.sound.load(AssetPaths.open_door__wav);
		
		keySound = new FlxSound();
		keySound = FlxG.sound.load(AssetPaths.key__wav);
		
		boss1Talk = new FlxSound();
		boss1Talk = FlxG.sound.load(AssetPaths.boss1Talk__wav);
		
		boss2Talk = new FlxSound();
		boss2Talk = FlxG.sound.load(AssetPaths.boss2Talk__wav);
		
		boss3Talk = new FlxSound();
		boss3Talk = FlxG.sound.load(AssetPaths.boss3Talk__wav);
		
		boss_die = new FlxSound();
		boss_die = FlxG.sound.load(AssetPaths.boss_die__wav);
		
		explosion = new FlxSound();
		explosion = FlxG.sound.load(AssetPaths.explosion__wav);
	}
	function makeStupidHitboxes(){
		hitbox1 = new FlxSprite(0, 512).makeGraphic(256, 160, FlxColor.RED); add(hitbox1); hitbox1.visible = false;
		hitbox2 = new FlxSprite(272, 496).makeGraphic(208, 176, FlxColor.RED); add(hitbox2); hitbox2.visible = false;
		hitbox3 = new FlxSprite(0, 368).makeGraphic(480, 128, FlxColor.RED); add(hitbox3); hitbox3.visible = false;
		hitbox4 = new FlxSprite(0, 160).makeGraphic(320, 208, FlxColor.RED); add(hitbox4); hitbox4.visible = false;
		hitbox5 = new FlxSprite(320, 160).makeGraphic(192, 208, FlxColor.RED); add(hitbox5); hitbox5.visible = false;
		hitbox6 = new FlxSprite(304, 0).makeGraphic(208, 128, FlxColor.RED); add(hitbox6); hitbox6.visible = false;
		hitbox7 = new FlxSprite(512, 0).makeGraphic(272, 128, FlxColor.RED); add(hitbox7); hitbox7.visible = false;
		hitbox8 = new FlxSprite(784, 0).makeGraphic(240, 128, FlxColor.RED); add(hitbox8); hitbox8.visible = false;
		hitbox9 = new FlxSprite(1024, 0).makeGraphic(256, 128, FlxColor.RED); add(hitbox9); hitbox9.visible = false;
		hitbox10 = new FlxSprite(976, 176).makeGraphic(176, 128, FlxColor.RED); add(hitbox10); hitbox10.visible = false;
		hitbox11 = new FlxSprite(784, 544).makeGraphic(192, 128, FlxColor.RED); add(hitbox10); hitbox11.visible = false;
		hitbox12 = new FlxSprite(1104, 336).makeGraphic(176, 80, FlxColor.RED); add(hitbox12); hitbox12.visible = false;
		hitbox13 = new FlxSprite(624, 176).makeGraphic(176, 128, FlxColor.RED); add(hitbox13); hitbox13.visible = false;
		hitbox14 = new FlxSprite(1072, 496).makeGraphic(208, 144, FlxColor.RED); add(hitbox14); hitbox14.visible = false;
	}
	function startGame(){
		if (curLevel == 'lvl1'){
			makeStupidHitboxes();
			FlxG.camera.fade(FlxColor.WHITE, 1, true);
		}else{
			FlxG.camera.fade(FlxColor.BLACK, 1, true);
		}
		boundCam = new FlxSprite(480, 270).makeGraphic(320, 180);
		if (curLevel == 'boss'){
			add(boundCam);
			inBossLevel = true;
			
			Boss.Health = 10;
			Boss.bossMovement = 1;
			Variables.bullets = 20;
			
		}
		else if (curLevel == 'boss2'){
			add(boundCam);
			inBossLevel = true;
			
			Boss.Health = 70;
			Boss.bossMovement = 2;
			Variables.bullets = 80;
			
		}
		else if (curLevel == 'boss3'){
			add(boundCam);
			inBossLevel = true;
			
			Boss.Health = 120;
			Boss.bossMovement = 3;
			Variables.bullets = 130;
		}
		else if (curLevel == 'lvl1' || curLevel == 'lvl2' || curLevel == 'lvl3' || curLevel == 'lvl4'){
			//playSound.health = 1;
			inBossLevel = false;
			FlxG.sound.playMusic(AssetPaths.Bitcrash__wav, 1, true);
		}
		else if (curLevel == 'lvl5' || curLevel == 'lvl6' || curLevel == 'lvl7' || curLevel == 'lvl8'){
			//playSound.health = 1;
			inBossLevel = false;
			FlxG.sound.playMusic(AssetPaths.Dramatic_Dunes__wav, 1, true);
		}
		else if (curLevel == 'lvl9' || curLevel == 'lvl10' || curLevel == 'lvl11' || curLevel == 'lvl12'){
			//playSound.health = 1;
			inBossLevel = false;
			FlxG.sound.playMusic(AssetPaths.Fahrenbyte__wav, 1, true);
		}
		
		enterDoor = false;
		//FlxG.sound.music.persist = true;
		levelBounds = FlxCollision.createCameraWall(FlxG.camera, true, 1);
		pit = new FlxSprite(0, 719).makeGraphic(1280, 16, FlxColor.BLACK); add(pit);
		
		map = new TiledMap("assets/data/levels/Level" + curTiledLevel + ".tmx");
		
		allGeneratorSound.onComplete = function (){
			FlxG.sound.music.fadeIn(2);
		}
		
		bg = new FlxSprite(479, 265).loadGraphic(AssetPaths.skyBG__png);
		bg.scrollFactor.set(0, 0);
		add(bg);
		
		final bgAlpha = new FlxSprite(479, 265).loadGraphic(AssetPaths.skyBG_alpha__png);
		bgAlpha.alpha = 0.7;
		bgAlpha.scrollFactor.set(0, 0);
		add(bgAlpha);
		
		final hillsLayer:TiledObjectLayer = cast(map.getLayer("bgHills"));
		hillsGrp = new FlxTypedGroup<FlxSprite>();
		for (h in hillsLayer.objects){
			if(curLevel == 'lvl1' || curLevel == 'lvl2' || curLevel == 'lvl3' || curLevel == 'lvl4' || curLevel == 'boss'){
				final hSprt = new FlxSprite(h.x, h.y).loadGraphic(AssetPaths.bgHill__png);
				hillsGrp.add(hSprt);
			}
			else if (curLevel == 'lvl5' || curLevel == 'lvl6' || curLevel == 'lvl7' || curLevel == 'lvl8' || curLevel == 'boss2'){
				final hSprt = new FlxSprite(h.x, h.y).loadGraphic(AssetPaths.desert_bgHill__png);
				hillsGrp.add(hSprt);
			}
			else if (curLevel == 'lvl9' || curLevel == 'lvl10' || curLevel == 'lvl11' || curLevel == 'lvl12' || curLevel == 'boss3'){
				final hSprt = new FlxSprite(h.x, h.y).loadGraphic(AssetPaths.snow_bgHill__png);
				hillsGrp.add(hSprt);
			}
		}
		add(hillsGrp);
		
		//final tut = new FlxSprite(0, 0).loadGraphic('assets/images/Level1Tut.png');
		
		final treesLayer:TiledObjectLayer = cast(map.getLayer("trees"));
		treesGrp = new FlxTypedGroup<FlxSprite>();
		for (t in treesLayer.objects){
			if(curLevel == 'lvl1' || curLevel == 'lvl2' || curLevel == 'lvl3' || curLevel == 'lvl4' || curLevel == 'boss'){
				final treeSprt = new FlxSprite(t.x, t.y).loadGraphic(AssetPaths.tree__png);
				treesGrp.add(treeSprt);
			}
			else if (curLevel == 'lvl5' || curLevel == 'lvl6' || curLevel == 'lvl7' || curLevel == 'lvl8' || curLevel == 'boss2'){
				final treeSprt = new FlxSprite(t.x, t.y).loadGraphic(AssetPaths.tree__png);
				treesGrp.add(treeSprt);
			}
			else if (curLevel == 'lvl9' || curLevel == 'lvl10' || curLevel == 'lvl11' || curLevel == 'lvl12' || curLevel == 'boss3'){
				final treeSprt = new FlxSprite(t.x, t.y).loadGraphic(AssetPaths.christmas_tree__png);
				treesGrp.add(treeSprt);
			}
		}
		add(treesGrp);
		
		final bushesLayer:TiledObjectLayer = cast(map.getLayer("bushes"));
		bushesGrp = new FlxTypedGroup<FlxSprite>();
		for (b in bushesLayer.objects){
			if(curLevel == 'lvl1' || curLevel == 'lvl2' || curLevel == 'lvl3' || curLevel == 'lvl4' || curLevel == 'boss'){
				final bSprt = new FlxSprite(b.x, b.y).loadGraphic(AssetPaths.bush__png);
				bushesGrp.add(bSprt);
			}
			else if (curLevel == 'lvl5' || curLevel == 'lvl6' || curLevel == 'lvl7' || curLevel == 'lvl8' || curLevel == 'boss2'){
				final bSprt = new FlxSprite(b.x, b.y).loadGraphic(AssetPaths.desert_bush__png);
				bushesGrp.add(bSprt);
			}
			else if (curLevel == 'lvl9' || curLevel == 'lvl10' || curLevel == 'lvl11' || curLevel == 'lvl12' || curLevel == 'boss3'){
				final bSprt = new FlxSprite(b.x, b.y).loadGraphic(AssetPaths.snow_bush__png);
				bushesGrp.add(bSprt);
			}
		}
		add(bushesGrp);
		
		if (curLevel == 'lvl9' || curLevel == 'lvl10' || curLevel == 'lvl11' || curLevel == 'lvl12' || curLevel == 'boss3'){
			final snowLayer:TiledObjectLayer = cast(map.getLayer("snow"));
			snowGrp = new FlxTypedGroup<Snow>();
			for (s in snowLayer.objects){
				final sSprt = new Snow(s.x, s.y);
				snowGrp.add(sSprt);
			}
			//add(snowGrp);
			//I WANTED TO ADD SNOW, BUT IT WAS LAGGING LIKE CRAZY!!!
		}
		
		final coinsLayer:TiledObjectLayer = cast(map.getLayer("coins"));
		coinsGrp = new FlxTypedGroup<Coin>();
		for (coin in coinsLayer.objects){
			final coinSprt = new Coin(coin.x, coin.y);
			coinsGrp.add(coinSprt);
		}
		add(coinsGrp);
		
		final sCoinsLayer:TiledObjectLayer = cast(map.getLayer("silvercoins"));
		silverCoinsGrp = new FlxTypedGroup<SilverCoin>();
		for (s in sCoinsLayer.objects){
			final sCoinSprt = new SilverCoin(s.x, s.y);
			silverCoinsGrp.add(sCoinSprt);
		}
		add(silverCoinsGrp);
		
		final shieldsLayer:TiledObjectLayer = cast(map.getLayer("shields"));
		shieldsGrp = new FlxTypedGroup<Shield>();
		for (s in shieldsLayer.objects){
			final sSprt = new Shield(s.x, s.y);
			shieldsGrp.add(sSprt);
		}
		//add(shieldsGrp);
		
		final speedLayer:TiledObjectLayer = cast(map.getLayer("speed"));
		speedGrp = new FlxTypedGroup<Speed>();
		for (s in speedLayer.objects){
			final sSprt = new Speed(s.x, s.y);
			speedGrp.add(sSprt);
		}
		//add(speedGrp);
		
		final diamondsLayer:TiledObjectLayer = cast(map.getLayer("diamonds"));
		diamondsGrp = new FlxTypedGroup<Diamond>();
		for (d in diamondsLayer.objects){
			final dSprt = new Diamond(d.x, d.y);
			diamondsGrp.add(dSprt);
		}
		add(diamondsGrp);
		
		final bulletsLayer:TiledObjectLayer = cast(map.getLayer("bullets"));
		bulletsGrp = new FlxTypedGroup<FlxSprite>();
		for (b in bulletsLayer.objects){
			final bullSprt = new FlxSprite(b.x, b.y);
			bullSprt.loadGraphic(AssetPaths.bullets__png, true, 16, 16);
			bullSprt.animation.add('pickupBullet', [2], 1);
			bullSprt.animation.play('pickupBullet');
			FlxTween.tween(bullSprt, {y: bullSprt.y - 7}, 0.75, {ease: FlxEase.quadInOut, type: PINGPONG});
			bulletsGrp.add(bullSprt);
		}
		add(bulletsGrp);
		
		final spikesLayer:TiledObjectLayer = cast(map.getLayer("spikes"));
		spikesGrp = new FlxTypedGroup<Spike>();
		for (spike in spikesLayer.objects){
			final spkSprt = new Spike(spike.x, spike.y);
			spkSprt.immovable = true;
			spikesGrp.add(spkSprt);
		}
		add(spikesGrp);
		
		final trampolinesLayer:TiledObjectLayer = cast(map.getLayer("trampolines"));
		trampolinesGrp = new FlxTypedGroup<Trampoline>();
		for (i in trampolinesLayer.objects){
			final trampSprt = new Trampoline(i.x, i.y);
			trampolinesGrp.add(trampSprt);
		}
	
		add(trampolinesGrp);
		
		final boxesLayer:TiledObjectLayer = cast(map.getLayer("boxes"));
		boxesGrp = new FlxTypedGroup<Box>();
		for (b in boxesLayer.objects){
			final bSprt = new Box(b.x, b.y);
			bSprt.immovable = true;
			boxesGrp.add(bSprt);
		}
		add(boxesGrp);
		
		final cbsLayer:TiledObjectLayer = cast(map.getLayer("coloredBlocks"));
		coloredBlocksGrp = new FlxTypedGroup<ColoredBlock>();
		for (cb in cbsLayer.objects){
			final cbSprt = new ColoredBlock(cb.x, cb.y);
			cbSprt.immovable = true;
			coloredBlocksGrp.add(cbSprt);
		}
		//add(coloredBlocksGrp);
		
		final heartsLayer:TiledObjectLayer = cast(map.getLayer("hearts"));
		heartsGrp = new FlxTypedGroup<Heart>();
		for (heart in heartsLayer.objects){
			final heartSprt = new Heart(heart.x, heart.y);
			FlxTween.tween(heartSprt, {y: heartSprt.y - 4}, 1.25, {ease: FlxEase.quadInOut, type: PINGPONG});
			heartsGrp.add(heartSprt);
		}
		add(heartsGrp);
		
		final appsLayer:TiledObjectLayer = cast(map.getLayer("apples"));
		applesGrp = new FlxTypedGroup<Apple>();
		for (a in appsLayer.objects){
			final aSprt = new Apple(a.x, a.y);
			FlxTween.tween(aSprt, {y: aSprt.y - 4}, 1, {ease: FlxEase.quadInOut, type: PINGPONG});
			applesGrp.add(aSprt);
		}
		add(applesGrp);
		
		final portalsLayer:TiledObjectLayer = cast(map.getLayer("portals"));
		portalsGrp = new FlxTypedGroup<Portal>();
		for (portal in portalsLayer.objects){
			final portalSprt = new Portal(portal.x, portal.y);
			portalsGrp.add(portalSprt);
		}
		add(portalsGrp);
		
		final bsLayer:TiledObjectLayer = cast(map.getLayer("bullet_stations"));
		bulletStationGrp = new FlxTypedGroup<BulletStation>();
		for (b in bsLayer.objects){
			final bsSprt = new BulletStation(b.x, b.y);
			bulletStationGrp.add(bsSprt);
		}
		add(bulletStationGrp);
		
		/*
		final laddersLayer:TiledObjectLayer = cast(map.getLayer("ladders"));
		laddersGrp = new FlxTypedGroup<Ladder>();
		for (l in laddersLayer.objects){
			final lsprt = new Ladder(l.x, l.y);
			laddersGrp.add(lsprt);
		}
		add(laddersGrp);
		*/
		
		final ghostsLayer:TiledObjectLayer = cast(map.getLayer("ghosts"));
		ghostsGrp = new FlxTypedGroup<Ghost>();
		hitBoxesGrp = new FlxTypedGroup<EnemyHitbox>();
		for (g in ghostsLayer.objects){
			final gSprt = new Ghost(g.x, g.y);
			ghostsGrp.add(gSprt);
			
			enemyHitBox = new EnemyHitbox(g.x - 48, g.y);
			hitBoxesGrp.add(enemyHitBox);
		}
		add(ghostsGrp);
		//add(hitBoxesGrp);
		
		final mushroomsLayer:TiledObjectLayer = cast(map.getLayer("mushrooms"));
		mushroomGrp = new FlxTypedGroup<Mushroom>();
		for (m in mushroomsLayer.objects){
			final mSprt = new Mushroom(m.x, m.y);
			mushroomGrp.add(mSprt);
		}
		add(mushroomGrp);
		
		final batsLayer:TiledObjectLayer = cast(map.getLayer("bats"));
		batsGrp = new FlxTypedGroup<Bat>();
		for (b in batsLayer.objects){
			final bSprt = new Bat(b.x, b.y);
			batsGrp.add(bSprt);
		}
		add(batsGrp);
		
		final spidersLayer:TiledObjectLayer = cast(map.getLayer("spiders"));
		spidersGrp = new FlxTypedGroup<Spider>();
		for (s in spidersLayer.objects){
			final sSprt = new Spider(s.x, s.y);
			spidersGrp.add(sSprt);
		}
		add(spidersGrp);
		
		final wrenchesLayer:TiledObjectLayer = cast(map.getLayer("wrenches"));
		wrenchesGrp = new FlxTypedGroup<Wrench>();
		for (wrench in wrenchesLayer.objects){
			final wrenchSprt = new Wrench(wrench.x, wrench.y);
			wrenchesGrp.add(wrenchSprt);
		}
		add(wrenchesGrp);
		
		final generatorsLayer:TiledObjectLayer = cast(map.getLayer("generators"));
		generatorsGrp = new FlxTypedGroup<Generator>();
		for (generator in generatorsLayer.objects){
			final geneSprt = new Generator(generator.x, generator.y);
			generatorsGrp.add(geneSprt);
		}
		add(generatorsGrp);
		
		final keysLayer:TiledObjectLayer = cast(map.getLayer("keys"));
		keysGrp = new FlxTypedGroup<Key>();
		for (k in keysLayer.objects){
			final kSprt = new Key(k.x, k.y);
			keysGrp.add(kSprt);
		}
		add(keysGrp);
		
		final cactusLayer:TiledObjectLayer = cast(map.getLayer("cactus"));
		cactusGrp = new FlxTypedGroup<FlxSprite>();
		for (c in cactusLayer.objects){
			final cSprt = new FlxSprite(c.x, c.y).loadGraphic(AssetPaths.cactus__png);
			cactusGrp.add(cSprt);
		}
		add(cactusGrp);
		
		if(curLevel == 'lvl9' || curLevel == 'lvl10' || curLevel == 'lvl11' || curLevel == 'lvl12' || curLevel == 'boss3'){
			final lightsLayer:TiledObjectLayer = cast(map.getLayer("lights"));
			lightsGrp = new FlxTypedGroup<Lights>();
			for (l in lightsLayer.objects){
				final lSprt = new Lights(l.x, l.y);
				lightsGrp.add(lSprt);
			}
			add(lightsGrp);
		}
		
		if(curLevel == 'lvl1' || curLevel == 'lvl2' || curLevel == 'lvl3' || curLevel == 'lvl4' || curLevel == 'boss'){
			levelGround = new FlxTilemap();
			levelGround.loadMapFromCSV("assets/data/levels/Level" + curTiledLevel + "_ground.csv", AssetPaths.tiles__png, 16, 16);
			add(levelGround);
			
			levelFlowers = new FlxTilemap();
			levelFlowers.loadMapFromCSV("assets/data/levels/Level" + curTiledLevel + "_flowers.csv", AssetPaths.flower_assets__png, 16, 16);
			add(levelFlowers);
		}
		else if(curLevel == 'lvl5' || curLevel == 'lvl6' || curLevel == 'lvl7' || curLevel == 'lvl8' || curLevel == 'boss2'){
			levelGround = new FlxTilemap();
			levelGround.loadMapFromCSV("assets/data/levels/Level" + curTiledLevel + "_ground.csv", AssetPaths.desert_tiles__png, 16, 16);
			add(levelGround);
			
			levelFlowers = new FlxTilemap();
			levelFlowers.loadMapFromCSV("assets/data/levels/Level" + curTiledLevel + "_flowers.csv", AssetPaths.flower_assets__png, 16, 16);
			add(levelFlowers);
		}
		else if(curLevel == 'lvl9' || curLevel == 'lvl10' || curLevel == 'lvl11' || curLevel == 'lvl12' || curLevel == 'boss3'){
			levelGround = new FlxTilemap();
			levelGround.loadMapFromCSV("assets/data/levels/Level" + curTiledLevel + "_ground.csv", AssetPaths.snow_assets__png, 16, 16);
			add(levelGround);
			
			levelFlowers = new FlxTilemap();
			levelFlowers.loadMapFromCSV("assets/data/levels/Level" + curTiledLevel + "_flowers.csv", AssetPaths.flower_assets__png, 16, 16);
			add(levelFlowers);
		}
		
		add(door);
		
		if (curLevel == 'boss3'){
			final kibbie = new FlxSprite(154, 58).loadGraphic(AssetPaths.kibbie_scared__png); add(kibbie);
			final cage = new FlxSprite(144, 0).loadGraphic(AssetPaths.cage__png); add(cage);
			final machine = new FlxSprite(128, 96).loadGraphic(AssetPaths.machine__png); add(machine);
		}
		
		createPlayer();
		
		charEyesL = new CharEyesL(charX - 32, charY - 32);
		add(charEyesL);
		
		charEyesR = new CharEyesR(charX + 8, charY - 32);
		add(charEyesR);
		
		final mudLayer:TiledObjectLayer = cast(map.getLayer("mud"));
		mudGrp = new FlxTypedGroup<Mud>();
		for (m in mudLayer.objects){
			final mSprt = new Mud(m.x, m.y);
			mudGrp.add(mSprt);
		}
		add(mudGrp);
		
		if(curLevel == 'lvl8'){
			secretBox = new FlxSprite(0, 0).makeGraphic(480, 48, FlxColor.BLACK);
			secretBox.visible = false;
			add(secretBox);
			
			fakeBox = new Box(480, 32);
			fakeBox.immovable = true;
			add(fakeBox);
		}
		//follows teh camera i think
		if(curLevel == 'lvl1' || curLevel == 'lvl2' || curLevel == 'lvl3' || curLevel == 'lvl4'){
			FlxG.camera.zoom = 4;
			FlxG.camera.follow(char, LOCKON, 0.5);
			FlxG.camera.setScrollBoundsRect(0, 0, levelGround.width, levelGround.height);
		}
		else if(curLevel == 'lvl5' || curLevel == 'lvl6' || curLevel == 'lvl7' || curLevel == 'lvl8'){
			FlxG.camera.zoom = 4;
			FlxG.camera.follow(char, LOCKON, 0.5);
			FlxG.camera.setScrollBoundsRect(0, 0, levelGround.width, levelGround.height);
		}
		else if(curLevel == 'lvl9' || curLevel == 'lvl10' || curLevel == 'lvl11' || curLevel == 'lvl12'){
			FlxG.camera.zoom = 4;
			FlxG.camera.follow(char, LOCKON, 0.5);
			FlxG.camera.setScrollBoundsRect(0, 0, levelGround.width, levelGround.height);
		}
		else if(curLevel == 'boss' || curLevel == 'boss2' || curLevel == 'boss3'){
			FlxG.camera.zoom = 4;
			FlxG.camera.follow(boundCam);
			FlxG.camera.setScrollBoundsRect(0, 0, boundCam.width, boundCam.height);
		}
	}
	function collectCoin(_, coin:FlxSprite){
		coinSound.play(true);
		Variables.coins++;
		coin.kill();
		
		coinSparkle = new Sparkle(coin.x, coin.y);
		add(coinSparkle);
	}
	function collectSilverCoin(_, s:FlxSprite){
		coinSound.play(true);
		Variables.coins += 3;
		Variables.silverCoins++;
		s.kill();
		
		coinSparkle = new Sparkle(s.x, s.y);
		add(coinSparkle);
	}
	function collectHeart(_, heart:FlxSprite){
		heartSound.play(true);
		
		if (Variables.health <= 4){
			Variables.health++;
		}
		else if (Variables.health == 5){
			Variables.health = 5;
		}
		heart.kill();
		
		coinSparkle = new Sparkle(heart.x, heart.y);
		add(coinSparkle);
	}
	function collectApple(_, a:FlxSprite){
		a.kill();
		appleSound.play(true);
		
		if (Variables.health <= 3){
			Variables.health += 2;
		}
		else if (Variables.health <= 4){
			Variables.health++;
		}
		else if (Variables.health == 5){
			Variables.health = 5;
		}
		coinSparkle = new Sparkle(a.x, a.y);
		add(coinSparkle);
	}
	function collectDiamond(_, d:FlxSprite){
		Variables.diamonds++;
		diamondSound.play(true);
		d.kill();
		Variables.collectedDimonds++;
		
		coinSparkle = new Sparkle(d.x, d.y);
		add(coinSparkle);
	}
	function collectWrench(_, w:FlxSprite){
		wrenchSound.play(true);
		Variables.wrenches++;
		w.kill();
		
		coinSparkle = new Sparkle(w.x, w.y);
		add(coinSparkle);
	}
	function collectKey(_, k:FlxSprite){
		keySound.play(true);
		Variables.keys++;
		k.kill();
		
		coinSparkle = new Sparkle(k.x, k.y);
		add(coinSparkle);
	}
	function fixGenerator(_, generator:FlxSprite){
		var touched:Bool = false;
		var touchedAgain:Bool = false;
		
		if (Variables.wrenches == 0){
			Variables.wrenches = 0;
		}
		else if (Variables.wrenches >= 1){
			if (touched == false && generator.animation.curAnim.name != 'fixed'){
				if (FlxG.keys.anyPressed([C])){
					if (char.overlaps(generator)){
						if (touchedAgain == false){
							generator.animation.play('fixing');
							touched = true;
							touchedAgain = true;
							//Variables.wrenches = Variables.wrenches;
						}
					}else{
						touched = false;
					}
				}
			}
		}
		else
		{
			noWrenches.play(true);
		}
	}
	function touchSpike(_, spike:FlxSprite){
		char.hitSpike();
		if (char.alpha == 1){
			if(Variables.curPowerup != 'shield'){
				char.alpha = 0.5;
				hitSound.play(true);
				Variables.health -= 1;
			}
		}
	}
	function touchCactus(_, c:FlxSprite){
		char.hitSpike();
		if (char.alpha == 1){
			if(Variables.curPowerup != 'shield'){
				char.alpha = 0.5;
				hitSound.play(true);
				Variables.health -= 1;
			}
		}
	}
	function touchLadder(_, l:FlxSprite){
		if (FlxG.keys.anyJustPressed([SPACE])){
			if (char.overlaps(l)){
				char.velocity.y = 0;
			}
		}
		else if (FlxG.keys.anyJustPressed([R])){
			if (char.velocity.y == 0){
				char.velocity.y -= 5;
			}
		}
		else if (FlxG.keys.anyJustPressed([F])){
			if (char.velocity.y == 0){
				char.velocity.y += 5;
			}
		}
	}
	function createPortals(){
		portal1 = new FlxSprite(0, 0).makeGraphic(32, 48, FlxColor.BLUE); add(portal1); portal1.alpha = 0;
		portal2 = new FlxSprite(0, 0).makeGraphic(32, 48, FlxColor.BLUE); add(portal2); portal2.alpha = 0;
		portal3 = new FlxSprite(0, 0).makeGraphic(32, 48, FlxColor.BLUE); add(portal3); portal3.alpha = 0;
		portal4 = new FlxSprite(0, 0).makeGraphic(32, 48, FlxColor.BLUE); add(portal4); portal4.alpha = 0;
		portal5 = new FlxSprite(0, 0).makeGraphic(32, 48, FlxColor.BLUE); add(portal5); portal5.alpha = 0;
		portal6 = new FlxSprite(0, 0).makeGraphic(32, 48, FlxColor.BLUE); add(portal6); portal6.alpha = 0;
		portal7 = new FlxSprite(0, 0).makeGraphic(32, 48, FlxColor.BLUE); add(portal7); portal7.alpha = 0;
		portal8 = new FlxSprite(0, 0).makeGraphic(32, 48, FlxColor.BLUE); add(portal8); portal8.alpha = 0;
		portal9 = new FlxSprite(0, 0).makeGraphic(32, 48, FlxColor.BLUE); add(portal9); portal9.alpha = 0;
		portal10 = new FlxSprite(0, 0).makeGraphic(32, 48, FlxColor.BLUE); add(portal10); portal10.alpha = 0;
		
		posPortals();
	}
	function posPortals(){
		if (curLevel == 'lvl1'){
			portal1.setPosition(208, 592);
			portal2.setPosition(288, 592);
			portal3.setPosition(176, 16);
			portal4.setPosition(304, 64);
			portal5.setPosition(1216, 64);
			portal6.setPosition(512, 592);
			portal7.setPosition(336, 320);
			portal8.setPosition(1248, 240);
			portal9.setPosition(1232, 352);
			portal10.setPosition(512, 208);
		}
		else if (curLevel == 'lvl2'){
			portal1.setPosition(992, 112);
			portal2.setPosition(928, 288);
			portal3.setPosition(1200, 400);
			portal4.setPosition(16, 64);
			portal5.setPosition(16, 208);
			portal6.setPosition(1232, 592);
			portal7.setPosition(16, 592);
			portal8.setPosition(544, 96);
			portal9.setPosition(592, 288);
			portal10.setPosition(320, 272);
		}
		else if (curLevel == 'lvl3'){
			portal1.setPosition(448, 272);
			portal2.setPosition(160, 496);
			portal3.setPosition(896, 544);
			portal4.setPosition(1024, 256);
			portal5.setPosition(912, 320);
			portal6.setPosition(0, 304);
			portal7.setPosition(1216, 112);
			portal8.setPosition(1184, 544);
			portal9.setPosition(288, 592);
			portal10.setPosition(160, 400);
		}
		else if (curLevel == 'lvl4'){
			portal1.setPosition(1232, 592);
			portal2.setPosition(16, 592);
			portal3.setPosition(384, 592);
			portal4.setPosition(160, 368);
			portal5.setPosition(0, 368);
			portal6.setPosition(656, 64);
			portal7.setPosition(64, 32);
			portal8.setPosition(1088, 240);
			portal9.setPosition(1232, 336);
			portal10.setPosition(1056, 464);
		}
		else if (curLevel == 'lvl5'){
			portal1.setPosition(1120, 112);
			portal2.setPosition(256, 272);
			portal3.setPosition(720, 64);
			portal4.setPosition(352, 416);
			portal5.setPosition(736, 320);
			portal6.setPosition(192, 592);
			portal7.setPosition(880, 592);
			portal8.setPosition(320, 144);
			portal9.setPosition(1232, 528);
			portal10.setPosition(112, 592);
		}
		else if (curLevel == 'lvl6'){
			portal1.setPosition(608, 272);
			portal2.setPosition(896, 432);
			portal3.setPosition(16, 432);
			portal4.setPosition(656, 112);
			portal5.setPosition(1216, 432);
			portal6.setPosition(16, 592);
			portal7.setPosition(256, 112);
			portal8.setPosition(832, 592);
			portal9.setPosition(336, 112);
			portal10.setPosition(1216, 112);
		}
		else if (curLevel == 'lvl7'){
			portal1.setPosition(320, 368);
			portal2.setPosition(1088, 224);
			portal3.setPosition(800, 224);
			portal4.setPosition(1232, 592);
			portal5.setPosition(576, 592);
			portal6.setPosition(416, 96);
			portal7.setPosition(624, 80);
			portal8.setPosition(16, 400);
			portal9.setPosition(160, 224);
			portal10.setPosition(1168, 432);
		}
		else if (curLevel == 'lvl8'){
			portal1.setPosition(192, 272);
			portal2.setPosition(32, 144);
			portal3.setPosition(304, 272);
			portal4.setPosition(720, 592);
			portal5.setPosition(1024, 592);
			portal6.setPosition(912, 432);
			portal7.setPosition(608, 592);
			portal8.setPosition(640, 112);
			portal9.setPosition(1168, 64);
			portal10.setPosition(1232, 592);
		}
		else if (curLevel == 'lvl9'){
			portal1.setPosition(704, 64);
			portal2.setPosition(80, 592);
			portal3.setPosition(544, 64);
			portal4.setPosition(864, 256);
			portal5.setPosition(144, 48);
			portal6.setPosition(368, 432);
			portal7.setPosition(48, 272);
			portal8.setPosition(704, 432);
			portal9.setPosition(1184, 112);
			portal10.setPosition(1184, 592);
		}
		else if (curLevel == 'lvl10'){
			portal1.setPosition(80, 528);
			portal2.setPosition(384, 416);
			portal3.setPosition(752, 528);
			portal4.setPosition(960, 400);
			portal5.setPosition(1152, 528);
			portal6.setPosition(1184, 208);
			portal7.setPosition(640, 272);
			portal8.setPosition(320, 144);
			portal9.setPosition(800, 96);
			portal10.setPosition(64, 64);
		}
		else if (curLevel == 'lvl11'){
			portal1.setPosition(1120, 432);
			portal2.setPosition(640, 592);
			portal3.setPosition(160, 592);
			portal4.setPosition(640, 272);
			portal5.setPosition(480, 432);
			portal6.setPosition(160, 160);
			portal7.setPosition(1120, 112);
			portal8.setPosition(480, 112);
			portal9.setPosition(800, 112);
			portal10.setPosition(160, 400);
		}
		else if (curLevel == 'lvl12'){
			portal1.setPosition(672, 320);
			portal2.setPosition(624, 112);
			portal3.setPosition(16, 16);
			portal4.setPosition(1232, 592);
			portal5.setPosition(1232, 16);
			portal6.setPosition(16, 432);
			portal7.setPosition(16, 272);
			portal8.setPosition(1232, 432);
			portal9.setPosition(1232, 272);
			portal10.setPosition(16, 592);
		}
	}
	function updatePortals(){
		if (FlxG.keys.anyJustPressed([SPACE])){
			if (curLevel == 'lvl1'){
				if (char.overlaps(portal1)){
					portalSound.play();
					char.setPosition(336, 624);
				}
				else if (char.overlaps(portal2)){
					portalSound.play();
					char.setPosition(160, 624);
				}
				else if (char.overlaps(portal3)){
					portalSound.play();
					char.setPosition(352, 96);
				}
				else if (char.overlaps(portal4)){
					portalSound.play();
					char.setPosition(144, 48);
				}
				else if (char.overlaps(portal5)){
					portalSound.play();
					char.setPosition(560, 624);
				}
				else if (char.overlaps(portal6)){
					portalSound.play();
					char.setPosition(1184, 96);
				}
				else if (char.overlaps(portal7)){
					portalSound.play();
					char.setPosition(1216, 272);
				}
				else if (char.overlaps(portal8)){
					portalSound.play();
					char.setPosition(384, 352);
				}
				else if (char.overlaps(portal9)){
					portalSound.play();
					char.setPosition(544, 240);
				}
				else if (char.overlaps(portal10)){
					portalSound.play();
					char.setPosition(1200, 382);
				}
			}
			else if (curLevel == 'lvl2'){
				if (char.overlaps(portal1)){
					portalSound.play();
					char.setPosition(896, 320);
				}
				else if (char.overlaps(portal2)){
					portalSound.play();
					char.setPosition(1040, 144);
				}
				else if (char.overlaps(portal3)){
					portalSound.play();
					char.setPosition(64, 96);
				}
				else if (char.overlaps(portal4)){
					portalSound.play();
					char.setPosition(1168, 432);
				}
				else if (char.overlaps(portal5)){
					portalSound.play();
					char.setPosition(1200, 624);
				}
				else if (char.overlaps(portal6)){
					portalSound.play();
					char.setPosition(48, 240);
				}
				else if (char.overlaps(portal7)){
					portalSound.play();
					char.setPosition(512, 128);
				}
				else if (char.overlaps(portal8)){
					portalSound.play();
					char.setPosition(64, 624);
				}
				else if (char.overlaps(portal9)){
					portalSound.play();
					char.setPosition(368, 304);
				}
				else if (char.overlaps(portal10)){
					portalSound.play();
					char.setPosition(640, 320);
				}
			}
			else if (curLevel == 'lvl3'){
				if (char.overlaps(portal1)){
					portalSound.play();
					char.setPosition(128, 528);
				}
				else if (char.overlaps(portal2)){
					portalSound.play();
					char.setPosition(496, 304);
				}
				else if (char.overlaps(portal3)){
					portalSound.play();
					char.setPosition(1072, 288);
				}
				else if (char.overlaps(portal4)){
					portalSound.play();
					char.setPosition(880, 576);
				}
				else if (char.overlaps(portal5)){
					portalSound.play();
					char.setPosition(48, 336);
				}
				else if (char.overlaps(portal6)){
					portalSound.play();
					char.setPosition(880, 352);
				}
				else if (char.overlaps(portal7)){
					portalSound.play();
					char.setPosition(1168, 576);
				}
				else if (char.overlaps(portal8)){
					portalSound.play();
					char.setPosition(1184, 144);
				}
				else if (char.overlaps(portal9)){
					portalSound.play();
					char.setPosition(208, 432);
				}
				else if (char.overlaps(portal10)){
					portalSound.play();
					char.setPosition(256, 624);
				}
			}
			else if (curLevel == 'lvl4'){
				if (char.overlaps(portal1)){
					portalSound.play();
					char.setPosition(64, 624);
				}
				else if (char.overlaps(portal2)){
					portalSound.play();
					char.setPosition(1200, 624);
				}
				else if (char.overlaps(portal3)){
					portalSound.play();
					char.setPosition(208, 400);
				}
				else if (char.overlaps(portal4)){
					portalSound.play();
					char.setPosition(432, 624);
				}
				else if (char.overlaps(portal5)){
					portalSound.play();
					char.setPosition(624, 96);
				}
				else if (char.overlaps(portal6)){
					portalSound.play();
					char.setPosition(48, 400);
				}
				else if (char.overlaps(portal7)){
					portalSound.play();
					char.setPosition(1056, 272);
				}
				else if (char.overlaps(portal8)){
					portalSound.play();
					char.setPosition(112, 64);
				}
				else if (char.overlaps(portal9)){
					portalSound.play();
					char.setPosition(1104, 496);
				}
				else if (char.overlaps(portal10)){
					portalSound.play();
					char.setPosition(1200, 368);
				}
			}
			else if (curLevel == 'lvl5'){
				if (char.overlaps(portal1)){
					portalSound.play();
					char.setPosition(304, 304);
				}
				else if (char.overlaps(portal2)){
					portalSound.play();
					char.setPosition(1104, 144);
				}
				else if (char.overlaps(portal3)){
					portalSound.play();
					char.setPosition(336, 448);
				}
				else if (char.overlaps(portal4)){
					portalSound.play();
					char.setPosition(688, 96);
				}
				else if (char.overlaps(portal5)){
					portalSound.play();
					char.setPosition(224, 624);
				}
				else if (char.overlaps(portal6)){
					portalSound.play();
					char.setPosition(720, 352);
				}
				else if (char.overlaps(portal7)){
					portalSound.play();
					char.setPosition(304, 176);
				}
				else if (char.overlaps(portal8)){
					portalSound.play();
					char.setPosition(912, 624);
				}
				else if (char.overlaps(portal9)){
					portalSound.play();
					char.setPosition(96, 624);
				}
				else if (char.overlaps(portal10)){
					portalSound.play();
					char.setPosition(1216, 560);
				}
			}
			else if (curLevel == 'lvl6'){
				if (char.overlaps(portal1)){
					portalSound.play();
					char.setPosition(864, 464);
				}
				else if (char.overlaps(portal2)){
					portalSound.play();
					char.setPosition(640, 304);
				}
				else if (char.overlaps(portal3)){
					portalSound.play();
					char.setPosition(704, 144);
				}
				else if (char.overlaps(portal4)){
					portalSound.play();
					char.setPosition(64, 464);
				}
				else if (char.overlaps(portal5)){
					portalSound.play();
					char.setPosition(64, 624);
				}
				else if (char.overlaps(portal6)){
					portalSound.play();
					char.setPosition(1200, 464);
				}
				else if (char.overlaps(portal7)){
					portalSound.play();
					char.setPosition(864, 624);
				}
				else if (char.overlaps(portal8)){
					portalSound.play();
					char.setPosition(288, 144);
				}
				else if (char.overlaps(portal9)){
					portalSound.play();
					char.setPosition(1184, 144);
				}
				else if (char.overlaps(portal10)){
					portalSound.play();
					char.setPosition(368, 144);
				}
			}
			else if (curLevel == 'lvl7'){
				if (char.overlaps(portal1)){
					portalSound.play();
					char.setPosition(1120, 256);
				}
				else if (char.overlaps(portal2)){
					portalSound.play();
					char.setPosition(352, 400);
				}
				else if (char.overlaps(portal3)){
					portalSound.play();
					char.setPosition(1216, 624);
				}
				else if (char.overlaps(portal4)){
					portalSound.play();
					char.setPosition(832, 256);
				}
				else if (char.overlaps(portal5)){
					portalSound.play();
					char.setPosition(400, 128);
				}
				else if (char.overlaps(portal6)){
					portalSound.play();
					char.setPosition(560, 624);
				}
				else if (char.overlaps(portal7)){
					portalSound.play();
					char.setPosition(48, 432);
				}
				else if (char.overlaps(portal8)){
					portalSound.play();
					char.setPosition(608, 112);
				}
				else if (char.overlaps(portal9)){
					portalSound.play();
					char.setPosition(1152, 464);
				}
				else if (char.overlaps(portal10)){
					portalSound.play();
					char.setPosition(144, 256);
				}
			}
			else if (curLevel == 'lvl8'){
				if (char.overlaps(portal1)){
					portalSound.play();
					char.setPosition(80, 176);
				}
				else if (char.overlaps(portal2)){
					portalSound.play();
					char.setPosition(176, 304);
				}
				else if (char.overlaps(portal3)){
					portalSound.play();
					char.setPosition(752, 624);
				}
				else if (char.overlaps(portal4)){
					portalSound.play();
					char.setPosition(336, 304);
				}
				else if (char.overlaps(portal5)){
					portalSound.play();
					char.setPosition(896, 464);
				}
				else if (char.overlaps(portal6)){
					portalSound.play();
					char.setPosition(1008, 624);
				}
				else if (char.overlaps(portal7)){
					portalSound.play();
					char.setPosition(656, 144);
				}
				else if (char.overlaps(portal8)){
					portalSound.play();
					char.setPosition(608, 624);
				}
				else if (char.overlaps(portal9)){
					portalSound.play();
					char.setPosition(1216, 624);
				}
				else if (char.overlaps(portal10)){
					portalSound.play();
					char.setPosition(1168, 96);
				}
			}
			else if (curLevel == 'lvl9'){
				if (char.overlaps(portal1)){
					portalSound.play();
					char.setPosition(112, 624);
				}
				else if (char.overlaps(portal2)){
					portalSound.play();
					char.setPosition(688, 96);
				}
				else if (char.overlaps(portal3)){
					portalSound.play();
					char.setPosition(848, 288);
				}
				else if (char.overlaps(portal4)){
					portalSound.play();
					char.setPosition(576, 96);
				}
				else if (char.overlaps(portal5)){
					portalSound.play();
					char.setPosition(352, 464);
				}
				else if (char.overlaps(portal6)){
					portalSound.play();
					char.setPosition(128, 80);
				}
				else if (char.overlaps(portal7)){
					portalSound.play();
					char.setPosition(688, 464);
				}
				else if (char.overlaps(portal8)){
					portalSound.play();
					char.setPosition(80, 304);
				}
				else if (char.overlaps(portal9)){
					portalSound.play();
					char.setPosition(1168, 624);
				}
				else if (char.overlaps(portal10)){
					portalSound.play();
					char.setPosition(1168, 144);
				}
			}
			else if (curLevel == 'lvl10'){
				if (char.overlaps(portal1)){
					portalSound.play();
					char.setPosition(portal2.x + 16, portal2.y + 32);
				}
				else if (char.overlaps(portal2)){
					portalSound.play();
					char.setPosition(portal1.x + 16, portal1.y + 32);
				}
				else if (char.overlaps(portal3)){
					portalSound.play();
					char.setPosition(portal4.x + 16, portal4.y + 32);
				}
				else if (char.overlaps(portal4)){
					portalSound.play();
					char.setPosition(portal3.x + 16, portal3.y + 32);
				}
				else if (char.overlaps(portal5)){
					portalSound.play();
					char.setPosition(portal6.x + 16, portal6.y + 32);
				}
				else if (char.overlaps(portal6)){
					portalSound.play();
					char.setPosition(portal5.x + 16, portal5.y + 32);
				}
				else if (char.overlaps(portal7)){
					portalSound.play();
					char.setPosition(portal8.x + 16, portal8.y + 32);
				}
				else if (char.overlaps(portal8)){
					portalSound.play();
					char.setPosition(portal7.x + 16, portal7.y + 32);
				}
				else if (char.overlaps(portal9)){
					portalSound.play();
					char.setPosition(portal10.x + 16, portal10.y + 32);
				}
				else if (char.overlaps(portal10)){
					portalSound.play();
					char.setPosition(portal9.x + 16, portal9.y + 32);
				}
			}
			else if (curLevel == 'lvl11'){
				if (char.overlaps(portal1)){
					portalSound.play();
					char.setPosition(portal2.x + 16, portal2.y + 32);
				}
				else if (char.overlaps(portal2)){
					portalSound.play();
					char.setPosition(portal1.x + 16, portal1.y + 32);
				}
				else if (char.overlaps(portal3)){
					portalSound.play();
					char.setPosition(portal4.x + 16, portal4.y + 32);
				}
				else if (char.overlaps(portal4)){
					portalSound.play();
					char.setPosition(portal3.x + 16, portal3.y + 32);
				}
				else if (char.overlaps(portal5)){
					portalSound.play();
					char.setPosition(portal6.x + 16, portal6.y + 32);
				}
				else if (char.overlaps(portal6)){
					portalSound.play();
					char.setPosition(portal5.x + 16, portal5.y + 32);
				}
				else if (char.overlaps(portal7)){
					portalSound.play();
					char.setPosition(portal8.x + 16, portal8.y + 32);
				}
				else if (char.overlaps(portal8)){
					portalSound.play();
					char.setPosition(portal7.x + 16, portal7.y + 32);
				}
				else if (char.overlaps(portal9)){
					portalSound.play();
					char.setPosition(portal10.x + 16, portal10.y + 32);
				}
				else if (char.overlaps(portal10)){
					portalSound.play();
					char.setPosition(portal9.x + 16, portal9.y + 32);
				}
			}
			else if (curLevel == 'lvl12'){
				if (char.overlaps(portal1)){
					portalSound.play();
					char.setPosition(portal2.x + 16, portal2.y + 32);
				}
				else if (char.overlaps(portal2)){
					portalSound.play();
					char.setPosition(portal1.x + 16, portal1.y + 32);
				}
				else if (char.overlaps(portal3)){
					portalSound.play();
					char.setPosition(portal4.x + 16, portal4.y + 32);
				}
				else if (char.overlaps(portal4)){
					portalSound.play();
					char.setPosition(portal3.x + 16, portal3.y + 32);
				}
				else if (char.overlaps(portal5)){
					portalSound.play();
					char.setPosition(portal6.x + 16, portal6.y + 32);
				}
				else if (char.overlaps(portal6)){
					portalSound.play();
					char.setPosition(portal5.x + 16, portal5.y + 32);
				}
				else if (char.overlaps(portal7)){
					portalSound.play();
					char.setPosition(portal8.x + 16, portal8.y + 32);
				}
				else if (char.overlaps(portal8)){
					portalSound.play();
					char.setPosition(portal7.x + 16, portal7.y + 32);
				}
				else if (char.overlaps(portal9)){
					portalSound.play();
					char.setPosition(portal10.x + 16, portal10.y + 32);
				}
				else if (char.overlaps(portal10)){
					portalSound.play();
					char.setPosition(portal9.x + 16, portal9.y + 32);
				}
			}
		}
	}
	function hitTramp(_, tramp:FlxSprite){
		char.hitTramp();
		trampSound.play(true);
		tramp.animation.play('bounce');
	}
	function touchGhost(_, g:FlxSprite){
		if (char.alpha == 1){
			if (g.animation.curAnim.name != 'blood'){
				if(Variables.curPowerup != 'shield'){
					char.alpha = 0.5;
					hitSound.play(true);
					Variables.health -= 1;
				}
			}
		}
	}
	function touchBat(_, b:FlxSprite){
		if (char.alpha == 1){
			if (b.animation.curAnim.name != 'blood'){
				if(Variables.curPowerup != 'shield'){
					char.alpha = 0.5;
					hitSound.play(true);
					Variables.health -= 1;
				}
			}
		}
	}
	function touchSpider(_, s:FlxSprite){
		if (char.alpha == 1){
			if (s.animation.curAnim.name != 'blood'){
				if(Variables.curPowerup != 'shield'){
					char.alpha = 0.5;
					hitSound.play(true);
					Variables.health -= 1;
				}
			}
		}
	}
	function stepInMud(_, mud:FlxSprite){
		if (char.overlaps(mud)){
			char.playerSpeed = 40;
			char.playerJump = 150;
		}
		else
		{
			char.playerSpeed = 100;
			char.playerJump = 265;
		}
	}
	function updateBullet(){
		if (FlxG.keys.anyJustPressed([X])){
			if(Variables.bullets > 0){
				bullet = new Bullet(char.x, char.y + 3);
				add(bullet);
				
				Variables.bullets--;
			}
		}
	}
	function updateBossBullet(){
		bossBulletCounter++;
		boss2EnemyCounter++;
		boss2BulletCounter++;
		boss3BulletCounter++;
		
		if(curLevel == 'boss'){
			if(Boss.dead == false){
				if (bossBulletCounter >= FlxG.random.int(40, 50)){
			
					bossBulletCounter = 0;
					add(new BossBullet(boss.x, boss.y));
					add(new BossBullet(boss.x, boss.y + 15));
				}
			}
		}
		else if(curLevel == 'boss2'){
			if(Boss.dead == false){
				if (boss2BulletCounter >= FlxG.random.int(100, 110)){
					if (Boss.dead == false){
						boss2BulletCounter = 0;
						add(new Ball(boss.x, boss.y + 16));
					}
				}
				else if (boss2EnemyCounter >= FlxG.random.int(900, 950)){
					if (Boss.dead == false){
						boss2EnemyCounter = 0;
						//add(new Ghost(boss.x, boss.y + 16));
					
						//add(new BossShield(boss.x - 8, boss.y));
						bossShield = new BossShield(boss.x - 8, boss.y);
						add(bossShield);
					}
				}
			}
			if (Boss.Health <= 0){
				boss.y += 0.8;
				boss.angle += 4;
				boss.animation.play('die');
				
				boss_die.play();
			}
		}
		else if (curLevel == 'boss3'){
			if(Boss.dead == false){
				if (boss3BulletCounter >= FlxG.random.int(100, 110)){
					if (Boss.dead == false){
						boss3BulletCounter = 0;
						add(new Saw(boss.x - 16, boss.y + 32));
					}
				}
			}
			if (Boss.Health <= 0){
				boss.y += 0.8;
				boss.angle += 4;
				
				boss_die.play();
			}
		}
	}
	function ghostShootL(_, g:FlxSprite){
		ghostBulletCounterL++;
		
		if (ghostBulletCounterL >= 80){
			ghostBulletCounterL = 0;
			
			//add(new EnemyBullet(g.x, g.y, 'ghost'));
			
			//enemyBullet = new EnemyBullet(g.x, g.y, 'ghost', 'L');
			//add(enemyBullet);
		}
	}
	function ghostShootR(_, g:FlxSprite){
		ghostBulletCounterR++;
		
		if (ghostBulletCounterR >= 120){
			ghostBulletCounterR = 0;
			
			//add(new EnemyBullet(g.x, g.y, 'ghost'));
			
			//enemyBullet = new EnemyBullet(g.x, g.y, 'ghost', 'R');
			//add(enemyBullet);
		}
	}
	function endLevel(){
		if(Variables.FreeplayMode == false){
			FlxG.resetState();
		}else{
			if (Variables.FreeplayMode == true){
				Variables.FreeplayMode = false;
			}
			FlxG.sound.music.stop();
			FlxG.mouse.visible = true;
			//FlxG.sound.playMusic(AssetPaths.The_Screen_With_The_Title__wav, 1, true);
			FlxG.switchState(new FreeplayState());
		}
	}
	function hitBulletStation(_, b:FlxSprite){
		if (char.animation.curAnim.name == 'fall'){
			if (b.animation.curAnim.name == 'loaded'){
				b.animation.play('loading');
				Variables.bullets += 5;
				Variables.score += 5;
				char.killMushroom();
				getBullets.play();
				killEnemy.play();
			}
		}
	}
	function killMushroom(_, m:FlxSprite){
		if (char.animation.curAnim.name == 'fall'){
			if (m.animation.curAnim.name != 'die'){
				if(char.alpha == 1){
					m.health--;
					killEnemy.play();
					char.killMushroom();
					Variables.score+= 50;
					Variables.mushroomKills++;
				}
			}
		}
		else if (char.animation.curAnim.name == 'idle' || char.animation.curAnim.name == 'walk'){
			if(m.animation.curAnim.name != 'die'){
				if (char.alpha == 1){
					char.alpha = 0.5;
					hitSound.play(true);
					Variables.health -= 1;
				}
			}
		}
	}
	function touchBoss(_, b:FlxSprite){
		if (char.animation.curAnim.name == 'fall'){
			if (b.animation.curAnim.name == 'idle'){
				if(curLevel == 'boss'){
					if(char.alpha == 1){
						Boss.Health --;
						hitBoss.play();
						char.killMushroom();
						Variables.score+= 100;
						boss.animation.play('hit');
					}
				}
			}
		}
		else if (char.animation.curAnim.name == 'idle' || char.animation.curAnim.name == 'walk' || char.animation.curAnim.name == 'jump'){
			if (char.alpha == 1){
				char.alpha = 0.5;
				hitSound.play(true);
				Variables.health -= 1;
			}
		}
	}
	function pickUpBullet(_, b:FlxSprite){
		b.kill();
		getBullets.play();
		Variables.bullets +=10;
	}
	function updateBeginning(){
		if (beginLvl == false){
			char.x += 1;
			char.animation.play('walk');
		}else{
			char.canWalk = true;
		}
		if (char.x == 96){
			beginLvl = true;
		}
	}
	function charEnterDoor(_, door:FlxSprite){
		if(Variables.generators >= Variables.neededGenerators && Variables.keys >= Variables.neededKeys){
			if (FlxG.keys.anyJustPressed([SPACE])){
				doorSound.play();
				enterDoor = true;
				if (curLevel == 'lvl1'){
					door.animation.play('open');
					FlxG.camera.fade(FlxColor.BLACK, 1.5, false, function(){
						curLevel = 'lvl2';
						curTiledLevel = 'Two';
						FlxG.sound.music.stop();
						FlxG.switchState(new LevelClearedState());
					});
				}
				else if (curLevel == 'lvl2'){
					door.animation.play('open');
					FlxG.camera.fade(FlxColor.BLACK, 1.5, false, function(){
						curLevel = 'lvl3';
						curTiledLevel = 'Three';
						FlxG.sound.music.stop();
						FlxG.switchState(new LevelClearedState());
					});
				}
				else if (curLevel == 'lvl3'){
					door.animation.play('open');
					FlxG.camera.fade(FlxColor.BLACK, 1.5, false, function(){
						curLevel = 'lvl4';
						curTiledLevel = 'Four';
						FlxG.sound.music.stop();
						FlxG.switchState(new LevelClearedState());
					});
				}
				else if (curLevel == 'lvl4'){
					door.animation.play('open');
					FlxG.camera.fade(FlxColor.BLACK, 1.5, false, function(){
						FlxG.sound.playMusic(AssetPaths.Bitcrash__wav, 1, true);
						FlxG.sound.music.volume = 0.5;
						curTiledLevel = 'Boss';
						curLevel = 'boss';
						FlxG.switchState(new LevelClearedState());
					});
				}
				else if (curLevel == 'lvl5'){
					door.animation.play('open');
					FlxG.camera.fade(FlxColor.BLACK, 1.5, false, function(){
						curLevel = 'lvl6';
						curTiledLevel = 'Six';
						FlxG.sound.music.stop();
						FlxG.switchState(new LevelClearedState());
					});
				}
				else if (curLevel == 'lvl6'){
					door.animation.play('open');
					FlxG.camera.fade(FlxColor.BLACK, 1.5, false, function(){
						curLevel = 'lvl7';
						curTiledLevel = 'Seven';
						FlxG.sound.music.stop();
						FlxG.switchState(new LevelClearedState());
					});
				}
				else if (curLevel == 'lvl7'){
					door.animation.play('open');
					FlxG.camera.fade(FlxColor.BLACK, 1.5, false, function(){
						curLevel = 'lvl8';
						curTiledLevel = 'Eight';
						FlxG.sound.music.stop();
						FlxG.switchState(new LevelClearedState());
					});
				}
				else if (curLevel == 'lvl8'){
					door.animation.play('open');
					FlxG.camera.fade(FlxColor.BLACK, 1.5, false, function(){
						curLevel = 'boss2';
						curTiledLevel = 'BossTwo';
						FlxG.sound.music.stop();
						FlxG.switchState(new LevelClearedState());
					});
				}
				else if (curLevel == 'lvl9'){
					door.animation.play('open');
					FlxG.camera.fade(FlxColor.BLACK, 1.5, false, function(){
						curLevel = 'lvl10';
						curTiledLevel = 'Ten';
						FlxG.sound.music.stop();
						FlxG.switchState(new LevelClearedState());
					});
				}
				else if (curLevel == 'lvl10'){
					door.animation.play('open');
					FlxG.camera.fade(FlxColor.BLACK, 1.5, false, function(){
						curLevel = 'lvl11';
						curTiledLevel = 'Eleven';
						FlxG.sound.music.stop();
						FlxG.switchState(new LevelClearedState());
					});
				}
				else if (curLevel == 'lvl11'){
					door.animation.play('open');
					FlxG.camera.fade(FlxColor.BLACK, 1.5, false, function(){
						curLevel = 'lvl12';
						curTiledLevel = 'Twelve';
						FlxG.sound.music.stop();
						FlxG.switchState(new LevelClearedState());
					});
				}
				else if (curLevel == 'lvl12'){
					door.animation.play('open');
					FlxG.camera.fade(FlxColor.BLACK, 1.5, false, function(){
						curLevel = 'boss3';
						curTiledLevel = 'BossThree';
						FlxG.sound.music.stop();
						FlxG.switchState(new LevelClearedState());
					});
				}
			}
		}
	}
	function updateUI(){
		if (FlxG.keys.anyJustPressed([P])){
			pauseSound.play();
			pauseScreen.visible = true;
			FlxG.sound.music.volume = 0;
			openSubState(new PauseState());
		}
		else if (FlxG.mouse.overlaps(HUD.pauseButton)){
			if(FlxG.mouse.justPressed){
				pauseSound.play();
				pauseScreen.visible = true;
				FlxG.sound.music.volume = 0;
				openSubState(new PauseState());
			}
		}
		
		if (FlxG.mouse.overlaps(HUD.accessHUDButton)){
			if (FlxG.mouse.justPressed){
				pauseSound.play();
				Variables.showingHud = true;
				if (HUD.accessHUDButton.animation.curAnim.name == 'closed'){
					HUD.accessHUDButton.animation.play('open');
					
					HUD.keysCounter.visible = true;
					HUD.coinsCounter.visible = true;
					HUD.livesCounter.visible = true;
					HUD.scoreCounter.visible = true;
					HUD.wrenchCounter.visible = true;
					HUD.bulletsCounter.visible = true;
					HUD.diamondCounter.visible = true;
					HUD.generatorCounter.visible = true;
					HUD.silverCoinCounter.visible = true;
					
					HUD.keySprt.visible = true;
					//HUD.powerSprt.visible = true;
					HUD.generatorDisplay.visible = true;
					
					HUD.emptyHeart1.visible = true;
					HUD.emptyHeart2.visible = true;
					HUD.emptyHeart3.visible = true;
					HUD.emptyHeart4.visible = true;
					HUD.emptyHeart5.visible = true;
					
					HUD.heart1.alpha = 1;
					HUD.heart2.alpha = 1;
					HUD.heart3.alpha = 1;
					HUD.heart4.alpha = 1;
					HUD.heart5.alpha = 1;
					
					hudItems.visible = true;
				}
				else if (HUD.accessHUDButton.animation.curAnim.name == 'open'){
					Variables.showingHud = false;
					HUD.accessHUDButton.animation.play('closed');
					
					HUD.keysCounter.visible = false;
					HUD.coinsCounter.visible = false;
					HUD.livesCounter.visible = false;
					HUD.scoreCounter.visible = false;
					HUD.wrenchCounter.visible = false;
					HUD.bulletsCounter.visible = false;
					HUD.diamondCounter.visible = false;
					HUD.generatorCounter.visible = false;
					HUD.silverCoinCounter.visible = false;
					
					HUD.keySprt.visible = false;
					//HUD.powerSprt.visible = false;
					HUD.generatorDisplay.visible = false;
					
					HUD.emptyHeart1.visible = false;
					HUD.emptyHeart2.visible = false;
					HUD.emptyHeart3.visible = false;
					HUD.emptyHeart4.visible = false;
					HUD.emptyHeart5.visible = false;
					
					HUD.heart1.alpha = 0;
					HUD.heart2.alpha = 0;
					HUD.heart3.alpha = 0;
					HUD.heart4.alpha = 0;
					HUD.heart5.alpha = 0;
					
					hudItems.visible = false;
				}
			}
		}
		else if (FlxG.keys.anyJustPressed([TAB])){
			pauseSound.play();
			Variables.showingHud = true;
			if (HUD.accessHUDButton.animation.curAnim.name == 'closed'){
				HUD.accessHUDButton.animation.play('open');
				
				HUD.keysCounter.visible = true;
				HUD.coinsCounter.visible = true;
				HUD.livesCounter.visible = true;
				HUD.scoreCounter.visible = true;
				HUD.wrenchCounter.visible = true;
				HUD.bulletsCounter.visible = true;
				HUD.diamondCounter.visible = true;
				HUD.generatorCounter.visible = true;
				HUD.silverCoinCounter.visible = true;
				
				HUD.keySprt.visible = true;
				//HUD.powerSprt.visible = true;
				HUD.generatorDisplay.visible = true;
					
				HUD.emptyHeart1.visible = true;
				HUD.emptyHeart2.visible = true;
				HUD.emptyHeart3.visible = true;
				HUD.emptyHeart4.visible = true;
				HUD.emptyHeart5.visible = true;
					
				HUD.heart1.alpha = 1;
				HUD.heart2.alpha = 1;
				HUD.heart3.alpha = 1;
				HUD.heart4.alpha = 1;
				HUD.heart5.alpha = 1;
					
				hudItems.visible = true;
			}
			else if (HUD.accessHUDButton.animation.curAnim.name == 'open'){
				Variables.showingHud = false;
				HUD.accessHUDButton.animation.play('closed');
				
				HUD.keysCounter.visible = false;
				HUD.coinsCounter.visible = false;
				HUD.livesCounter.visible = false;
				HUD.scoreCounter.visible = false;
				HUD.wrenchCounter.visible = false;
				HUD.bulletsCounter.visible = false;
				HUD.diamondCounter.visible = false;
				HUD.generatorCounter.visible = false;
				HUD.silverCoinCounter.visible = false;
					
				HUD.keySprt.visible = false;
				//HUD.powerSprt.visible = false;
				HUD.generatorDisplay.visible = false;
					
				HUD.emptyHeart1.visible = false;
				HUD.emptyHeart2.visible = false;
				HUD.emptyHeart3.visible = false;
				HUD.emptyHeart4.visible = false;
				HUD.emptyHeart5.visible = false;
					
				HUD.heart1.alpha = 0;
				HUD.heart2.alpha = 0;
				HUD.heart3.alpha = 0;
				HUD.heart4.alpha = 0;
				HUD.heart5.alpha = 0;
					
				hudItems.visible = false;
			}
		}
	}
	public static function resetVariables(){
		Variables.keys = 0;
		Variables.generators = 0;
		Variables.coins = 0;
		Variables.wrenches = 0;
		Variables.lives = Variables.lives;
		Variables.health = 5;
		Variables.diamonds = 0;
		Variables.bullets = 0;
		Variables.score = 0;
		Variables.silverCoins = 0;
	}
	function updateGeneratorCount(){
		if (playSound.health == 1){
			if(inBossLevel == false){
				if (Variables.generators == Variables.neededGenerators){
					playSound.health = 2;
					FlxG.sound.music.volume = 0.1;
					allGeneratorSound.play();
				}
			}
		}
	}
	function updatePit(){
		if (char.overlaps(pit)){
			if (Variables.lives > 0){
				Variables.lives--;
				
				//char.x = charX;
				//char.y = charY - 32;
				Variables.health = 5;
				
				//FlxG.resetState();
				hitSound.play(true);
			}
			else if (Variables.lives <= 0){
				char.kill();
				char.alpha = 1;
				char.canWalk = false;
				
				hitSound.play(true);
				FlxG.sound.music.fadeOut(2);
				FlxG.camera.fade(FlxColor.BLACK, 2, false, function(){
					if(Variables.FreeplayMode == false){
						FlxG.switchState(new LoseState());
					}else{
						if (Variables.FreeplayMode == true){
							Variables.FreeplayMode = false;
						}
						FlxG.sound.music.stop();
						FlxG.mouse.visible = true;
						//FlxG.sound.playMusic(AssetPaths.The_Screen_With_The_Title__wav, 1, true);
						FlxG.switchState(new FreeplayState());
					}
				});
			}
		}
	}
	function enemyPit(_, e:FlxSprite){
		e.kill();
	}
	function updateStuff(){
		if(curLevel == 'lvl1'){
			updateBeginning();
		}
		if(char.canWalk == true){
			if (char.justTouched(FlxObject.FLOOR)){
				add(new Dust(char.x, char.y));
			}
		}
		if (FlxG.keys.anyJustPressed([UP, W]))
		{
			if (char.isTouching(FlxObject.FLOOR))
			{
				add(new Dust(char.x, char.y));
			}
		}
		if (enterDoor == true){
			char.alpha -= 0.03;
			char.animation.play('walk');
		}
		if (char.alpha == 0){
			enterDoor = false;
			door.animation.play('idle');
		}
		
		if(curLevel == 'boss' || curLevel == 'boss2' || curLevel == 'boss3'){
			bossHealthText.text = "" + Boss.Health;
		}
		
		charEyesL.x = char.x - 32;
		charEyesL.y = char.y - 32;
		
		charEyesR.x = char.x + 8;
		charEyesR.y = char.y - 32;
	}
	function touchSecret(_, s:FlxSprite){
		FlxG.sound.music.fadeOut(2);
		FlxG.camera.fade(FlxColor.BLACK, 2, false, function(){
			FlxG.switchState(new SecretState());
		});
	}
	function touchFakeyyy(){
		if (charEyesL.overlaps(fakeBox)){
			fakeBoxCount++;
			if (fakeBoxCount >= 1000000){
				fakeBox.kill();
			}
		}else{
			fakeBoxCount = 0;
		}
	}
	override public function update(elapsed:Float){
		super.update(elapsed);
		
		FlxG.collide(char, boxesGrp);
		FlxG.collide(char, levelGround);
		FlxG.collide(char, levelBounds);
		
		if (curLevel == 'boss' || curLevel == 'boss2' || curLevel == 'boss3'){
			FlxG.collide(char, bossColider);
			
			FlxG.collide(batsGrp, bossColider);
			FlxG.collide(ghostsGrp, bossColider);
			FlxG.collide(spidersGrp, bossColider);
			FlxG.collide(mushroomGrp, bossColider);
		}
		
		FlxG.collide(ghostsGrp, boxesGrp);
		FlxG.collide(ghostsGrp, spikesGrp);
		FlxG.collide(ghostsGrp, levelGround);
		FlxG.collide(ghostsGrp, levelBounds);
		
		FlxG.collide(batsGrp, boxesGrp);
		FlxG.collide(batsGrp, spikesGrp);
		FlxG.collide(batsGrp, levelGround);
		FlxG.collide(batsGrp, levelBounds);
		
		FlxG.collide(mushroomGrp, boxesGrp);
		FlxG.collide(mushroomGrp, spikesGrp);
		FlxG.collide(mushroomGrp, levelGround);
		FlxG.collide(mushroomGrp, levelBounds);
		
		FlxG.collide(spidersGrp, boxesGrp);
		FlxG.collide(spidersGrp, spikesGrp);
		FlxG.collide(spidersGrp, levelGround);
		FlxG.collide(spidersGrp, levelBounds);
		
		FlxG.overlap(pit, ghostsGrp, enemyPit);
		FlxG.overlap(pit, mushroomGrp, enemyPit);
		FlxG.overlap(pit, batsGrp, enemyPit);
		FlxG.overlap(pit, spidersGrp, enemyPit);
		
		FlxG.overlap(char, boss, touchBoss);
		FlxG.overlap(char, keysGrp, collectKey);
		FlxG.overlap(char, trampolinesGrp, hitTramp);
		FlxG.overlap(char, coinsGrp, collectCoin);
		FlxG.overlap(char, spikesGrp, touchSpike);
		FlxG.overlap(char, ghostsGrp, touchGhost);
		FlxG.overlap(char, batsGrp, touchBat);
		FlxG.overlap(char, secretBox, touchSecret);
		FlxG.overlap(char, mushroomGrp, killMushroom);
		FlxG.overlap(char, bulletsGrp, pickUpBullet);
		FlxG.overlap(char, heartsGrp, collectHeart);
		FlxG.overlap(char, applesGrp, collectApple);
		FlxG.overlap(char, wrenchesGrp, collectWrench);
		FlxG.overlap(char, mudGrp, stepInMud);
		FlxG.overlap(char, laddersGrp, touchLadder);
		FlxG.overlap(char, generatorsGrp, fixGenerator);
		FlxG.overlap(char, diamondsGrp, collectDiamond);
		FlxG.overlap(char, door, charEnterDoor);
		FlxG.overlap(char, spidersGrp, touchSpider);
		FlxG.overlap(char, cactusGrp, touchCactus);
		FlxG.overlap(char, silverCoinsGrp, collectSilverCoin);
		FlxG.overlap(char, bulletStationGrp, hitBulletStation);
		
		updateUI();
		updatePit();
		updateStuff();
		updateBullet();
		updatePortals();
		if(curLevel != 'boss'){
			updateGeneratorCount();
		}
		if (curLevel == 'boss' || curLevel == 'boss2' || curLevel == 'boss3'){
			updateBossBullet();
			//updateBossColider();
		}
		if (curLevel == 'lvl8'){
			touchFakeyyy();
			FlxG.collide(char, fakeBox);
		}
	}
}