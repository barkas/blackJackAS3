package BlackJack.Game 
{
	import BlackJack.GUI.BetPanel;
	import BlackJack.GUI.ButtonsPanel;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Loader;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.system.ApplicationDomain;
	import flash.display.MovieClip;
	import BlackJack.GUI.Labels;
	import flash.utils.*;
	import BlackJack.Logic.Logic;

	/**
	 * ...
	 * @author me
	 */
	public class Game extends Sprite 
	{
       	public var loader: Loader = new Loader();
		private var betPanel: BetPanel;
		private var buttonPanel: ButtonsPanel;
		private var logic: Logic;
		private var labels: Labels;
		
		public function Game():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			loadCards();
		}
		
		private function stayClick( e: Event ):void
		{
			trace( "stop" );
			buttonPanel.hideButtons();
			logic.dealerPlays();
		}
			
		private function init( e:Event = null ):void 
		{
			removeEventListener( Event.ADDED_TO_STAGE, init );
			// entry point
		}
		
		private function loadCards():void
		{
			var path:URLRequest = new URLRequest( "assets.swf" );
			var context: LoaderContext = new LoaderContext( false, ApplicationDomain.currentDomain );
			loader.contentLoaderInfo.addEventListener( Event.COMPLETE, onLoad );	
			loader.load( path, context );
		}
		
		private function onLoad( e:Event ):void
		{
			loader.removeEventListener( Event.COMPLETE, onLoad );
			
			labels = new Labels();
			labels.init();
			labels.changeCash(1000);
			addChild( labels );
			labels.visible = false;
			
			logic = new Logic();
			
			//Loading buttons
			buttonPanel = new ButtonsPanel();
			addChild( buttonPanel ) ;
			buttonPanel.init();
			
			buttonPanel.dealButton.addEventListener( MouseEvent.CLICK, logic.dealClick );
			buttonPanel.takeButton.addEventListener( MouseEvent.CLICK, logic.takeClick );
			buttonPanel.clearButton.addEventListener( MouseEvent.CLICK, logic.resetBet );
			buttonPanel.clearButton.addEventListener( MouseEvent.CLICK, clearClick);
			buttonPanel.stayButton.addEventListener( MouseEvent.CLICK, stayClick );
			buttonPanel.playButton.addEventListener( MouseEvent.CLICK, buttonPanel.startGame);
			buttonPanel.playButton.addEventListener( MouseEvent.CLICK, showAll );
			
			//Loading bets
			betPanel = new BetPanel();
			addChild( betPanel );
			betPanel.init();
			betPanel.visible = false;
			
			betPanel.bet1.addEventListener( MouseEvent.CLICK, logic.bet1Click );
			betPanel.bet5.addEventListener( MouseEvent.CLICK, logic.bet5Click );
			betPanel.bet25.addEventListener( MouseEvent.CLICK, logic.bet25Click );
			betPanel.bet50.addEventListener( MouseEvent.CLICK, logic.bet50Click );
			betPanel.bet100.addEventListener( MouseEvent.CLICK, logic.bet100Click );
			betPanel.addEventListener( MouseEvent.CLICK, afterBet );
			betPanel.addEventListener( MouseEvent.MOUSE_MOVE, betPanel.dragCursor );
			
			logic.addEventListener( Logic.PLAYER_TAKE, playerTake );
			logic.addEventListener( Logic.DEALER_TAKE, dealerTake );
			logic.addEventListener( Logic.DEALED, buttonPanel.showButtons );
			logic.addEventListener( Logic.DEALED, disableBet );
			logic.addEventListener( Logic.LOSE, buttonPanel.playerLose );
			logic.addEventListener( Logic.WIN, buttonPanel.playerWin );
			logic.addEventListener( Logic.DRAW, buttonPanel.drawn );
			logic.addEventListener( Logic.REMOVE, remove );
			logic.addEventListener( Logic.SHOW_BET, showBet );
			logic.addEventListener( Logic.SHOW_CASH, showCash );
			logic.addEventListener( Logic.PLAYED, enableBet );
		
			buttonPanel.hideButtons();
		}
		
		public function remove( e: Event ):void
		{
			for ( var i:int = 0; i < buttonPanel.childs.length; i++ )
			{
				buttonPanel.removeChild( buttonPanel.childs[i] );
			}
			buttonPanel.childs.length = 0;
		}
		
		public function playerTake( e: Event ):void 
		{
			buttonPanel.showCard( logic.player.getLastCard() , logic.posCard( ), 200 );
			labels.changePlayerScore( logic.player.hand.sum );
		}
		
		public function dealerTake( e: Event ): void
		{
			buttonPanel.showCard( logic.dealer.getLastCard() , logic.posDealerCard( ), 0);
			labels.changeDealerScore( logic.dealer.hand.sum );
		}
		
		public function showCash( e: Event ):void
		{
			labels.changeCash( logic.player.cash );
		}
		
		public function showBet( e: Event ):void
		{
			labels.changeBet( logic.bet );
		}
		
		public function afterBet( e: Event ) :void
		{
			buttonPanel.betMaked();
		}
		
		public function clearClick( e: Event ):void
		{
			buttonPanel.hideDeal();
		}
		
		public function disableBet( e: Event ):void
		{
			betPanel.mouseEnabled = false;
			betPanel.disableBet();
		}
		
		public function enableBet( e: Event):void
		{
			betPanel.mouseEnabled = true;
			betPanel.enableBet();
		}
		
		public function showAll( e:Event ):void
		{
			betPanel.visible = true;
			labels.visible = true;
		}
	}
	
}