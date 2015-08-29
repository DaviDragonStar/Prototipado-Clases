package Utils.start
{
	import flash.display.Stage;
	import starling.events.Event;
	import starling.core.Starling;
	import starling.utils.AssetManager;
	
	/**
	 * ...
	 * @author BrunoD
	 */
	public class DStarling
	{
		//Una clase estática no tiene constructor
		private static var starling:Starling
		private static var _assetsManager:AssetManager;
		private static var _assets:Vector.<String>;
		private static var onComplete:Function;
		private static var baseClass:Class;
		
		public static function init(rootClass:Class, 
									stage:Stage, 
									assets:Vector.<String>, 
									_onComplete:Function):void
		{
			starling = new Starling(rootClass, stage);
			onComplete = _onComplete;
			baseClass = rootClass;
			starling.start();
			assetsManager = new AssetManager();
			_assets = assets;
			starling.addEventListener(Event.ROOT_CREATED, onRootCreated);
		}
		
		static private function onRootCreated(e:Event):void
		{
			starling.removeEventListener(Event.ROOT_CREATED, onRootCreated);
			for (var i:int = 0; i < _assets.length; i++)
			{
				assetsManager.enqueue(_assets[i]);
			}
			assetsManager.loadQueue(endQueue);
		}
		
		static private function endQueue(ratio:Number):void
		{
			if (ratio == 1)
			{
				//trace("Assets completos");
				var game:Object = starling.root as baseClass;
				game.start();
				//onComplete();
			}
		}
		
		static public function get assetsManager():AssetManager 
		{
			return _assetsManager;
		}
		
		static public function set assetsManager(value:AssetManager):void 
		{
			_assetsManager = value;
		}
	}
}