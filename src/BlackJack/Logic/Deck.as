package BlackJack.Logic
{
	import BlackJack.Logic.Card;
	
	/**
	 * ...
	 * @author me
	 */
	public class  Deck
	{
		public var ranks: Array;
		public var values: Array;
		public var suits: Array;
		public var cards:Array = new Array();
		public var sDeck:Array = new Array();
				
		public function Deck()
		{
			ranks = ["Ace","Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"];
		    values = [1,2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10];
			suits = ["Clubs", "Dimonds", "Hearts", "Spades"];
			for ( var s:int = 0; s < suits.length; s++ )
			{
				for ( var i:int = 0; i < 13; i++ )
				{
					var card: Card = new Card( ranks[i], values[i], suits[s] );
					cards.push( card );
				}
			}
			for ( i = 1; i <= 52; i++)
			cards[i - 1].name = "card" + i;
		}
		
		public function shuffle():void
		{
			var index:int;
			var temp: Array = new Array();
			for ( var i:int = 0; i < 52; i++ )
			{
				temp[i] = cards[i];
			}			
			while ( temp.length > 0 )
			{
				index = Math.floor( Math.random() * temp.length );
				sDeck.push( temp[index] );
				temp.splice( index, 1 );
			}
		}
		
	}
	
}