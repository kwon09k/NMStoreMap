package nmmap.vo
{
	public class StoreLocationVO implements ILatLng
	{
		private static var _numberOfStores:int=0;
		private var _addressOne:String;
		private var _addressTwo:String;
		private var _city:String;
		private var _state:String;
		private var _postalCode:String;
		private var _country:String;

		private var _longitude:Number;
		private var _latitude:Number;
		
		public var storeNumber:int=0;
		
		
		
/*		public function StoreLocationVO(latitude:Number=NaN, longitude:Number=NaN)
		{
			storeNumber = _numberOfStores +1;
			_numberOfStores++;
			
			_latitude = latitude;
			_longitude = longitude;
		}*/
		public function StoreLocationVO(addressOne:String="", city:String="", state:String="", postalCode:String="")
		{
			storeNumber = _numberOfStores +1;
			_numberOfStores++;
			
			_addressOne = addressOne;
			_addressTwo = addressTwo;
			_city = city;
			_state = state;
			_postalCode = postalCode;
		}

		public function get addressOne():String
		{
			return _addressOne;
		}

		public function set addressOne(value:String):void
		{
			_addressOne = value;
		}

		public function get addressTwo():String
		{
			return _addressTwo;
		}

		public function set addressTwo(value:String):void
		{
			_addressTwo = value;
		}

		public function get city():String
		{
			return _city;
		}

		public function set city(value:String):void
		{
			_city = value;
		}

		public function get state():String
		{
			return _state;
		}

		public function set state(value:String):void
		{
			_state = value;
		}

		public function get postalCode():String
		{
			return _postalCode;
		}

		public function set postalCode(value:String):void
		{
			_postalCode = value;
		}

		public function get country():String
		{
			return _country;
		}

		public function set country(value:String):void
		{
			_country = value;
		}

		public function get longitude():Number
		{
			return _longitude;
		}

		public function set longitude(value:Number):void
		{
			_longitude = value;
		}

		public function get latitude():Number
		{
			return _latitude;
		}

		public function set latitude(value:Number):void
		{
			_latitude = value;
		}
		
	}
}