package entities.enemies 
{
	import entities.player.Player;
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxParticle;
	/**
	 * ...
	 * @author ...
	 */
	public class Goomba extends BaseEnemy
	{
		[Embed(source = "../../data/art/goomba.png")] private var spritesheet:Class;
		
		public function Goomba( X:int = 0, Y:int = 0 ) 
		{
			super(X, Y);
			
			loadGraphic(spritesheet, true, true);
			
			addAnimation( "idle", [1] );
			addAnimation( "walk", [ 0, 1 ], 12, true );
			
			play("walk");
			
			RUN_SPEED = 200;
			GRAVITY = 500;
			JUMP_SPEED = 300;
			
			acceleration.y = GRAVITY;
			drag.x = RUN_SPEED * 4;
			maxVelocity.x = RUN_SPEED;
			maxVelocity.y = JUMP_SPEED;
			
			isPatrolling = true;
			
		}
		
		override public function update():void
		{
			if (isDead)
			{
				if ( dustcloud.finished )
				{
					dustcloud.kill();
					kill();
				}
				
				return;
			}
			
			super.update();
		}
		
		override public function onHit( _player:Player ):void
		{
			if(isDead)
				return;
			
			if ( _player.isTouching( DOWN ) && this.isTouching( UP ) )
			{
				_player.velocity.y = -_player.JUMP_SPEED / 3;
				_player.isOnGround = false;
				_player.play("jump");
				
				emitter = new FlxEmitter(x, y, 6);
				PlayState.level.add(emitter);
				
				emitter.gravity = GRAVITY;
				emitter.setYSpeed( -200, -100);
				
				for ( var i:int = 0; i < emitter.maxSize; i++ )
				{
					var particle:FlxParticle = new FlxParticle();
					
					particle.loadGraphic(starSprite);
					
					emitter.add(particle);
				}
				
				emitter.start();
				
				isDead = true;
				visible = false;
				
				dustcloud.x = x;
				dustcloud.y = y;
				dustcloud.visible = true;
				dustcloud.play("poof");
				
				PlayState.level.add(dustcloud);
				
				//kill();
			}
			else
			{
				_player.dealDamage();
			}
		}
		
	}

}