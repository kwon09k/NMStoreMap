package nmmap.view
{
	import nmmap.model.StoreInformationModel;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ContentWindowMediator extends Mediator
	{
		[Inject]
		public var view:ContentWindow;
		
		[Inject]
		public var model:StoreInformationModel;
			
		public function ContentWindowMediator()
		{
			super();
		}
		
		
		override public function onRegister():void
		{
			
		}
		
		
	}
}