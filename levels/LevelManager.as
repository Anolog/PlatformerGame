package levels 
{
	import statics.GameStatics;
	/**
	 * ...
	 * @author ...
	 */
	public class LevelManager 
	{
		
		public var level:BaseLevel;
		
		public function LevelManager() 
		{
			
		}
		
		public function loadLevel():void
		{
			
			switch (GameStatics.CURRENTLEVEL)
			{
				case 1.1:
					level = new LevelOne();
					break;
					
				case 1.2:
					level = new LevelTwo();
					break;
			}
			
			PlayState.level = level;
			
		}
		
	}

}