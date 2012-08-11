package nmmap.view
{
	import flash.events.MouseEvent;
	
	import mx.containers.TitleWindow;

	MouseEvent
	public class DragWindow extends TitleWindow
	{
		public function DragWindow()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			this.titleBar.addEventListener( MouseEvent.MOUSE_DOWN, startDragging );
		}
	}
}