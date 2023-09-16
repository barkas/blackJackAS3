package BlackJack.GUI 
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.*;
	
	/**
	 * ...
	 * @author me
	 */
	public class BetPanel extends Sprite 
	{
		public var bet1: MovieClip;
		public var bet5: MovieClip;
		public var bet25: MovieClip;
		public var bet50: MovieClip;
		public var bet100: MovieClip;
		private var betY: Number = 400;
		
		private var betCursor: MovieClip;
		
		public function BetPanel() 
		{
			
		}
		
		public function init():void
		{
			var cursor: Class = getDefinitionByName("cursor") as Class;
			betCursor = new cursor() as MovieClip;
			
			addChild( betCursor );
			betCursor.y = betY + 60;
			
			var _bet1: Class = getDefinitionByName("_1") as Class;
			bet1 = new _bet1() as MovieClip;
			var _bet5: Class = getDefinitionByName("_5") as Class;
			bet5 = new _bet5() as MovieClip;
			var _bet25: Class = getDefinitionByName("_25") as Class;
			bet25 = new _bet25() as MovieClip;
			var _bet50: Class = getDefinitionByName("_50") as Class;
			bet50 = new _bet50() as MovieClip;
			var _bet100: Class = getDefinitionByName("_100") as Class;
			bet100 = new _bet100() as MovieClip;
			
			addChild(bet1);
			addChild(bet5);
			addChild(bet25);
			addChild(bet50);
			addChild(bet100);
			
			bet1.width = 60;
			
			bet1.y = betY;
			bet5.y = betY;
			bet25.y = betY;
			bet50.y = betY;
			bet100.y = betY;
			bet5.x = 65;
			bet25.x = 130;
			bet50.x = 195;
			bet100.x = 260;
		}
		
		public function dragCursor( e: Event ): void
		{
			betCursor.x = this.mouseX - 10;
		}
		
		public function disableBet():void
		{
			bet1.mouseEnabled = false;
			bet5.mouseEnabled = false;
			bet25.mouseEnabled = false;
			bet50.mouseEnabled = false;
			bet100.mouseEnabled = false;
		}
		
		public function enableBet():void
		{
			bet1.mouseEnabled = true;
			bet5.mouseEnabled = true;
			bet25.mouseEnabled = true;
			bet50.mouseEnabled = true;
			bet100.mouseEnabled = true;
		}
	}	
}