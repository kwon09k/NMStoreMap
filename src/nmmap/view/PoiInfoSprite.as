package nmmap.view
{
	import flash.display.Sprite;
	
	import spark.components.Button;
	
	public class PoiInfoSprite extends Sprite
	{
		
		// ------- Constructor -------
		public function PoiInfoSprite()
		{
			super();
			_init();
		}
		
		
		// ------- Public Children -------
		private var firstBtn:Button;
		private var secondBtn:Button;
		
		// ------- Public Functions -------
		
		// ------- Private Functions -------
		
		private function _init():void
		{
			//test //x
			this.graphics.drawRect(0,0,300,400);
			this.graphics.beginFill(0xf0f0f0);
			
			
			
			//creating components...
			firstBtn = new Button();
			secondBtn = new Button();
			
			
			//adding children to view
			addChild(firstBtn);
			addChild(secondBtn);
			
			
			firstBtn.label = "first";
			secondBtn.label	= "second";
			
			//setting positions.
			
			secondBtn.y = firstBtn.height + 10;
		}
	}
}