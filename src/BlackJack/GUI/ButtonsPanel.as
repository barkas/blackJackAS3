package BlackJack.GUI 
{
	import BlackJack.Logic.Player;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.*;
	import com.greensock.*;
    import com.greensock.easing.*;
	
	/**
	 * ...
	 * @author me
	 */
	public class ButtonsPanel extends Sprite 
	{
		public var startPicture: MovieClip;
		public var background : MovieClip;
		
		public var playButton: SimpleButton;
		
		public var dealButton: MovieClip;
		public var stayButton: MovieClip;
		public var takeButton: MovieClip;
		public var clearButton: MovieClip;
		private var buttonY: Number = 300;
		
		private var win: MovieClip;
		private var lose: MovieClip;
		private var draw: MovieClip;
		
		private var cardBack: MovieClip;
		
		public var deckBack: MovieClip;
		public var animatedBack: MovieClip;
		
		private var deckX: Number = 300;
		private var deckY: Number = 100;
		
		protected var captionsY : Number = 130;
		
		public var childs: Array = new Array();
		
		public function ButtonsPanel() 
		{
			
		}
		
		private function createInstance( linkage:String ):MovieClip
		{
			var temp: Class = getDefinitionByName(linkage) as Class;
			return new temp();
		}
		
		public function init():void
		{
			startPicture = createInstance("start");
			stage.addChildAt(startPicture,0);
			
			background = createInstance("background");
			stage.addChildAt(background, 1);
			background.visible = false;
			
			var tmp: Class = getDefinitionByName( "Play" ) as Class;
			playButton = new tmp() as SimpleButton;
			playButton.x = 300;
			playButton.y = 400;
			addChild(playButton);
			
			dealButton = createInstance("dealBtn");
		   	addChild(dealButton);
			
			stayButton = createInstance("stayBtn");
			addChild(stayButton);
			
			takeButton = createInstance("takeBtn");
			addChild(takeButton);
			
			clearButton = createInstance("clearBetBtn");
			addChild(clearButton);
			
			dealButton.x = 20;
			dealButton.y = buttonY;
			
			takeButton.x = 140;
			takeButton.y = buttonY;
			
			stayButton.x = 260;
			stayButton.y = buttonY;
			
			clearButton.x = 140;
			clearButton.y = buttonY + 40;
			
			var Back:Class = getDefinitionByName("back") as Class;
			cardBack = new Back() as MovieClip;
			cardBack.x = 120;
			
			deckBack = new Back() as MovieClip;
			deckBack.x = deckX;
			deckBack.y = deckY;
			deckBack.visible = false;
			addChild( deckBack );
			
			win = createInstance("win");
			addChild(win);
			win.visible = false;
			win.y = captionsY;
			
			lose = createInstance("lose");
			addChild(lose);
			lose.visible = false;
			lose.y = captionsY;
			
			draw = createInstance("draw");
			addChild(draw);
			draw.visible = false;
			draw.y = captionsY;
		}
		
		public function startGame( e: Event ):void
		{
			startPicture.visible = false;
			playButton.visible = false;
			deckBack.visible = true;
			background.visible = true;
		}
		
		public function hideButtons():void
		{
			dealButton.visible = false;
			takeButton.visible = false;
			stayButton.visible = false;
			clearButton.visible = false;
		}
		
		public function showButtons( e: Event ):void
		{
			dealButton.visible = false;
			takeButton.visible = true;
			stayButton.visible = true;
			clearButton.visible = false;
			
			lose.visible = false;
			win.visible = false;
			draw.visible = false;
			
			addChild(cardBack);
			cardBack.visible = true;
			
		}
		
		public function showCard( name:String , x:Number , y: Number):void
		{
			var Back:Class = getDefinitionByName("back") as Class;
			animatedBack = new Back() as MovieClip;
			animatedBack.x = deckX;
			animatedBack.y = deckY;
			addChild( animatedBack )
			childs.push( animatedBack );
			TweenLite.to(animatedBack, 0.5, { x:x, y:y, ease:Quart.easeOut, overwrite:2, onComplete: rotate(name, x, y) } );
			animatedBack.x = deckX;
			animatedBack.y = deckY;
			animatedBack.alpha = 1;
			animatedBack.visible = true;
		}

		public function rotate( name:String , x:Number , y: Number ):void
		{
			var clip: Class = getDefinitionByName(name) as Class;
			var card: MovieClip = new clip() as MovieClip;
			childs.push(card);
			this.addChild(card);
			card.alpha = 0;
			card.scaleX = -1;
			card.x = x;
			card.y = y;
			TweenLite.to(animatedBack,0.4,{scaleX:+1, overwrite:false});
            TweenLite.to(animatedBack,0,{alpha:0,delay:.15, overwrite:false});
            TweenLite.to(card,0.4,{scaleX:+1, overwrite:false, onComplete:ReHidden});
            TweenLite.to(card,0,{alpha:1,delay:.15, overwrite:false});
		}
		
		private function ReHidden():void
		{
			animatedBack.visible = false;
		}
		
		public function playerLose( e: Event ):void
		{
			lose.visible = true;
			win.visible = false;
			
			takeButton.visible = false;
			stayButton.visible = false;	
			dealButton.visible = true;
			clearButton.visible = true;
		}
		
		public function playerWin( e:Event ): void
		{
			win.visible = true;
			lose.visible = false;
			
			takeButton.visible = false;
			stayButton.visible = false;
			dealButton.visible = true;
			clearButton.visible = true;
		}
		
		public function hideDeal():void
		{
			dealButton.visible = false;
			clearButton.visible = false;
		}
		
		public function drawn( e:Event ): void
		{
			draw.visible = true;
			
			takeButton.visible = false;
			stayButton.visible = false;
		    dealButton.visible = true;
			clearButton.visible = true;
		}
		
		public function betMaked( ):void
		{
			dealButton.visible = true;
			clearButton.visible = true;
		}
	}

}