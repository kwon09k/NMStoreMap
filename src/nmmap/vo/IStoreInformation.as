package nmmap.vo
{
	public interface IStoreInformation
	{
		
		function get postalCode():int;
		function get country():String;
		function get state():String;
		function get city():String;
		function get street2():String;
		function get street1():String;
		function get abbrevCombine():String;
		function get storeName():String;
		function get subBusinessUnitDesc():String;
		function get subBusinessUnitCode():String;
		function get businessUnitCode():String;
		function get storeNumber():int;

	}
}