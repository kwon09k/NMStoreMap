package nmmap.vo
{
	[RemoteClass(alias="com.neimanmarcus.storeinformation.domain.StoreVO")]
	public class StoreVO implements IStoreInformation
	{
		private var _storeNumber:int;
		private var _businessUnitCode:String;
		private var _subBusinessUnitCode:String;
		private var _subBusinessUnitDesc:String;
		private var _storeName:String;
		private var _abbrevCombine:String;
		private var _street1:String;
		private var _street2:String;
		private var _city:String;
		private var _state:String;
		private var _country:String;
		private var _postalCode:int;
		
		
		public function StoreVO() 
		{
		}
		
		
		public function get postalCode():int
		{
			return _postalCode;
		}

		public function set postalCode(value:int):void
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

		public function get state():String
		{
			return _state;
		}

		public function set state(value:String):void
		{
			_state = value;
		}

		public function get city():String
		{
			return _city;
		}

		public function set city(value:String):void
		{
			_city = value;
		}

		public function get street2():String
		{
			return _street2;
		}

		public function set street2(value:String):void
		{
			_street2 = value;
		}

		public function get street1():String
		{
			return _street1;
		}

		public function set street1(value:String):void
		{
			_street1 = value;
		}

		public function get abbrevCombine():String
		{
			return _abbrevCombine;
		}

		public function set abbrevCombine(value:String):void
		{
			_abbrevCombine = value;
		}

		public function get storeName():String
		{
			return _storeName;
		}

		public function set storeName(value:String):void
		{
			_storeName = value;
		}

		public function get subBusinessUnitDesc():String
		{
			return _subBusinessUnitDesc;
		}

		public function set subBusinessUnitDesc(value:String):void
		{
			_subBusinessUnitDesc = value;
		}

		public function get subBusinessUnitCode():String
		{
			return _subBusinessUnitCode;
		}

		public function set subBusinessUnitCode(value:String):void
		{
			_subBusinessUnitCode = value;
		}

		public function get businessUnitCode():String
		{
			return _businessUnitCode;
		}

		public function set businessUnitCode(value:String):void
		{
			_businessUnitCode = value;
		}

		public function get storeNumber():int
		{
			return _storeNumber;
		}

		public function set storeNumber(value:int):void
		{
			_storeNumber = value;
		}

	}
}