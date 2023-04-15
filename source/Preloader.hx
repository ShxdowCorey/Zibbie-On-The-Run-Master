package;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.BlendMode;
import flash.display.Sprite;
import flash.Lib;
import flash.text.TextField;
import flash.text.TextFormat;
import flixel.FlxG;
import flixel.system.FlxBasePreloader;
import flixel.system.FlxAssets;

@:keep @:bitmap("art/loadingTxt.png")
private class GraphicLogoLight extends BitmapData {}

@:keep @:bitmap("assets/images/dontworryabouthislmao.png")
private class GraphicLogoCorners extends BitmapData {}
class Preloader extends FlxBasePreloader
{
	var _buffer:Sprite;
	var _bmpBar:Bitmap;
	var _text:TextField;
	var _logo:Sprite;
	var _logoGlow:Sprite;
	override public function new(MinDisplayTime:Float = 0, ?AllowedURLs:Array<String>):Void
	{
		super(MinDisplayTime, AllowedURLs);
	}
	override function create():Void
	{
		_buffer = new Sprite();
		
		_buffer.scaleX = _buffer.scaleY = 2;
		addChild(_buffer);
		_width = Std.int(Lib.current.stage.stageWidth / _buffer.scaleX);
		_height = Std.int(Lib.current.stage.stageHeight / _buffer.scaleY);
		
		_buffer.addChild(new Bitmap(new BitmapData(_width, _height, false, 0x000000)));
		
		var logoLight = createBitmap(GraphicLogoLight, function(logoLight:Bitmap)
		{
			logoLight.width = _width/1.3;
			logoLight.height = _height/2.2;
			logoLight.x = (_width - logoLight.width) / 2;
			logoLight.y += 25;
		});
		logoLight.smoothing = true;
		_buffer.addChild(logoLight);
		_bmpBar = new Bitmap(new BitmapData(1, 7, false, 0xFFFFFF));
		_bmpBar.x = 4;
		_bmpBar.y = _height - 11;
		_buffer.addChild(_bmpBar);
		
		_text = new TextField();
		_text.defaultTextFormat = new TextFormat(FlxAssets.FONT_DEFAULT, 40, 0xFFFFFF);
		//_text.embedFonts = true;
		_text.selectable = false;
		//_text.multiline = false;
		_text.x = 302.9;
		_text.y = 353.3;
		_buffer.addChild(_text);
		
		/*
		_logo = new Sprite();
		FlxAssets.drawLogo(_logo.graphics);
		_logo.scaleX = _logo.scaleY = _height / 8 * 0.04;
		_logo.x = (_width - _logo.width) / 2;
		_logo.y = (_height - _logo.height) / 2;
		_buffer.addChild(_logo);
		_logoGlow = new Sprite();
		FlxAssets.drawLogo(_logoGlow.graphics);
		_logoGlow.blendMode = BlendMode.SCREEN;
		_logoGlow.scaleX = _logoGlow.scaleY = _height / 8 * 0.04;
		_logoGlow.x = (_width - _logoGlow.width) / 2;
		_logoGlow.y = (_height - _logoGlow.height) / 2;
		_buffer.addChild(_logoGlow);
		*/
		
		var corners = createBitmap(GraphicLogoCorners, function(corners)
		{
			//corners.width = _width;
			//corners.height = height;
		});
		corners.smoothing = true;
		_buffer.addChild(corners);
		
		var bitmap = new Bitmap(new BitmapData(_width, _height, false, 0xffffff));
		var i:Int = 0;
		var j:Int = 0;
		while (i < _height)
		{
			j = 0;
			while (j < _width)
			{
				bitmap.bitmapData.setPixel(j++, i, 0);
			}
			i += 2;
		}
		//bitmap.blendMode = BlendMode.OVERLAY;
		bitmap.alpha = 0;
		_buffer.addChild(bitmap);
		
		super.create();
	}
	override function destroy():Void
	{
		if (_buffer != null)
		{
			removeChild(_buffer);
		}
		_buffer = null;
		_bmpBar = null;
		_text = null;
		_logo = null;
		_logoGlow = null;
		super.destroy();
	}
	override public function update(Percent:Float):Void
	{
		//_bmpBar.scaleX = Percent * (_width - 8);
		_bmpBar.scaleX = Std.int(Percent * 325) + 75;
		_text.text = "Loading:" + Std.int(Percent * 100) + "%";
		
		if (Percent < 0.1)
		{
			//_logoGlow.alpha = 0;
			//_logo.alpha = 0;
		}
		else if (Percent < 0.15)
		{
			//_logoGlow.alpha = Math.random();
			//_logo.alpha = 0;
		}
		else if (Percent < 0.2)
		{
			//_logoGlow.alpha = 0;
			//_logo.alpha = 0;
		}
		else if (Percent < 0.25)
		{
			//_logoGlow.alpha = 0;
			//_logo.alpha = Math.random();
		}
		else if (Percent < 0.7)
		{
			//_logoGlow.alpha = (Percent - 0.45) / 0.45;
			//_logo.alpha = 1;
		}
		else if ((Percent > 0.8) && (Percent < 0.9))
		{
			//_logoGlow.alpha = 1 - (Percent - 0.8) / 0.1;
			//_logo.alpha = 0;
		}
		else if (Percent > 0.9)
		{
			//_buffer.alpha = 1 - (Percent - 0.9) / 0.1;
		}
	}
}