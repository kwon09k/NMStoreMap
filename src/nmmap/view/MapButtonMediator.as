package nmmap.view
{
	import flash.events.MouseEvent;
	
	import nmmap.events.MapEvent;
	import nmmap.events.RequestStoreInformationDataEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class MapButtonMediator extends Mediator
	{
		public function MapButtonMediator()
		{
			super();
		}
		override public function onRegister():void
		{
			super.onRegister();
			
			
			addViewListener(MapEvent.SHOW_RED_POI, showRedHandler);
			addViewListener(MapEvent.SHOW_YELLOW_POI, showYellowHandler);
			addViewListener(MapEvent.SHOW_GREEN_POI, showGreenHandler);
			addViewListener(MapEvent.SHOW_ALL_POI, showAllHandler);
		}
		protected function plotLatLngHandler(event:MapEvent):void
		{
			dispatch(new MapEvent(MapEvent.PLOT_LATLNG))
		}
		protected function geocodeHandler(event:MapEvent):void
		{	
			dispatch(new MapEvent(MapEvent.PLOT_GEOCODE))
		}
		protected function getServiceHandler(event:MapEvent):void
		{
			//dispatch(new MapEvent(RequestStoreInformationDataEvent.GET_STORE_LOCATIONS));
		}
		protected function testingHandler(event:MapEvent):void
		{
			dispatch(new MapEvent(MapEvent.TESTING));
		}
		
		protected function showRedHandler(event:MapEvent):void
		{
			dispatch(new MapEvent(MapEvent.SHOW_RED_POI));
		}
		protected function showYellowHandler(event:MapEvent):void
		{
			dispatch(new MapEvent(MapEvent.SHOW_YELLOW_POI));
		}
		protected function showGreenHandler(event:MapEvent):void
		{
			dispatch(new MapEvent(MapEvent.SHOW_GREEN_POI));
		}
		protected function showAllHandler(event:MapEvent):void
		{
			dispatch(new MapEvent(MapEvent.SHOW_ALL_POI));
		}
	}
}


