package nmmap.controller
{
	import com.mapquest.LatLng;
	
	import nmmap.events.GeocodeServiceResponseEvent;
	import nmmap.events.ModelUpdateEvent;
	import nmmap.model.PoiModel;
	import nmmap.vo.StoreLocationVO;
	
	import org.robotlegs.mvcs.Command;
	
	public class GeocodeResponseCommand extends Command
	{
		
		[Inject]
		public var model:PoiModel;
		[Inject]
		public var event:GeocodeServiceResponseEvent;
		
		public function GeocodeResponseCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			super.execute();
/*			var storeAddress:Array = [
				new StoreLocationVO("8687 North Central Expressway Suite 400", "Dallas", "TX", "75225"),
				new StoreLocationVO("1618 Main St.", "Plano", "TX", "75093"),
				new StoreLocationVO("2201 Dallas Pkwy", "Dallas", "TX", "75225"),
				new StoreLocationVO("1601 Preston Rd.", "Plano", "TX", "75093"),
				new StoreLocationVO("4115 S Capital of Texas Hwy", "Austin", "TX", "78704"),
				new StoreLocationVO("3400 Palm Way", "Austin", "TX", "78758")
			]*/
			
			model.storeLatLng = event.payload;
			trace('response command');
		}
	}
}