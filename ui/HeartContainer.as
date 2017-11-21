package ui 
{
	import com.greensock.easing.Elastic;
	import com.greensock.TweenLite;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author ...
	 */
	public class HeartContainer extends FlxSprite
	{
		[Embed(source = "../data/art/heart.png")] private var spritesheet:Class;
		
		public var isEmpty:Boolean;
		
		public function HeartContainer() 
		{
			super();
			
			loadGraphic(spritesheet, true);
			
			addAnimation("full", [0]);
			addAnimation("empty", [1]);
			
			play("full");
			
			scrollFactor = new FlxPoint();
			
			isEmpty = false;
			
			y = -32;
			TweenLite.to(this, 1, { y:0, ease:Elastic.easeOut } );
		}
		
		public function EmptyContainer():void
		{
			play("empty");
			isEmpty = true;
		}
		
		public function FillContainer():void
		{
			play("full");
			isEmpty = false;
		}
		
	}

}