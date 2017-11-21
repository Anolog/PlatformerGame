package ui 
{
	import org.flixel.FlxGroup;
	import statics.GameStatics;
	/**
	 * ...
	 * @author ...
	 */
	public class Hearts extends FlxGroup
	{
		public var heartGroup:FlxGroup;
		public var currentHealth:int;
		
		public function Hearts() 
		{
			super();
			
			currentHealth = GameStatics.HEALTH;
			
			heartGroup = new FlxGroup();
			add(heartGroup);
			
			for ( var i:int = 0; i < GameStatics.MAXHEALTH; i++ )
			{
				var heart:HeartContainer = new HeartContainer();
				
				heart.x = 1;
				heart.x += (heart.width + 2) * i;
				
				heartGroup.add(heart);
			}
		}
		
		override public function update():void
		{
			
			if ( currentHealth != GameStatics.HEALTH )
			{
				currentHealth = GameStatics.HEALTH;
				
				for ( var i:int = GameStatics.MAXHEALTH -1; i >= 0; i-- )
				{
					if ( heartGroup.members[i].isEmpty == false )
					{
						heartGroup.members[i].EmptyContainer();
						i = -1;
						
					}
					
				}
				
			}
			
			super.update();
		}
		
	}

}