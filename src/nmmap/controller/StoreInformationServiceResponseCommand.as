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
			
			model.storeInformation = event.payload;
			
		}
		
	}
}