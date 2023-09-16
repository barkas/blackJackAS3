package BlackJack.Logic 
{
	
	import adobe.utils.CustomActions;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import BlackJack.Logic.Deck;
	import BlackJack.Logic.Player;
	import BlackJack.Logic.Hand;
	import flash.utils.*;
	import flash.events.TimerEvent;
	
	/**
	 * ...
	 * @author me
	 */
	public class Logic extends EventDispatcher
	{
		public static const PLAYER_TAKE: String = "playerTake";
		public static const DEALER_TAKE: String = "dealerTake";
		public static const LOSE: String = "lose";
		public static const DEALED: String = "dealed";
		public static const DEALER_PLAYED: String = "dealerPlayed";
		public static const WIN: String = "win";
		public static const REMOVE: String = "remove";
		public static const SHOW_BET: String = "showBet";
		public static const SHOW_CASH: String = "showCash";
		public static const DRAW: String = "draw";
		public static const PLAYED: String = "played";
		
		private var deck: Deck;
		public var player: Player = new Player();
		public var dealer: Player = new Player();
		private var playerHand : Hand;
		private var dealerHand : Hand;
		
		public var firstClick: Boolean = true;
		
		public var cardX: Number = 0;
		public var dealerCardX: Number = 0;
		
		public var bet: int = 0;
		
		private var timer:Timer = new Timer( 100 );
		
		public function Logic() 
		{
			player.cash = 1000;
		}
		
		public function dealClick( e: Event ):void
		{
			player.cash -= bet;
			dispatchEvent( new Event( Logic.SHOW_CASH ));
			trace("deal");
			if ( !firstClick )
			{
				dispatchEvent( new Event( Logic.REMOVE ));
			}
			firstClick = false;
			deck = new Deck();
			deck.shuffle();
			cardX = 40;
			dealerCardX = 40;
			
			playerHand = new Hand();
			dealerHand = new Hand();
			
			playerHand.takeCard(deck.sDeck.pop());
			player.hand = playerHand;
			dispatchEvent( new Event( Logic.PLAYER_TAKE ));
			
			dealerHand.takeCard(deck.sDeck.pop());
			dealer.hand = dealerHand;
			dispatchEvent( new Event( Logic.DEALER_TAKE ));
			
			playerHand.takeCard(deck.sDeck.pop());
			player.hand = playerHand;
			dispatchEvent( new Event( Logic.PLAYER_TAKE ));
			
			dispatchEvent( new Event( Logic.DEALED ));
						
			if (player.hand.sum == 21)
			{
				dealerPlays();
			}
		}
		
		public function takeClick(e:Event):void
		{
			player.hand.takeCard(deck.sDeck.pop());
			dispatchEvent( new Event( Logic.PLAYER_TAKE ));
			if (player.hand.sum > 21)
			{
				dispatchEvent( new Event( Logic.LOSE ));
				dispatchEvent( new Event( Logic.PLAYED ));
		    }
			if (player.hand.sum == 21)
			{
				dealerPlays();
			}
		}
		
		public function dealerPlays():void
		{
			while (dealer.hand.sum < 17)
			{
				dealer.hand.takeCard(deck.sDeck.pop());
				dispatchEvent( new Event( Logic.DEALER_TAKE ));
			}
			choseWinner(player.hand.sum, dealer.hand.sum);
		}
		
		
		private function choseWinner( playerScore:int, dealerScore:int ):void
		{
			if ( dealerScore > 21 )
			{
				dispatchEvent( new Event( Logic.WIN ));
				player.cash += bet * 2;
				dispatchEvent( new Event( Logic.SHOW_CASH ));
			}
			if (( playerScore > dealerScore ) && ( playerScore <= 21 ))
			{
				dispatchEvent( new Event( Logic.WIN ));
				player.cash += bet * 2;
				dispatchEvent( new Event( Logic.SHOW_CASH ));
			}
			if (( dealerScore > playerScore ) && ( dealerScore <= 21))
			{
				dispatchEvent( new Event( Logic.LOSE ));
			}
			if ( playerScore == dealerScore )
			{
				player.cash += bet;
				dispatchEvent( new Event( Logic.SHOW_CASH ));
				dispatchEvent( new Event( Logic.DRAW ));
			}
			dispatchEvent( new Event( Logic.PLAYED ));
		}
		
		public function posCard( ):Number
		{
			return cardX+=40;
		}
		
		public function posDealerCard( ): Number
		{
			return dealerCardX += 40;
		}
		
		public function bet1Click( e: Event ): void
		{
			bet += 1;
			dispatchEvent( new Event( Logic.SHOW_BET ));
			trace(bet);
		}
		
		public function bet5Click( e: Event ): void
		{
			bet += 5;
			dispatchEvent( new Event( Logic.SHOW_BET ));
			trace(bet);
		}
		
		public function bet25Click( e: Event ): void
		{
			bet += 25;
			dispatchEvent( new Event( Logic.SHOW_BET ));
			trace(bet);
		}
		
		public function bet50Click( e: Event ): void
		{
			bet += 50;
			dispatchEvent( new Event( Logic.SHOW_BET ));
			trace(bet);
		}
		
		public function bet100Click( e: Event ): void
		{
			bet += 100;
			dispatchEvent( new Event( Logic.SHOW_BET ));
			trace(bet);
		}
		
		public function resetBet( e:Event ):void
		{
			bet = 0;
			dispatchEvent( new Event( Logic.SHOW_BET ));
		}
	}

}