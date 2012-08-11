package nmmap.controller
{
	import com.mapquest.services.geocode.GeocoderLocation;
	
	import nmmap.events.StoreInformationServiceResponseEvent;
	import nmmap.model.StoreInformationModel;
	
	import org.robotlegs.mvcs.Command;
	
	public class StoreInformationServiceResponseCommand extends Command
	{
		[Inject]
		public var model:StoreInformationModel;
		[Inject]
		public var event:StoreInformationServiceResponseEvent;
		
		
		private var _locations:Array = [];
		private var _geocodeAddress:Array = [];
		
		public function StoreInformationServiceResponseCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			super.execute();
			_locations = event.payload;
			
			model.storeInformation = event.payload;//_geocodeAddress;
			
		}
		
/*		private function handleServiceData():void
		{
			var loc:GeocoderLocation;
			var length:int = _locations.length;
			for(var i:int = 0; i < length; i++)
			{
				loc = new GeocoderLocation();
				loc.street = _locations[i].street1;
				loc.city  = _locations[i].city;
				loc.postalCode = _locations[i].postalCode;
				loc.country = _locations[i].country;
				loc.state = _locations[i].state;
				_geocodeAddress[i] = loc;
				trace(_geocodeAddress[i]);*/
				/*
				_geocodeAddress[i] = _locations[i].street1 + " " +
									_locations[i].street2 + " " +
									_locations[i].city + " " +
									_locations[i].state + " " +
									_locations[i].postalCode + " " +
									_locations[i].country; 
				trace(_geocodeAddress[i]);	
			}
		}*/
	}
}