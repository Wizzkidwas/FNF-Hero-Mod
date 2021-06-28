package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitLeft2:FlxSprite;
	var portraitLeft3:FlxSprite;
	var portraitRight:FlxSprite;
	var portraitRight2:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'roses':
				hasDialog = true;
				FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));

				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-senpaiMad');
				box.animation.addByPrefix('normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
				box.animation.addByIndices('normal', 'SENPAI ANGRY IMPACT SPEECH', [4], "", 24);

			case 'thorns':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [11], "", 24);

				var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/spiritFaceForward'));
				face.setGraphicSize(Std.int(face.width * 6));
				add(face);
			
			case 'kick-it':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);

			case 'anomaly':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);				
				
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				portraitLeft = new FlxSprite(-20, 40);
				portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
				portraitLeft.animation.addByPrefix('enter', 'Senpai Portrait Enter', 24, false);
				portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
				portraitLeft.updateHitbox();
				portraitLeft.scrollFactor.set();
				add(portraitLeft);
				portraitLeft.visible = false;
			case 'roses':
				portraitLeft = new FlxSprite(-20, 40);
				portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
				portraitLeft.animation.addByPrefix('enter', 'Senpai Portrait Enter', 24, false);
				portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
				portraitLeft.updateHitbox();
				portraitLeft.scrollFactor.set();
				add(portraitLeft);
				portraitLeft.visible = false;
			case 'thorns':
				portraitLeft = new FlxSprite(-20, 40);
				portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
				portraitLeft.animation.addByPrefix('enter', 'Senpai Portrait Enter', 24, false);
				portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
				portraitLeft.updateHitbox();
				portraitLeft.scrollFactor.set();
				add(portraitLeft);
				portraitLeft.visible = false;
			
			case 'kick-it':
				portraitLeft = new FlxSprite(-20, 40);
				portraitLeft.frames = Paths.getSparrowAtlas('cutscenes/hero/portrait', 'rapcon');
				portraitLeft.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
				// portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
				// portraitLeft.updateHitbox();
				portraitLeft.scrollFactor.set();
				portraitLeft.flipX = true;
				add(portraitLeft);
				portraitLeft.visible = false;
			case 'anomaly':
				portraitLeft = new FlxSprite(-20, 40);
				portraitLeft.frames = Paths.getSparrowAtlas('cutscenes/boss/portrait', 'rapcon');
				portraitLeft.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
				// portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
				// portraitLeft.updateHitbox();
				portraitLeft.scrollFactor.set();
				portraitLeft.flipX = true;
				add(portraitLeft);
				portraitLeft.visible = false;
		}

		// Easy copypastes to add heroL, kiki and nega when needed
		/*
		heroL:
			portraitRight2 = new FlxSprite(-20, 40);
			portraitRight2.frames = Paths.getSparrowAtlas('cutscenes/hero/portrait', 'rapcon');
			portraitRight2.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
			portraitRight2.scrollFactor.set();
			add(portraitRight2);
			portraitRight2.visible = false;

		kiki:
			portraitLeft2 = new FlxSprite(-20, 40);
			portraitLeft2.frames = Paths.getSparrowAtlas('cutscenes/kiki/portrait', 'rapcon');
			portraitLeft2.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
			portraitLeft2.scrollFactor.set();
			portraitLeft2.flipX = true;
			add(portraitLeft2);
			portraitLeft2.visible = false;

		nega:
			portraitLeft3 = new FlxSprite(-20, 40);
			portraitLeft3.frames = Paths.getSparrowAtlas('cutscenes/nega/portrait', 'rapcon');
			portraitLeft3.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
			portraitLeft3.scrollFactor.set();
			portraitLeft3.flipX = true;
			add(portraitLeft3);
			portraitLeft3.visible = false;
		*/




		/* Preserves Senpai images in week 6
		if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'roses' || PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft = new FlxSprite(-20, 40);
			portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
			portraitLeft.animation.addByPrefix('enter', 'Senpai Portrait Enter', 24, false);
			portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
		}

		// Will put in images for hero dialogue
		if (PlayState.SONG.song.toLowerCase() == 'kick-it')
		{
			portraitLeft = new FlxSprite(-20, 40);
			portraitLeft.frames = Paths.getSparrowAtlas('cutscenes/hero/portrait', 'rapcon');
			portraitLeft.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
			portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
		}

		// Will put in images for boss hero dialogue
		if (PlayState.SONG.song.toLowerCase() == 'anomaly')
		{
			portraitLeft = new FlxSprite(-20, 40);
			portraitLeft.frames = Paths.getSparrowAtlas('cutscenes/boss/portrait', 'rapcon');
			portraitLeft.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
			portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
		}*/

		portraitLeft2 = new FlxSprite(450, 40);
		portraitLeft2.frames = Paths.getSparrowAtlas('cutscenes/kiki/portrait', 'rapcon');
		portraitLeft2.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
		portraitLeft2.scrollFactor.set();
		portraitLeft2.flipX = true;
		add(portraitLeft2);
		portraitLeft2.visible = false;

		portraitLeft3 = new FlxSprite(450, 40);
		portraitLeft3.frames = Paths.getSparrowAtlas('cutscenes/nega/portrait', 'rapcon');
		portraitLeft3.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
		portraitLeft3.scrollFactor.set();
		portraitLeft3.flipX = true;
		add(portraitLeft3);
		portraitLeft3.visible = false;

		portraitRight2 = new FlxSprite(300, 40);
		portraitRight2.frames = Paths.getSparrowAtlas('cutscenes/hero/portrait', 'rapcon');
		portraitRight2.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
		portraitRight2.scrollFactor.set();
		add(portraitRight2);
		portraitRight2.visible = false;

		portraitRight = new FlxSprite(0, 40);
		portraitRight.frames = Paths.getSparrowAtlas('weeb/bfPortrait');
		portraitRight.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
		portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.9));
		portraitRight.updateHitbox();
		portraitRight.scrollFactor.set();
		add(portraitRight);
		portraitRight.visible = false;
		
		box.animation.play('normalOpen');
		box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
		box.updateHitbox();
		add(box);

		box.screenCenter(X);
		portraitLeft.screenCenter(X);

		handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox'));
		add(handSelect);


		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'Pixel Arial 11 Bold';
		dropText.color = 0xFFD89494;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'Pixel Arial 11 Bold';
		swagDialogue.color = 0xFF3F2021;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'roses')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}

		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitLeft.visible = false;
						portraitLeft2.visible = false;
						portraitLeft3.visible = false;
						portraitRight.visible = false;
						portraitRight2.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'heroL':	// This is portraitLeft
				portraitLeft2.visible = false;
				portraitLeft3.visible = false;
				portraitRight.visible = false;
				portraitRight2.visible = false;
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'bf':		// This is portraitRight
				portraitLeft.visible = false;
				portraitLeft2.visible = false;
				portraitLeft3.visible = false;
				portraitRight2.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
			case 'heroR':	// This is portraitRight2
				portraitLeft.visible = false;
				portraitLeft2.visible = false;
				portraitLeft3.visible = false;
				portraitRight.visible = false; // These lines make other portraits invisible
				if (!portraitRight2.visible)    // If character protrait isn't visible already
				{
					portraitRight2.visible = true;			// Do the funky animations
					portraitRight2.animation.play('enter');
				}
			case 'kiki':	// This is portraitLeft2
				portraitLeft.visible = false;
				portraitLeft3.visible = false;
				portraitRight.visible = false;
				portraitRight2.visible = false; // These lines make other portraits invisible
				if (!portraitLeft2.visible)    // If 2nd protrait isn't visible already
				{
					portraitLeft2.visible = true;			// Do the funky animations
					portraitLeft2.animation.play('enter');
				}
			case 'nega':	// This is portraitLeft3
				portraitLeft.visible = false;
				portraitLeft2.visible = false;
				portraitRight.visible = false;
				portraitRight2.visible = false; // These lines make other portraits invisible
				if (!portraitLeft3.visible)    // If 2nd protrait isn't visible already
				{
					portraitLeft3.visible = true;			// Do the funky animations
					portraitLeft3.animation.play('enter');
				}
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
