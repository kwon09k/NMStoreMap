package nmmap.model
{
	
	import nmmap.events.ModelUpdateEvent;
	import nmmap.vo.StoreVO;
	
	import org.robotlegs.mvcs.Actor;
	
	public class StoreInformationModel extends Actor
	{
		
		private var _storeInformation:Array = [];
		
		public function StoreInformationModel()
		{
			super();
		}
		
		public function get storeInformation():Array
		{
			return _storeInformation;
		}
		
		public function set storeInformation(storeInfo:Array):void
		{
			var storeVO:StoreVO;
			for(var i:int = 0; i < storeInfo.length; i++)
			{
				storeVO = new StoreVO();
				storeVO.abbrevCombine = storeInfo[i].abbrevCombine;
				storeVO.businessUnitCode = storeInfo[i].businessUnitCode;
				storeVO.city = storeInfo[i].city;
				storeVO.country = storeInfo[i].country;
				storeVO.postalCode = storeInfo[i].postalCode;
				storeVO.state = storeInfo[i].state;
				storeVO.storeName = storeInfo[i].storeName;
				storeVO.storeNumber = storeInfo[i].storeNumber;
				storeVO.street1 = storeInfo[i].street1;
				storeVO.street2 = storeInfo[i].street2;
				storeVO.subBusinessUnitCode = storeInfo[i].subBusinessUnitCode;
				storeVO.subBusinessUnitDesc = storeInfo[i].subBusinessUnitDesc;
				
				_storeInformation.push(storeVO);
				
			trace("model updating......." + i);
			}
			dispatch(new ModelUpdateEvent(ModelUpdateEvent.UPDATE_STORE_INFORMATION_MODEL, storeInfo));
		}
		
	}
}