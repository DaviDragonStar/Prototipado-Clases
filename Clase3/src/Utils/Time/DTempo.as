package Utils.Time
{
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author BrunoD
	 */
	public class DTempo
	{
		
		public static var dt:Number;
		public static var current:Number = 0;
		
		public static function init():void
		{
			current = getTimer();
		}
		
		public static function update():void
		{
			dt = (getTimer() - current) * 0.001;
			current = getTimer();
		}
	
	}

}