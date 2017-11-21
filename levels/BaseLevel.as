package levels 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author ...
	 */
	public class BaseLevel extends FlxGroup
	{
		public var levelIndex:Number;
		public var startPosition:FlxPoint;
		
		public var map:FlxTilemap;
		public var decorations:FlxTilemap;
		public var objectMap:FlxTilemap;
		public var enemyMap:FlxTilemap;
		
		public var levelObjects:FlxGroup;
		public var levelEnemies:FlxGroup;
		
		public function BaseLevel() 
		{
			super();
		}
		
		public function loadLevelDetails():void
		{
			loadLevelObjects();
			loadLevelEnemies();
		}
		
		public function loadLevelObjects():void
		{
			levelObjects = new FlxGroup();
			
			for ( var _y:int = 0; _y < objectMap.heightInTiles; _y++ )
			{
				for ( var _x:int = 0; _x < objectMap.widthInTiles; _x++ )
				{
					if ( objectMap.getTile( _x, _y ) != 0 )
					{
						switch( objectMap.getTile( _x, _y ) )
						{
						}
					}
				}
			}
			
			add(levelObjects);
		}
		
		public function loadLevelEnemies():void
		{
			levelEnemies = new FlxGroup();
			
			for ( var _y:int = 0; _y < enemyMap.heightInTiles; _y++ )
			{
				for ( var _x:int = 0; _x < enemyMap.widthInTiles; _x++ )
				{
					if ( enemyMap.getTile( _x, _y ) != 0 )
					{
						switch( enemyMap.getTile( _x, _y ) )
						{
						}
					}
				}
			}
			
			add(levelEnemies);
		}
		
	}

}