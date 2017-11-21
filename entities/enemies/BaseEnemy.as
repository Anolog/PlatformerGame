package entities.enemies 
{
	import entities.player.Player;
	import org.flixel.FlxEmitter;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import statics.GameStatics;
	/**
	 * ...
	 * @author ...
	 */
	public class BaseEnemy extends FlxSprite
	{
		[Embed(source = "../../data/art/particle_star.png")] public var starSprite:Class;
		[Embed(source = "../../data/art/dustcloud.png")] public var dustSprite:Class;
		
		public var RUN_SPEED:int = 500;
		public var GRAVITY:int = 400 ;
		public var JUMP_SPEED:int = 200;
		
		public var isPatrolling:Boolean;
		public var isDead:Boolean;
		
		public var emitter:FlxEmitter;
		public var dustcloud:FlxSprite;
		
		public function BaseEnemy( X:int = 0, Y:int = 0 ) 
		{
			super( X  * GameStatics.TILESIZE, Y * GameStatics.TILESIZE);
			
			acceleration.y = GRAVITY;
			drag.x = RUN_SPEED * 4;
			maxVelocity.x = RUN_SPEED;
			maxVelocity.y = JUMP_SPEED;
			
			dustcloud = new FlxSprite(x, y);
			dustcloud.loadGraphic(dustSprite, true);
			
			dustcloud.addAnimation("poof", [0, 1, 2, 3], 12, false);
			dustcloud.visible = false;
			
			isDead = false;
			
			//active = false;
		}
		
		
		public function onHit( _player:Player ):void
		{
			
		}
		
		
		override public function update():void
		{
			if (isPatrolling)
				patrol();
			
			super.update();
		}
		
		public function patrol():void
		{
			
			if ( facing == LEFT )
			{
				if ( !PlayState.level.map.overlapsPoint( new FlxPoint(x - width / 2, y + height + 1) ) )
				{
					facing = RIGHT;
				}
			}
			else
			{
				if ( !PlayState.level.map.overlapsPoint( new FlxPoint(x + width + width / 2, y + height + 1) ) )
				{
					facing = LEFT;
				}
			}
			
			
			
			if ( facing == LEFT )
			{
				acceleration.x = -drag.x;
				if ( isTouching(LEFT) )
				{
					facing = RIGHT;
				}
			}
			else
			{
				acceleration.x = drag.x;
				if ( isTouching(RIGHT) )
				{
					facing = LEFT;
				}
			}
			
		}
		
		
		
		
		
	}

}