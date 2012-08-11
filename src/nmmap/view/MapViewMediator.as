package nmmap.view
{
	import com.mapquest.tilemap.pois.Poi;
	import com.mapquest.tilemap.pois.PoiEvent;
	
	import nmmap.events.MapEvent;
	import nmmap.events.ModelUpdateEvent;
	import nmmap.model.PoiModel;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class MapViewMediator extends Mediator
	{
		[Inject]
		public var view:MapView;
		
		[Inject]
		public var model:PoiModel;
		
		
		public function MapViewMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			addViewListener(MapEvent.POI_SELECTED, dispatch, MapEvent);
			addContextListener(ModelUpdateEvent.UPDATE_LATITUDE_AND_LONGITUDE, _updatePoi)
			//addContextListener(ModelUpdateEvent.UPDATE_STORE_INFORMATION_MODEL, _handleStoreInformation)
			
			addContextListener(MapEvent.SET_BUSY_CURSOR, _setBusyCursor);
			addContextListener(MapEvent.REMOVE_BUSY_CURSOR, _removeBusyCursor);
/*			addContextListener(PoiUpdateEvent.ADDRESS, addressChange)*/
			
			//eventMap.mapListener(view, MapEvent.POI_SELECT, dispatch);
			
		}
		
		private function _updatePoi(event:ModelUpdateEvent):void
		{
			//this is old one
			//view.addLatLng(event.value);
			
			view.addPoi(event.updatedValue);
			
			
		}
		
		private function _setBusyCursor(event:MapEvent):void
		{
			view.setBusyCursor()
		}
		private function _removeBusyCursor(event:MapEvent):void
		{
			view.removeBusyCursor()
		}
		private function _handleStoreInformation(event:ModelUpdateEvent):void
		{
			view.addPoi(event.updatedValue);
			trace("Store Information Update is completed.\n\n" + "The result is:\n" + event.updatedValue);
		}
/*		private function addressChange(event:PoiUpdateEvent):void
		{
			view.addressToLatLng(event.value);
		}*/
		
	}
}