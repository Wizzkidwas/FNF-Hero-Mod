package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;
	
	//shit stolen from fps plus
	public var id:Int;

	public var defualtIconScale:Float = 1;
	public var iconScale:Float = 1;
	public var iconSize:Float;

	public function new(char:String = 'bf', isPlayer:Bool = false, ?_id:Int = -1)
	{
		super();
		
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		antialiasing = true;
		//animation.add('bf', [0, 1], 0, false, isPlayer);
		animation.add('bf', [0, 1, 2], 0, false, isPlayer); // <-- the real one, i just don't want the code to crash and burn
		//leaving these here so shit doesn't die and crash for now??
		animation.add('bf-car', [0, 1], 0, false, isPlayer);
		animation.add('bf-christmas', [0, 1], 0, false, isPlayer);
		animation.add('bf-pixel', [21, 21], 0, false, isPlayer);
		animation.add('spooky', [2, 3], 0, false, isPlayer);
		animation.add('pico', [4, 5], 0, false, isPlayer);
		animation.add('mom', [6, 7], 0, false, isPlayer);
		animation.add('mom-car', [6, 7], 0, false, isPlayer);
		animation.add('tankman', [8, 9], 0, false, isPlayer);
		animation.add('face', [10, 11], 0, false, isPlayer);
		animation.add('dad', [12, 13], 0, false, isPlayer);
		animation.add('senpai', [22, 22], 0, false, isPlayer);
		animation.add('senpai-angry', [22, 22], 0, false, isPlayer);
		animation.add('spirit', [23, 23], 0, false, isPlayer);
		animation.add('bf-old', [14, 15], 0, false, isPlayer);
		animation.add('gf', [16], 0, false, isPlayer);
		animation.add('gf-christmas', [16], 0, false, isPlayer);
		animation.add('gf-pixel', [16], 0, false, isPlayer);
		animation.add('parents-christmas', [17, 18], 0, false, isPlayer);
		animation.add('monster', [19, 20], 0, false, isPlayer);
		animation.add('monster-christmas', [19, 20], 0, false, isPlayer);
		
		//new characters
		animation.add('bfrave', [9, 10, 11], 0, false, isPlayer);
		animation.add('bfspook', [0, 1, 0], 0, false, isPlayer); //imo no win icon for bfspook.
		animation.add('hero', [3, 4, 5], 0, false, isPlayer);
		animation.add('herorave', [12, 13, 14], 0, false, isPlayer);
		animation.add('heroboss', [15, 16, 15], 0, false, isPlayer);
		animation.add('nega', [6, 7, 8], 0, false, isPlayer);
		animation.add('tak', [17, 18, 19], 0, false, isPlayer);
		animation.add('takboss', [23, 24, 23], 0, false, isPlayer);
		animation.add('twins', [20, 21, 22], 0, false, isPlayer);
		
		iconSize = width;
		id = _id;
		animation.play(char);

		switch(char)
		{
			case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit' | 'gf-pixel':
				antialiasing = false;
		}

		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}