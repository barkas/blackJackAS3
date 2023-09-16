package BlackJack.Logic
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author me
	 */
	public class Card 
	{
		public var rank:String;
		public var value:int;
		public var suit: String;
     	public var name:String;
		
		public function Card(rank: String, value: int, suit: String)
	    {
			this.rank = rank;
			this.value = value;
			this.suit = suit;
	    }
	}	
	
}