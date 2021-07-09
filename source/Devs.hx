package;

import lime.app.Application;
import lime.system.DisplayMode;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import Controls.KeyboardScheme;
import flixel.FlxG;
import openfl.display.FPS;
import openfl.Lib;
import io.newgrounds.NG;
import lime.app.Application;

using StringTools;

#if windows
import Discord.DiscordClient;
#end

class DevCategory
{
	private var _devs:Array<Dev> = new Array<Dev>();
	public final function getDevs():Array<Dev>
	{
		return _devs;
	}

	public final function addDev(dev:Dev)
	{
		_devs.push(dev);
	}

	
	public final function removeDev(dev:Dev)
	{
		_devs.remove(dev);
	}

	private var _name:String = "New Category";
	public final function getName() {
		return _name;
	}

	public function new (catName:String, devs:Array<Dev>)
	{
		_name = catName;
		_devs = devs;
	}
}

class Dev
{
	public function new()
	{
		display = updateDisplay();
	}
	private var description:String = "";
	private var url:String = "";
	private var display:String;
	private var acceptValues:Bool = false;
	public final function getDisplay():String
	{
		return display;
	}

	public final function getAccept():Bool
	{
		return acceptValues;
	}

	public final function getDescription():String
	{
		return description;
	}

	public function getValue():String { return throw "stub!"; };
	
	// Returns whether the label is to be updated.
	public function press():Bool { return throw "stub!"; }
	private function updateDisplay():String { return throw "stub!"; }
	public function left():Bool { return throw "stub!"; }
	public function right():Bool { return throw "stub!"; }
}


class LinkOption extends Dev
{
	public function new(desc:String, link:String)
	{
		super();
		description = desc;
		url = link;
	}

	public override function press():Bool
	{
		trace(url);
		FlxG.openURL(url);
		return true;
	}

	private override function updateDisplay():String
	{
		return "Check them out!";
	}
}

/*class Role1 extends Dev
{
	public function new(desc:String, job:String)
	{
		super();
		description = desc;
		role = job;
	}

	public override function press():Bool			// I had a cool class here that took a role as a parameter and displayed it
	{												// But in true FNF code fashion, it didn't display the name, so I had to hardcode it in a bad way below
		return true;
	}

	private override function updateDisplay():String
	{
		trace(role);
		return role;
	}
}*/

class Lead extends Dev
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press():Bool
	{
		return true;
	}

	private override function updateDisplay():String
	{
		return "Project Lead";
	}
}

class Art extends Dev
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press():Bool
	{
		return true;
	}
	
	private override function updateDisplay():String
	{
		return "Artist";
	}
}

class Animate extends Dev
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press():Bool
	{
		return true;
	}
	
	private override function updateDisplay():String
	{
		return "Animator";
	}
}

class Co extends Dev
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press():Bool
	{
		return true;
	}
	
	private override function updateDisplay():String
	{
		return "Co-Lead";
	}
}

class Write extends Dev
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press():Bool
	{
		return true;
	}
	
	private override function updateDisplay():String
	{
		return "Writer";
	}
}

class Assist extends Dev
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press():Bool
	{
		return true;
	}
	
	private override function updateDisplay():String
	{
		return "Assistant Programmer";
	}
}

class Music1 extends Dev
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press():Bool
	{
		return true;
	}
	
	private override function updateDisplay():String
	{
		return "Hero Week Music";
	}
}

class Program extends Dev
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press():Bool
	{
		return true;
	}
	
	private override function updateDisplay():String
	{
		return "Main Programmer";
	}
}

class MusicTut extends Dev
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press():Bool
	{
		return true;
	}
	
	private override function updateDisplay():String
	{
		return "Tutorial Music";
	}
}

class Music2 extends Dev
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press():Bool
	{
		return true;
	}
	
	private override function updateDisplay():String
	{
		return "Nega Week Music";
	}
}