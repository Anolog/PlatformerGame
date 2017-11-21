package
{

	import air.update.states.HSM;
	import entities.enemies.BaseEnemy;
	import entities.player.Bullet;
	import entities.player.Player;
	import levels.BaseLevel;
	import levels.LevelManager;
	import levels.LevelOne;
	import levels.LevelTwo;
	import objects.BaseObject;
	import org.flixel.*;
	import ui.Hud;

	public class PlayState extends FlxState
	{
		public static var player:Player;
		public static var level:BaseLevel;
		
		public var levelManager:LevelManager;
		
		public var hud:Hud;
		
		public static var timer:FlxTimer;
		
		override public function create():void
		{
			//FlxG.visualDebug = true;
			FlxG.bgColor = 0xFF63A9FE;
			
			levelManager = new LevelManager();
			levelManager.loadLevel();
			
			add(level);
			
			hud = new Hud();
			add(hud);
			
			player = new Player();
			add(player);
			add(player.bullets);
			
			timer = new FlxTimer();
			
			FlxG.camera.follow(player, 1);
			FlxG.camera.setBounds(0, 0, level.map.width, level.map.height, true);
		}
		
		override public function update():void
		{
			
			updateCollision();
		//	updateActiveSprites();
			
			super.update();
		}
		
		public function updateCollision():void
		{
			FlxG.collide(player, level.map);
			FlxG.overlap(player, level.levelObjects, onObjectHit);
			FlxG.collide(player, level.levelEnemies, onEnemyHit);
			
			FlxG.collide(level.levelEnemies, level.map);
			FlxG.collide(level.levelEnemies, level.levelEnemies);
			
			FlxG.collide(player.bullets, level.map, onShootMap);
			FlxG.collide(player.bullets, level.levelEnemies, onShootEnemy);
			
			//FlxG.collide(player, player.bullets);
		}
		
		public function updateActiveSprites():void
		{
			for ( var i:int = 0; i < level.levelEnemies.length; i++ )
			{
				if ( FlxU.getDistance(new FlxPoint(player.x, player.y), new FlxPoint(level.levelEnemies.members[i].x, level.levelEnemies.members[i].y)) < 400 )
				{
					level.levelEnemies.members[i].active = true;
				}
				else
				{
					level.levelEnemies.members[i].active = false;
				}
			}
			
		}
		
		public static function resetGame( _timer:FlxTimer ):void
		{
			FlxG.switchState( new MenuState() );
		}

		public function onObjectHit( _player:Player, _object:BaseObject ):void
		{
			_object.onHit(_player, _object);
		}
		
		public function onEnemyHit( _player:Player, _enemy:BaseEnemy ):void
		{
			_enemy.onHit( _player );
		}
		
		public function onShootEnemy( _bullet:Bullet, _enemy:BaseEnemy ):void
		{
			_bullet.kill();
			_enemy.kill();
		}
		
		public function onShootMap( _bullet:Bullet, _tile:FlxBasic ):void
		{
			_bullet.kill();
			
		}
	}
}

