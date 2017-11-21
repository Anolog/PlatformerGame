package ui 
{
	import com.greensock.easing.Elastic;
	import com.greensock.TweenLite;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import statics.GameStatics;
	/**
	 * ...
	 * @author ...
	 */
	public class Hud extends FlxGroup
	{
		public var points:Points;
		public var hearts:Hearts;
		
		public var background:FlxSprite;
		
		public function Hud() 
		{
			super();
			
			background = new FlxSprite();
			background.makeGraphic(GameStatics.TILESIZE * 2, GameStatics.TILESIZE, 0xFF000000);
			background.scrollFactor = new FlxPoint();
			background.alpha = 0.25;
			add(background);
			
			background.y = -32;
			TweenLite.to(background, 1, { y:0, ease:Elastic.easeOut } );			
			
			points = new Points();
			add(points);
			
			hearts = new Hearts();
			add(hearts);
			
		}
		
	}

}