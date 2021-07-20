package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');
				
			case 'kiki':
				//kiki is hero's gf (/s)
				//for some reason he didn't animate properly??? so??? i guess he just idles now.
				tex = Paths.getSparrowAtlas('characters/kiki_box');
				frames = tex;
				animation.addByPrefix('idle', 'kiki SIT right', 24, true);
				animation.addByPrefix('singUP', 'kiki up', 24, false);
				animation.addByPrefix('singRIGHT', 'kiki right', 24, false);
				animation.addByPrefix('singDOWN', 'kiki down', 24, false);
				animation.addByPrefix('singLEFT', 'kiki left', 24, false);

				addOffset('idle');
				addOffset('singUP');
				addOffset('singRIGHT');
				addOffset('singDOWN');
				addOffset('singLEFT');

				playAnim('idle');
				
			case 'kikirave':
				tex = Paths.getSparrowAtlas('characters/kiki_rave');
				frames = tex;
				animation.addByPrefix('idle', 'kiki SIT right', 24, true);

				addOffset('idle');

				playAnim('idle');
				
			case 'kikituto':
				tex = Paths.getSparrowAtlas('characters/kikiTuto');
				frames = tex;
				animation.addByPrefix('idle', 'kiki SIT right', 24, true);
				animation.addByPrefix('singUP', 'kiki up', 24, false);
				animation.addByPrefix('singRIGHT', 'kiki right', 24, false);
				animation.addByPrefix('singDOWN', 'kiki down', 24, false);
				animation.addByPrefix('singLEFT', 'kiki left', 24, false);

				addOffset('idle');
				addOffset('singUP');
				addOffset('singRIGHT');
				addOffset('singDOWN');
				addOffset('singLEFT');

				playAnim('idle');

			case 'bf':
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;

			case 'bfrave':
				var tex = Paths.getSparrowAtlas('characters/bfrave');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss");
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss");
				addOffset("singDOWNmiss");
				addOffset("hey");
				addOffset('firstDeath');
				addOffset('deathLoop');
				addOffset('deathConfirm');
				addOffset('scared');

				playAnim('idle');

				flipX = true;
			case 'bfspook':
				var tex = Paths.getSparrowAtlas('characters/bfspook');
				frames = tex;
	
				trace(tex.frames.length);
	
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);
	
				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
	
				animation.addByPrefix('scared', 'BF idle shaking', 24);
	
				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss");
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss");
				addOffset("singDOWNmiss");
				addOffset("hey");
				addOffset('firstDeath');
				addOffset('deathLoop');
				addOffset('deathConfirm');
				addOffset('scared');
	
				playAnim('idle');
	
				flipX = true;
			
			case 'hero':
				frames = Paths.getSparrowAtlas('characters/hero');
				animation.addByPrefix('idle', 'Hero Idle', 24, false);
				animation.addByPrefix('singUP', 'Hero Up', 24, false);
				animation.addByPrefix('singDOWN', 'Hero Down', 24, false);
				animation.addByPrefix('singLEFT', 'Hero Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Hero Right', 24, false);
				animation.addByPrefix('Hero Lets', 'Hero Lets', 24, false);
				animation.addByPrefix('Hero Go', 'Hero Go', 24, false);
				
				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("Hero Lets");
				addOffset("Hero Go");

				playAnim('idle');

			case 'heroboss':
				frames = Paths.getSparrowAtlas('characters/heroboss');
				animation.addByPrefix('idle', 'Heroboss Idle', 24, false);
				animation.addByPrefix('singUP', 'Heroboss Up', 24, false);
				animation.addByPrefix('singDOWN', 'Heroboss Down', 24, false);
				animation.addByPrefix('singLEFT', 'Heroboss Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Heroboss Right', 24, false);
				animation.addByPrefix('singUP-alt', 'UpSCREAM', 24, false);
				animation.addByPrefix('singDOWN-alt', 'DownSCREAM', 24, false);
				animation.addByPrefix('singLEFT-alt', 'LeftSCREAM', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'RightSCREAM', 24, false);
				animation.addByPrefix('Heroboss Shake', 'Heroboss Crouch', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUP-alt");
				addOffset("singRIGHT-alt");
				addOffset("singLEFT-alt");
				addOffset("singDOWN-alt");
				addOffset("Heroboss Shake");
				playAnim('idle');
				
			case 'herorave':
				frames = Paths.getSparrowAtlas('characters/herorave');
				animation.addByPrefix('idle', 'Hero Idle', 24, false);
				animation.addByPrefix('singUP', 'Hero Up', 24, false);
				animation.addByPrefix('singDOWN', 'Hero Down', 24, false);
				animation.addByPrefix('singLEFT', 'Hero Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Hero Right', 24, false);
				
				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
			
				playAnim('idle');

			case 'nega':
				frames = Paths.getSparrowAtlas('characters/nega');
				animation.addByPrefix('idle', 'Nega Idle', 24, false);
				animation.addByPrefix('singUP', 'Nega Up', 24, false);
				animation.addByPrefix('singDOWN', 'Nega Down', 24, false);
				animation.addByPrefix('singLEFT', 'Nega Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Nega Right', 24, false);
				animation.addByPrefix('singDOWN-alt', 'Nega Cough', 24, false);
				animation.addByPrefix('LaughLeft', '', 24, false);
				animation.addByPrefix('LaughUp', '', 24, false);
					
				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singDOWN-alt");
				addOffset("LaughLeft");
				addOffset("LaughUp");
				
				playAnim('idle');
				
			case 'nega2':
				frames = Paths.getSparrowAtlas('characters/nega');
				animation.addByPrefix('idle', 'Nega Idle', 24, false);
				animation.addByPrefix('singUP', 'Nega Up', 24, false);
				animation.addByPrefix('singDOWN', 'Nega Down', 24, false);
				animation.addByPrefix('singLEFT', 'Nega Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Nega Right', 24, false);
				animation.addByPrefix('singDOWN-alt', 'Nega Cough', 24, false);
				animation.addByPrefix('LaughLeft', '', 24, false);
				animation.addByPrefix('LaughUp', '', 24, false);
					
				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singDOWN-alt");
				addOffset("LaughLeft");
				addOffset("LaughUp");
				
				playAnim('idle');
		
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				trace('dance');
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				default:
					playAnim('idle');

			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
