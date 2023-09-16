package BlackJack
{
	import flash.display.Sprite;
	import flash.events.Event;
	import BlackJack.Game.Game;
	
	/**
	 * ...
	 * @author me
	 */
	public class Main extends Sprite 
	{
		public var game: Game;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			game = new Game();
			addChild(game);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}
		
	}
	
}