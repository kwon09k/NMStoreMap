package nmmap.events
{
	import flash.events.Event;
	
	public class MapEvent extends Event
	{
		
		public static const POI_SELECTED:String = "poiSelected";
		
		public static const PLOT_LATLNG:String = "plotLatLng";
		public static const PLOT_GEOCODE:String = "plotGeocode";
		
		public static const GET_SERVICE:String = "getService";
		
		public static const SET_BUSY_CURSOR:String = "setBusyCursor";
		public static const REMOVE_BUSY_CURSOR:String = "removeBusyCursor";
		
		public function MapEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new MapEvent(type);
		}
	}
}