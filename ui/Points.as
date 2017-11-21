package ui 
{
	import com.greensock.easing.Elastic;
	import com.greensock.TweenLite;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxText;
	import statics.GameStatics;
	/**
	 * ...
	 * @author ...
	 */
	public class Points extends FlxGroup
	{
		public var pointsTxt:FlxText;
		public var currentPoints:int;
		
		public function Points() 
		{
			super();
			
			currentPoints = GameStatics.POINTS;
			
			pointsTxt = new FlxText(0, GameStatics.TILESIZE/2, GameStatics.TILESIZE * 2, currentPoints.toString() );
			
			pointsTxt.scrollFactor = new FlxPoint();
			
			add(pointsTxt);
			
			pointsTxt.y = -32;
			TweenLite.to(pointsTxt, 1, { y:GameStatics.TILESIZE/2, ease:Elastic.easeOut } );
		}
		
		override public function update():void
		{
			if ( currentPoints != GameStatics.POINTS )
			{
				currentPoints = GameStatics.POINTS
				pointsTxt.text = currentPoints.toString();
			}
			
			super.update();
		}
		
	}

}