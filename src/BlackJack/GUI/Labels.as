package BlackJack.GUI 
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author me
	 */
	public class Labels extends Sprite
	{
		private var cash: TextField = new TextField();
		private var bet: TextField = new TextField();
		private var playerScore: TextField = new TextField();
		private var dealerScore: TextField = new TextField();
		
		private var textFormat: TextFormat = new TextFormat("Times New Roman", 21, 0xFFFFFF);
		
		public function Labels() 
		{
			
		}
		
		public function init(): void
		{
			cash.text = "Cash :";
			cash.y = 330;
			cash.setTextFormat( textFormat );
			cash.mouseEnabled = false;
			addChild(cash);
			
			bet.text = "Bet :";
			bet.y = 350;
			bet.setTextFormat( textFormat );
			bet.mouseEnabled = false;
			addChild(bet);
			
			playerScore.x = 20;
			playerScore.y = 200;
			playerScore.mouseEnabled = false;
			addChild( playerScore );
			
			dealerScore.x = 20;
			dealerScore.y = 50;
			dealerScore.mouseEnabled = false;
			addChild( dealerScore );
		}
		
		public function changeCash( sum:int ) : void
		{
			cash.text = "Cash :" + sum.toString();
			cash.setTextFormat( textFormat );
		}
		
		public function changeBet( sum:int ) : void
		{
			bet.text = "Bet :" + sum.toString();
			bet.setTextFormat( textFormat );
		}
		
		public function changePlayerScore( score:int ):void
		{
			playerScore.text = score.toString();
			playerScore.setTextFormat( textFormat );
		}
		
		public function changeDealerScore( score:int ): void
		{
			dealerScore.text = score.toString();
			dealerScore.setTextFormat( textFormat );
		}
		
	}

}