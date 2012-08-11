package nmmap
{
	import flash.display.DisplayObjectContainer;
	
	import nmmap.controller.GeocodeResponseCommand;
	import nmmap.controller.GetStoreLocationsCommand;
	import nmmap.controller.StoreInformationDataCommand;
	import nmmap.controller.StoreInformationServiceCommand;
	import nmmap.controller.StoreInformationServiceResponseCommand;
	import nmmap.events.GeocodeServiceResponseEvent;
	import nmmap.events.MapEvent;
	import nmmap.events.ModelUpdateEvent;
	import nmmap.events.RequestStoreInformationDataEvent;
	import nmmap.events.StoreInformationServiceResponseEvent;
	import nmmap.model.*;
	import nmmap.services.GeocodeService;
	import nmmap.services.IGeocodeService;
	import nmmap.services.IStoreInformationService;
	import nmmap.services.StoreInformationService;
	import nmmap.view.ContentWindow;
	import nmmap.view.ContentWindowMediator;
	import nmmap.view.MapButton;
	import nmmap.view.MapButtonMediator;
	import nmmap.view.MapView;
	import nmmap.view.MapViewMediator;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

	
	public class MapContext extends Context
	{
		public function MapContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			mediatorMap.mapView(MapView, MapViewMediator);
			mediatorMap.mapView(MapButton, MapButtonMediator);
			mediatorMap.mapView(ContentWindow, ContentWindowMediator);
			
			injector.mapSingleton(PoiModel);
			injector.mapSingleton(StoreInformationModel);
			
			commandMap.mapEvent(GeocodeServiceResponseEvent.GEOCODE_SERVICE_SUCCESS, GeocodeResponseCommand);

			//commandMap.mapEvent(MapEvent.GET_SERVICE, StoreInformationServiceCommand);
			
			commandMap.mapEvent(RequestStoreInformationDataEvent.GET_STORE_LOCATIONS, GetStoreLocationsCommand);
			commandMap.mapEvent(StoreInformationServiceResponseEvent.STORE_INFORMATION_SERVICE_SUCCESS, StoreInformationServiceResponseCommand);
			commandMap.mapEvent(ModelUpdateEvent.UPDATE_STORE_INFORMATION_MODEL, StoreInformationDataCommand)
			
			
			injector.mapSingletonOf(IGeocodeService, GeocodeService);
			injector.mapSingletonOf(IStoreInformationService, StoreInformationService);
		}
	}
}