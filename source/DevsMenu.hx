package;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import openfl.Lib;
import Devs;
import Controls.Control;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;

class DevsMenu extends MusicBeatState
{
	public static var instance:DevsMenu;

	var selector:FlxText;
	var curSelected:Int = 0;

	var options:Array<DevCategory> =
    [
		new DevCategory("OneilR",
        [
            new LinkOption("Press ENTER to check out OnielR's Newgrounds!", "https://oneilr.newgrounds.com"),
			new Lead("What did this person do?"),
            new Art("What else did this person do?"),
            new Animate("What else did this person do?") 
		]),
		new DevCategory("AshaTelethia",
        [
            new LinkOption("Press ENTER to check out AshaTelethia's Newgrounds!", "https://ashatelethia.newgrounds.com"),
			new Co("What did this person do?"),
            new Write("What else did this person do?"),
            new Assist("What else did this person do?")
		]),
		
		new DevCategory("Saruky",
        [
            new LinkOption("Press ENTER to check out Saruky's Newgrounds!", "https://saruky.newgrounds.com"),
			new Music1("What did this person do?")
		]),

        new DevCategory("Wizzkidwas",
        [
            new LinkOption("Press ENTER to check out Wizzkidwas' Twitter!", "https://twitter.com/wizzkidwas"),
			new LinkOption("Press ENTER to check out Wizzkidwas' Dev Twitter!", "https://twitter.com/WizzkidDev"),
			new Program("What did this person do?")
		]),

        new DevCategory("FuegO",
        [
			new LinkOption("Press ENTER to check out Fueg0's Youtube!", "https://www.youtube.com/channel/UC8udDz2kZJREgNfS8T4iuHg"),
			new MusicTut("What did this person do?"),
            new Music2("What else did this person do?")
		])
		
	];

	public var acceptInput:Bool = true;

	private var currentDescription:String = "";
	private var grpControls:FlxTypedGroup<Alphabet>;
    public static var versionShit:FlxText;

	var currentSelectedCat:DevCategory;
	var blackBorder:FlxSprite;
	var menuBG:FlxSprite;
	override function create()
	{
		instance = this;
		switch (MainMenuState.menuBGChoice)
		{
			case 2:
				menuBG = new FlxSprite().loadGraphic(Paths.image('menuDesatnega'));
				trace("Nega BGs");
			default:
				menuBG = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
				trace("boring ol' hero BG");
		}
		menuBG.color = 0xFFea71fd;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = true;
		add(menuBG);

		grpControls = new FlxTypedGroup<Alphabet>();
		add(grpControls);

		for (i in 0...options.length)
		{
			var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, options[i].getName(), true, false, true);
			controlLabel.isMenuItem = true;
			controlLabel.targetY = i;
			grpControls.add(controlLabel);
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
		}

		currentDescription = "none";

		versionShit = new FlxText(5, FlxG.height + 40, 0, "Description - " + currentDescription, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		
		blackBorder = new FlxSprite(-30,FlxG.height + 40).makeGraphic((Std.int(versionShit.width + 900)),Std.int(versionShit.height + 600),FlxColor.BLACK);
		blackBorder.alpha = 0.5;

		add(blackBorder);

		add(versionShit);

		FlxTween.tween(versionShit,{y: FlxG.height - 18},2,{ease: FlxEase.elasticInOut});
		FlxTween.tween(blackBorder,{y: FlxG.height - 18},2, {ease: FlxEase.elasticInOut});

		super.create();
	}

	var isCat:Bool = false;
	

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (acceptInput)
		{
			if (controls.BACK && !isCat)
			{
				MainMenuState.menuBGChoice = FlxG.random.int(1, 3);
				FlxG.switchState(new MainMenuState());
			}
			else if (controls.BACK)
			{
				isCat = false;
				grpControls.clear();
				for (i in 0...options.length)
					{
						var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, options[i].getName(), true, false);
						controlLabel.isMenuItem = true;
						controlLabel.targetY = i;
						grpControls.add(controlLabel);
						// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
					}
                if (isCat)
                    currentDescription = currentSelectedCat.getDevs()[curSelected].getDescription();
                else
                    currentDescription = "Please select a category";
                if (isCat)
                {
                    if (currentSelectedCat.getDevs()[curSelected].getAccept())
                        versionShit.text =  currentSelectedCat.getDevs()[curSelected].getValue() + "Description - " + currentDescription;
                    else
                        versionShit.text = "Description - " + currentDescription;
                }
                else
                    versionShit.text = "Description - " + currentDescription;
				curSelected = 0;
			}
			if (controls.UP_P)
				changeSelection(-1);
			if (controls.DOWN_P)
				changeSelection(1);
			
			if (controls.RESET)
					FlxG.save.data.offset = 0;

			if (controls.ACCEPT)
			{
				if (isCat)
				{
					if (currentSelectedCat.getDevs()[curSelected].press()) {
						grpControls.remove(grpControls.members[curSelected]);
						var ctrl:Alphabet = new Alphabet(0, (70 * curSelected) + 30, currentSelectedCat.getDevs()[curSelected].getDisplay(), true, false);
						ctrl.isMenuItem = true;
						grpControls.add(ctrl);
					}
				}
				else
				{
					currentSelectedCat = options[curSelected];
					isCat = true;
					grpControls.clear();
					for (i in 0...currentSelectedCat.getDevs().length)
						{
							var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, currentSelectedCat.getDevs()[i].getDisplay(), true, false);
							controlLabel.isMenuItem = true;
							controlLabel.targetY = i;
							grpControls.add(controlLabel);
							// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
						}
					curSelected = 0;
				}
                if (isCat)
                    currentDescription = currentSelectedCat.getDevs()[curSelected].getDescription();
                else
                    currentDescription = "Please select a category";
                if (isCat)
                {
                    if (currentSelectedCat.getDevs()[curSelected].getAccept())
                        versionShit.text =  currentSelectedCat.getDevs()[curSelected].getValue() + "Description - " + currentDescription;
                    else
                        versionShit.text = "Description - " + currentDescription;
                }
                else
                    versionShit.text = "Description - " + currentDescription;
			}
		}
		FlxG.save.flush();
	}

	var isSettingControl:Bool = false;

	function changeSelection(change:Int = 0)
	{
		#if !switch
		// NGio.logEvent("Fresh");
		#end
		
		FlxG.sound.play(Paths.sound("scrollMenu"), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = grpControls.length - 1;
		if (curSelected >= grpControls.length)
			curSelected = 0;

		if (isCat)
			currentDescription = currentSelectedCat.getDevs()[curSelected].getDescription();
		else
			currentDescription = "Please select a category";
		if (isCat)
		{
			if (currentSelectedCat.getDevs()[curSelected].getAccept())
				versionShit.text =  currentSelectedCat.getDevs()[curSelected].getValue() + "Description - " + currentDescription;
			else
				versionShit.text = "Description - " + currentDescription;
		}
		else
			versionShit.text = "Description - " + currentDescription;
		// selector.y = (70 * curSelected) + 30;

		var bullShit:Int = 0;

		for (item in grpControls.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
	}
}