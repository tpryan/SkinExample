package skins
{
	import spark.components.Button;
	import spark.skins.mobile.ButtonSkin;
	
	public class FilterButtonSkin extends ButtonSkin
	{
		
		[Embed(source="/assets/skins/filterbuttonUp.png")]
		private var borderClassUp160:Class;
		
		[Embed(source="/assets/skins/filterbuttonUp240.png")]
		private var borderClassUp240:Class;
		
		[Embed(source="/assets/skins/filterbuttonUp320.png")]
		private var borderClassUp320:Class;
		
		[Embed(source="/assets/skins/filterbuttonDown.png")]
		private var borderClassDown160:Class;
		
		[Embed(source="/assets/skins/filterbuttonDown240.png")]
		private var borderClassDown240:Class;
		
		[Embed(source="/assets/skins/filterbuttonDown320.png")]
		private var borderClassDown320:Class;
		
		
		public function FilterButtonSkin()
		{
			super();
			
			switch (applicationDPI)
			{
				
				case 320:
				{
					width= 243;
					height = 103;	
					upBorderSkin = borderClassUp320;
					downBorderSkin = borderClassDown320;
					break;
				}
				case 240:
				{
					width= 182;
					height = 77;	
					upBorderSkin = borderClassUp240;
					downBorderSkin = borderClassDown240;
					break;
				}
				default:
				{
					width= 122;
					height = 52;
					upBorderSkin = borderClassUp160;
					downBorderSkin = borderClassDown160;
					break;
				}
			}
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void{
			
		}
		
		override protected function childrenCreated():void
		{
			super.childrenCreated();
			
			var host:Button = hostComponent as Button;	
			
			switch (applicationDPI)
			{
				case 320:
				{	
					host.y = 200;
					break;
				}
				case 240:
				{
					host.y = 150;
					break;
				}
				default:
				{
					host.y = 100;
					break;
				}
			}
			
		}
		
		override protected function getBorderClassForCurrentState():Class
		{
			if (currentState == "down"){
				labelDisplay.setStyle("color",0xFFFFFF);
				return downBorderSkin;
			}
			else{
				labelDisplay.setStyle("color",0x48250A);
				return upBorderSkin;
			}
			
			
		}
	}
}