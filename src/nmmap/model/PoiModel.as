package nmmap.model
{
	import com.mapquest.LatLng;
	import com.mapquest.tilemap.pois.PoiEvent;
	
	import nmmap.events.ModelUpdateEvent;
	import nmmap.vo.StoreLocationVO;
	
	import org.robotlegs.mvcs.Actor;
	
	public class PoiModel extends Actor
	{
		private var _storeLatLng:Array = [];
		
		private var _storeAddress:Array = [];
		
		
		public function PoiModel()
		{
			super();
		}
		
		
		public function get storeLatLng():Array
		{
			return _storeLatLng;
		}
		public function get storeAddress():Array
		{
			return _storeAddress;
		}
		
		public function set storeLatLng(latLng:Array):void
		{
			//_storeLatLng is an Array of StoreLocationVOs
			_storeLatLng = latLng;
			
			dispatch(new ModelUpdateEvent(ModelUpdateEvent.UPDATE_LATITUDE_AND_LONGITUDE, latLng));
		}
		

		
	}
}