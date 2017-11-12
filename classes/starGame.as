package 
{
	import flash.display.MovieClip;
	import flash.ui.Mouse;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	[SWF(backgroundColor="0x00000")]

	public class starGame extends MovieClip
	{
		
		
		Mouse.hide();
		private var count = 0;
		private var count2 = 0;
		private var Bunny:bunny;
		private var time:Timer;
		private var stars:Array;
		private var smallstars:Array;
		private var bstar:bStar;
		private var sstar:sStar;
		
		public function starGame()
		{
			stars = new Array();
			smallstars = new Array();
					
			Bunny = new bunny();
			addChild(Bunny);
			
			time = new Timer (35);
			time.addEventListener(TimerEvent.TIMER, movestar);
			time.start();
			
		}
		
		public function movestar(event:Event): void
		{
			
			
			if (count > 15){
			//add a new small every time count hits 15 	
			
			sstar = new sStar();
				
			//put stars in array
			smallstars.push(sstar);
				
			//adds stars to stage	
			addChild(sstar);
			count = 0
			}
			
			
			if (count2 > 25){
			bstar = new bStar();	
			stars.push(bstar);
			addChild(bstar);
			count2 = 0;	
			}
			//move the big stars onto the screen at a speed of 5px 
			for each (bstar in stars)
			{
				bstar.y += 20;
				if(Bunny.hitTestObject(bstar)){
					trace("hit star");
					bstar.alpha = 0;
				}
			}
			
			//move the small stars onto the screen at a speed of 10px 
			for each (sstar in smallstars)
			{
				sstar.y += 10;
				if(Bunny.hitTestObject(sstar)){
					trace("hit star");
					sstar.alpha = 0;
				}
			}
			
			//bunny cannot move up
			Bunny.y = 240;
			//
			var difference:int = (Bunny.x - mouseX);
			Bunny.x -= difference/25;
			//prevent bunny from going of the screen
			if (Bunny.x >= 600){
				Bunny.x = 600;
			}
			count +=1;
			count2 +=1;
			
		}
	}
	
}