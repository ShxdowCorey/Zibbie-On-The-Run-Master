import flixel.FlxG;
import openfl.net.URLRequest;
import openfl.net.URLLoader;
import openfl.events.Event;

class MedalUnlocker {
    private var _medalId:String;
    private var _ngId:String;
    private var _ngAuth:String;

    public function new(medalId:String, ngId:String, ngAuth:String) {
        _medalId = medalId;
        _ngId = ngId;
        _ngAuth = ngAuth;
    }

    public function unlockMedal():Void {
        var request:URLRequest = new URLRequest("https://www.newgrounds.com/api/medal/unlock");
        request.method = "POST";
        request.data = "id="+_medalId+"&user_id="+_ngId+"&auth="+_ngAuth;
        request.contentType = "application/x-www-form-urlencoded";

        var loader:URLLoader = new URLLoader();
        loader.addEventListener(Event.COMPLETE, function(e:Event):Void {
            FlxG.log("Medal unlocked!");
        });

        loader.load(request);
    }
}