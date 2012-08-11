package nmmap.controller
{
	import nmmap.services.IStoreInformationService;
	
	import org.robotlegs.mvcs.Command;
	
	public class StoreInformationServiceCommand extends Command
	{
		[Inject]
		public var service:IStoreInformationService;

		
		public function StoreInformationServiceCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			super.execute();
			
			service.getStoreLocations();
		}
	}
}