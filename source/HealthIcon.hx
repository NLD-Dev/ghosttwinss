package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		switch(char)
		{	
			case 'twinsone':
				loadGraphic(Paths.image('ghostCharacters/TwinsOne/Icons', 'ghosttwins'), true, 150, 150);

				antialiasing = true;
				animation.add('twinsone', [0, 1, 2], 0, false, isPlayer);
			default:
				loadGraphic(Paths.image('iconGrid'), true, 150, 150);

				antialiasing = true;
				animation.add('bf', [0, 1, 2, 3, 4], 0, false, isPlayer);
				animation.add('bf-car', [0, 1, 2, 3, 4], 0, false, isPlayer);
				animation.add('bf-christmas', [0, 1, 2, 3, 4], 0, false, isPlayer);
				animation.add('bf-pixel', [26, 27, 28], 0, false, isPlayer);
				animation.add('spooky', [11, 12, 13], 0, false, isPlayer);
				animation.add('pico', [17, 18, 19], 0, false, isPlayer);
				animation.add('mom', [20, 21, 22], 0, false, isPlayer);
				animation.add('mom-car', [20, 21, 22], 0, false, isPlayer);
				animation.add('tankman', [35, 36, 37], 0, false, isPlayer);
				animation.add('face', [44, 45, 46], 0, false, isPlayer);
				animation.add('dad', [8, 9, 10], 0, false, isPlayer);
				animation.add('senpai', [29, 30, 31], 0, false, isPlayer);
				animation.add('senpai-angry', [29, 30, 31], 0, false, isPlayer);
				animation.add('spirit', [32, 33, 34], 0, false, isPlayer);
				animation.add('bf-old', [38, 39, 40], 0, false, isPlayer);
				animation.add('bf-mean', [41, 42, 43], 0, false, isPlayer);
				animation.add('gf', [5, 6, 7], 0, false, isPlayer);
				animation.add('gf-christmas', [5, 6, 7], 0, false, isPlayer);
				animation.add('gf-pixel', [5, 6, 7], 0, false, isPlayer);
				animation.add('parents-christmas', [23, 24, 25], 0, false, isPlayer);
				animation.add('monster', [14, 15, 16], 0, false, isPlayer);
				animation.add('monster-christmas', [14, 15, 16], 0, false, isPlayer);
		}
		
		animation.play(char);
		antialiasing = true;
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
