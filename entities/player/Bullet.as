package entities.player 
{
	import adobe.utils.ProductManager;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author ...
	 */
	public class Bullet extends FlxSprite
	{
		
		[Embed(source = "../../data/art/bullet.png")] private var spritesheet:Class;
		
		public var speed:Number;
		
		public function Bullet( X:int = 0, Y:int = 0 ) 
		{
			super(X, Y);
			loadGraphic(spritesheet, false, true);
			
			speed = 400;

		}
		
		public function fire( _playerFacing:uint ):void
		{
			if (_playerFacing == LEFT)
			{
				velocity.x = -speed;
			}
			else if (_playerFacing == RIGHT)
			{
				velocity.x = speed;
			}
			
		}
		
		
		
	}

}