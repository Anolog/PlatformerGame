package entities.enemies 
{
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author ...
	 */
	public class Boo extends BaseEnemy
	{
		[Embed(source = "../../data/art/boo.png")] private var spritesheet:Class;
		
		public var chase:Boolean;
		
		public function Boo( X:int, Y:int ) 
		{
			super(X, Y);
			
			loadGraphic(spritesheet, true, true);
			
			addAnimation("idle", [0]);
			addAnimation("chase", [1]);
			
			play("idle");
			
			acceleration.y = 0;
			drag.x = RUN_SPEED / 4;
			drag.y = RUN_SPEED / 4;
			maxVelocity.x = RUN_SPEED;
			maxVelocity.y = RUN_SPEED;
			
			chase = false;
		}
		
		override public function update():void
		{
			if ( PlayState.player.x < x )
			{
				facing = LEFT;
				if (chase)
					acceleration.x = -drag.x;
			}
			else if ( PlayState.player.x > x )
			{
				facing = RIGHT;
				if (chase)
					acceleration.x = drag.x;
			}
			
			if ( PlayState.player.y < y )
			{
				if (chase)
					acceleration.y = -drag.y;
			}
			else if ( PlayState.player.y > y )
			{
				if (chase)
					acceleration.y = drag.y;
			}
			
			if ( PlayState.player.facing == facing )
			{
				chase = true;
				play("chase");
			}
			else if ( PlayState.player.facing != facing )
			{
				chase = false;
				play("idle");
				acceleration = new FlxPoint();
				velocity = new FlxPoint();
			}
			
			super.update();
		}
		
	}
}