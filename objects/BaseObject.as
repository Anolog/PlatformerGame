package objects 
{
	import entities.player.Player;
	import levels.LevelOne;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author ...
	 */
	public class BaseObject extends FlxSprite
	{
		
		public function BaseObject( X:int = 0, Y:int = 0 ) 
		{
			super( X * 32, Y * 32 );
			
			immovable = true;
		}
		
		public function onHit( _player:Player, _object:BaseObject ):void
		{
			
		}
		
	}

}