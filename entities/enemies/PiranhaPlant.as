package entities.enemies 
{
	import org.flixel.FlxTimer;
	/**
	 * ...
	 * @author ...
	 */
	public class PiranhaPlant extends BaseEnemy
	{
		
		[Embed(source = "../../data/art/piranha_plant.png")] private var spritesheet:Class;
		
		public var timer:FlxTimer;
		
		public function PiranhaPlant( X:int, Y:int ) 
		{
			super( X, Y );
			
			RUN_SPEED = 200;
			GRAVITY = 500;
			JUMP_SPEED = 600;
			
			acceleration.y = GRAVITY;
			drag.x = RUN_SPEED * 4;
			maxVelocity.x = RUN_SPEED;
			maxVelocity.y = JUMP_SPEED;
			
			
			loadGraphic(spritesheet, true);
			
			addAnimation("idle", [0, 1], 12, true);
			addAnimation("jump", [2, 3], 12, true);		
			
			play("idle");

			timer = new FlxTimer();
			timer.start(3, uint.MAX_VALUE, jumpUp);
		}
		
		private function jumpUp(_timer:FlxTimer):void
		{
			velocity.y = -JUMP_SPEED;
			play("jump");
		}
		
		override public function update():void
		{
			//velocity.y -= 4;
			
			if ( isTouching(DOWN) && velocity.y == 0 )
			{
				play("idle");
			}
			
			super.update();
		}
	}

}