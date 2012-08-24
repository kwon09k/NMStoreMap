package nmmap
{
	import flash.display.DisplayObjectContainer;
	
	import nmmap.controller.GeocodeResponseCommand;
	import nmmap.controller.GetStoreLocationsCommand;
	import nmmap.controller.StoreInformationServiceResponseCommand;
	import nmmap.controller.UpdatedStoreInformationCommand;
	import nmmap.events.GeocodeServiceResponseEvent;
	import nmmap.events.ModelUpdateEvent;
	import nmmap.events.RequestStoreInformationDataEvent;
	import nmmap.events.StoreInformationServiceResponseEvent;
	import nmmap.model.*;
	import nmmap.services.GeocodeService;
	import nmmap.services.IGeocodeService;
	import nmmap.services.IStoreInformationService;
	import nmmap.services.StoreInformationService;
	import nmmap.view.MainViewMediator;
	import nmmap.view.MapButton;
	import nmmap.view.MapButtonMediator;
	import nmmap.view.MapView;
	import nmmap.view.MapViewMediator;
	
	import org.robotlegs.mvcs.Context;

	
	public class MapContext extends Context
	{
		public function MapContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			injector.mapSingleton(PoiModel);
			injector.mapSingleton(StoreInformationModel);
			
			mediatorMap.mapView(NMMap, MainViewMediator);
			mediatorMap.mapView(MapView, MapViewMediator);
			mediatorMap.mapView(MapButton, MapButtonMediator);
			
			
			commandMap.mapEvent(GeocodeServiceResponseEvent.GEOCODE_SERVICE_SUCCESS, GeocodeResponseCommand);

			
			commandMap.mapEvent(RequestStoreInformationDataEvent.GET_STORE_LOCATIONS, GetStoreLocationsCommand);
			commandMap.mapEvent(StoreInformationServiceResponseEvent.STORE_INFORMATION_SERVICE_SUCCESS, StoreInformationServiceResponseCommand);
			commandMap.mapEvent(ModelUpdateEvent.STORE_INFORMATION_MODEL_UPDATED_STORE_INFORMATION, UpdatedStoreInformationCommand);
			
			
			injector.mapSingletonOf(IGeocodeService, GeocodeService);
			injector.mapSingletonOf(IStoreInformationService, StoreInformationService);
		}
	}
}