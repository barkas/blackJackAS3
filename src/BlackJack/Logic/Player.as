package BlackJack.Logic 
{
	import BlackJack.Logic.Hand;
	/**
	 * ...
	 * @author me
	 */
	public class Player 
	{
		public var cash:int;
		public var hand:Hand = new Hand();
		
		public function Player() 
		{
			
		}
		
		public function getLastCard( ): String
		{
			return hand.cards[hand.cards.length - 1].name;
		}
		
	}

}