package nmmap.view
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	
	import mx.containers.Panel;
	import mx.containers.TitleWindow;
	import mx.core.IFlexDisplayObject;
	import mx.events.CloseEvent;
	
	public class WindowManager
	{
		// array of all windows in any container
		public static var windowList:Array = [];
		
		private static var instance:WindowManager;
		
		public function WindowManager():void
		{
		
		}
		
		public static function getInstance():WindowManager
		{
			if(instance == null)
			{
				WindowManager.instance = new WindowManager;
			}
			return WindowManager.instance;
		}
		
		public static function addWindow(window:IFlexDisplayObject, parent:DisplayObjectContainer):void
		{
			if(window is TitleWindow)
			{
				TitleWindow(window).showCloseButton = true;
				window.addEventListener(CloseEvent.CLOSE, WindowManager.closeWindow);
			}
			window.addEventListener(MouseEvent.MOUSE_DOWN, WindowManager.focusWindow);
			parent.addChild(DisplayObject(window));
			windowList.push(window);
		}
		
		// Brings the window to the top of displaylist of the parent
		public static function bringToFront(window:DisplayObject):void
		{
			var parent:DisplayObjectContainer = DisplayObjectContainer(window.parent);
			parent.setChildIndex( window, parent.numChildren - 1);
		}
		
		public static function createWindow(parent:DisplayObjectContainer, className:Class):IFlexDisplayObject
		{
			var window:IFlexDisplayObject = new className();
			WindowManager.addWindow(window, parent);
		
			return window;
		}
		
		public static function removeWindow(window:IFlexDisplayObject):void
		{
			var parent:DisplayObjectContainer = DisplayObjectContainer(window.parent);
			// Remove from display list
			parent.removeChild(DisplayObject(window));
			// Remove from window list
			windowList.splice(windowList.indexOf(window),1);
		}
		
		// Brings the window to the top of displaylist of the parent
		private static function focusWindow(event:MouseEvent):void
		{
			var window:DisplayObjectContainer = DisplayObjectContainer(event.currentTarget);
			WindowManager.bringToFront(window);
		}
		
		// Removes the window from the displaylist
		private static function closeWindow(event:CloseEvent):void
		{
			var window:IFlexDisplayObject = IFlexDisplayObject(event.currentTarget);
			WindowManager.removeWindow(window);
		}
	}
}