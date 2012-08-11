package nmmap.view
{
	import com.mapquest.LatLng;
	
	import nmmap.events.MapEvent;
	import nmmap.events.ModelUpdateEvent;
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
			addViewListener(MapEvent.POI_SELECTED, dispatch, MapEvent);
			addViewListener(MapEvent.PLOT_LATLNG, plotLatLngHandler);
			addViewListener(MapEvent.PLOT_GEOCODE, geocodeHandler);
			addViewListener(MapEvent.GET_SERVICE, getServiceHandler);
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
			dispatch(new MapEvent(RequestStoreInformationDataEvent.GET_STORE_LOCATIONS));
		}
		
	}
}


