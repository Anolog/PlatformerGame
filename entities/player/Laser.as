package entities.player 
{
	/**
	 * ...
	 * @author ...
	 */
	public class Laser extends Bullet
	{
		
		public function Laser( X:int, Y:int, playerFacing:uint ) 
		{
			super( X, Y );
			
			facing = playerFacing;
			
			speed = 800;
			scale.x *= 10;
			
			if(facing == RIGHT)
				offset.x -= ( scale.x + width );
			else if(facing == LEFT)
				offset.x += ( scale.x + width*2 );
		}
		
	}

}