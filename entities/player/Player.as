package entities.player 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import statics.GameStatics;
	/**
	 * ...
	 * @author 
	 */
	public class Player extends FlxSprite
	{
		[Embed(source="../../data/art/mario.png")] private var spritesheet:Class;
		
		public const GRAVITY:int = 500;
		public const RUN_SPEED:int = 200;
		public const JUMP_SPEED:int = 350;
		
		public var isOnGround:Boolean;
		public var canShoot:Boolean;
		
		public var playerHealth:int;
		
		public var bullets:FlxGroup;
		
		public function Player() 
		{
			super(64,512);
			
			loadGraphic(spritesheet,true, true);
			
			addAnimation("idle", [0]);
			addAnimation("walk", [0, 1], 12, true);
			addAnimation("jump", [2]);
			
			acceleration.y = GRAVITY;
			drag.x = RUN_SPEED * 4;
			
			maxVelocity.x = RUN_SPEED;
			maxVelocity.y = JUMP_SPEED;
			
			playerHealth = 3;
			
			canShoot = false;
			
			bullets = new FlxGroup();
		}
		
		public override function update():void
		{
			if ( acceleration.x != 0 )
			{
				if (facing == RIGHT)
				{
					acceleration.x -= drag.x;
					if ( acceleration.x >= 0 )
					{
						acceleration.x = 0;
					}
				}
				else
				{
					acceleration.x += drag.x;
					if ( acceleration.x <= 0 )
					{
						acceleration.x = 0;
					}
				}
			}
			
			if (FlxG.keys.LEFT)
			{
				if(isOnGround)
					play("walk");
					
				facing = LEFT;
				acceleration.x = -drag.x;
			}
			
			if (FlxG.keys.RIGHT)
			{
				if(isOnGround)
					play("walk");
					
				facing = RIGHT;
				acceleration.x = drag.x;
			}
			
			if ( FlxG.keys.justPressed("Z") && isOnGround)
			{
				play("jump");
				velocity.y = -JUMP_SPEED;
				isOnGround = false;
			}
			
			
			if ( FlxG.keys.justPressed("X")  )
			{
				var bullet:Bullet = new Bullet(x + width/2, y + height/3);
				bullet.fire(facing);
				
				bullets.add(bullet);
				
				FlxG.shake(0.01, 0.1);
				
			}
			
			if ( FlxG.keys.justPressed("C") )
			{
				var laser:Laser = new Laser(x + width / 2, y + height / 3, facing);
				laser.fire(facing);
				
				bullets.add(laser);
			}
			
			if ( FlxG.keys.justPressed("V") )
			{
				var spreader:Spreader = new Spreader(x + width / 2, y + height / 3, facing);
				spreader.fire(facing);
				
				bullets.add( spreader.bulletTop );
				bullets.add( spreader.bulletMiddle );
				bullets.add( spreader.bulletBottom );
			}
			
			
			
			if ( !velocity.x && !velocity.y )
			{
				play("idle");
			}
			if ( velocity.y )
			{
				isOnGround = false;
			}
			
			
			if ( !velocity.y && isTouching( DOWN ) )
			{
				isOnGround = true;
			}
			
			if (isTouching(LEFT) || isTouching(RIGHT) )
			{
				isOnGround = true;
			}
			
			
			/*
			if ( isTouching(LEFT)  || isTouching(RIGHT) )
			{
				isOnGround = true;
			}
			*/
			super.update();
		}
		
		
		public function dealDamage( _damage:int = 1 ):void
		{
			if ( flickering == false )
			{
				canShoot = false;
				playerHealth -= _damage;
				GameStatics.HEALTH = playerHealth;
				flicker(1);
				
				FlxG.flash(FlxG.RED, 0.1);
			}
			
			if ( playerHealth <= 0 )
			{
				PlayState.timer.start(3, 0, PlayState.resetGame);
				
				kill();
			}
		}
	}

}