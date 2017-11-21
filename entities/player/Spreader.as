package entities.player 
{
	/**
	 * ...
	 * @author ...
	 */
	public class Spreader extends Bullet
	{
		
		public var bulletTop:Bullet;
		public var bulletMiddle:Bullet;
		public var bulletBottom:Bullet;
		
		public function Spreader( X:int, Y:int, playerFacing:uint ) 
		{
			super(X, Y);
			
			facing = playerFacing;
			
			speed = 150;
			
			bulletTop = new Bullet(X, Y);
			bulletMiddle = new Bullet(X, Y);
			bulletBottom = new Bullet(X, Y);
		}
		
		
		override public function fire( _playerFacing:uint ):void
		{
			if (_playerFacing == RIGHT)
			{
				bulletTop.velocity.x = speed;
				bulletTop.velocity.y = -speed;
				
				bulletMiddle.velocity.x = speed;
				
				bulletBottom.velocity.x = speed;
				bulletBottom.velocity.y = speed;
			}
			else if (_playerFacing == LEFT)
			{
				bulletTop.velocity.x = -speed;
				bulletTop.velocity.y = -speed;
				
				bulletMiddle.velocity.x = -speed;
				
				bulletBottom.velocity.x = -speed;
				bulletBottom.velocity.y = speed;
			}
			
			
			
		}
		
	}

}