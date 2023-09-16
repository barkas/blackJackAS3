package BlackJack.Logic 
{
	import BlackJack.Logic.Card;
	/**
	 * ...
	 * @author me
	 */
	public class Hand 
	{
		public var sum:int;
		public var cards:Array = new Array();
		
		public function Hand() 
		{
			sum = 0;
		}
		
		public function takeCard(c: Card):void
		{
			cards.push(c);
			sum = calculateScore();
		}
		
		public function calculateScore():int
		{
			var score: int = 0;
			var i: int;
			
		    for ( i = 0; i < cards.length; i++ )
			{
				if ( cards[i].rank != "Ace" )
				{
					score += this.cards[i].value; 
				}
			}
			
			for ( i = 0; i < cards.length; i++)
			{
				if ( (cards[i].rank == "Ace") && (score <= 10) )
					{
						score += 11;
					}
					else
						if (( cards[i].rank == "Ace" ) && ( score > 10) )
							score += 1;
			}
			return score;
		}
		
		public function resetCards():void 
		{
			sum = 0;
			this.cards.length = 0;
		}
	}

}