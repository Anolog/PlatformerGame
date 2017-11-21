package objects 
{
	import entities.player.Player;
	import levels.LevelOne;
	import statics.GameStatics;
	/**
	 * ...
	 * @author ...
	 */
	public class CoinObject extends BaseObject
	{
		[Embed(source = "../data/art/coin_spritesheet.png")] private var spritesheet:Class;
		
		public function CoinObject( X:int = 0, Y:int = 0 ) 
		{
			super( X, Y );
			loadGraphic(spritesheet);
		}
		
		override public function onHit(_player:Player, _object:BaseObject):void
		{
			_player.canShoot = true;
			
			GameStatics.POINTS += 143;
			
			kill();
			
		}
		
	}

}