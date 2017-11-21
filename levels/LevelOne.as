package levels 
{
	import entities.enemies.Boo;
	import entities.enemies.Goomba;
	import entities.enemies.PiranhaPlant;
	import objects.CoinObject;
	import org.flixel.FlxGroup;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author 
	 */
	public class LevelOne extends BaseLevel
	{
		[Embed(source = "../data/leveldata/mapCSV_1.1_Level1.csv", mimeType = "application/octet-stream")] private var csv:Class;
		[Embed(source = "../data/leveldata/mapCSV_1.1_Decorations.csv", mimeType = "application/octet-stream")] private var decorationsCSV:Class;
		[Embed(source = "../data/leveldata/mapCSV_1.1_Objects.csv", mimeType = "application/octet-stream")] private var objectsCSV:Class;
		[Embed(source = "../data/leveldata/mapCSV_1.1_Enemies.csv", mimeType = "application/octet-stream")]private var enemiesCSV:Class;
		
		[Embed(source = "../data/art/BasicTileset.png")] private var tileset:Class;
		
		public function LevelOne() 
		{
			super();
			
			map = new FlxTilemap();
			map.loadMap(new csv, tileset, 32, 32);
			add(map);
			
			decorations = new FlxTilemap();
			decorations.loadMap(new decorationsCSV, tileset, 32, 32);
			add(decorations);
			
			objectMap = new FlxTilemap();
			objectMap.loadMap(new objectsCSV, tileset, 32, 32);
			
			enemyMap = new FlxTilemap();
			enemyMap.loadMap( new enemiesCSV, tileset, 32, 32 );
			
			loadLevelDetails();
			
		}
		
		override public function loadLevelDetails():void
		{
			loadLevelObjects();
			loadLevelEnemies();
		}
		
		override public function loadLevelObjects():void
		{
			levelObjects = new FlxGroup();
			
			for ( var _y:int = 0; _y < objectMap.heightInTiles; _y++ )
			{
				for ( var _x:int = 0; _x < objectMap.widthInTiles; _x++ )
				{
					if ( objectMap.getTile(_x, _y) != 0 )
					{
						switch( objectMap.getTile(_x, _y) )
						{
							case 4:
								levelObjects.add( new CoinObject( _x, _y ) );
								break;
						}
					}
				}
			}
			
			add(levelObjects);
		}
		
		override public function loadLevelEnemies():void
		{
			levelEnemies = new FlxGroup();
			
			for ( var _y:int = 0; _y < enemyMap.heightInTiles; _y++ )
			{
				for ( var _x:int = 0; _x < enemyMap.widthInTiles; _x++ )
				{
					if ( enemyMap.getTile(_x, _y) != 0 )
					{
						switch( enemyMap.getTile(_x, _y) )
						{
							case 16:
								levelEnemies.add( new Goomba( _x, _y ) );
								break;
								
							case 17:
								levelEnemies.add( new Boo( _x, _y ) );
								break;
								
							case 19:
								levelEnemies.add( new PiranhaPlant( _x, _y ) );
								break;
						}
					}
				}
			}
			
			add(levelEnemies);
		}
		
	}

}