package nmmap.controller
{
	import nmmap.services.IStoreInformationService;
	
	import org.robotlegs.mvcs.Command;
	
	public class GetStoreLocationsCommand extends Command
	{
		[Inject]
		public var service:IStoreInformationService;
		
		
		public function GetStoreLocationsCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			super.execute();
			
			service.getStoreLocations();
			trace("ServiceCommand");
		}
	}
}