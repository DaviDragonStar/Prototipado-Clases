package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.core.Starling;
	import starling.utils.AssetManager;
	import Utils.start.DStarling;
	
	/**
	 * ...
	 * @author BrunoD
	 */
	[SWF(frameRate=60,heigth=600,width=480)]
	
	public class Main extends Sprite
	{
		public function Main()
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var assets:Vector.<String> = new Vector.<String>();
			assets.push('assets/scene1.png');
			assets.push('assets/walker.png');
			assets.push('assets/walker.xml');
			assets.push('assets/coin.png');
			DStarling.init(Game, stage, assets, starGame);
		}
		
		private function starGame():void
		{
			trace("Start Game");
		}
	}
}