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
		animation.add('gf', [16], 0, false, isPlayer);
		
		//new characters
		animation.add('bfrave', [9, 10, 11], 0, false, isPlayer);
		animation.add('bfspook', [0, 1, 0], 0, false, isPlayer); //imo no win icon for bfspook.
		animation.add('hero', [3, 4, 5], 0, false, isPlayer);
		animation.add('herorave', [12, 13, 14], 0, false, isPlayer);
		animation.add('heroboss', [15, 16, 15], 0, false, isPlayer);
		animation.add('nega', [6, 7, 8], 0, false, isPlayer);
		animation.add('kikituto', [17, 18, 18], 0, false, isPlayer);
		
		iconSize = width;
		id = _id;
		animation.play(char);

		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}