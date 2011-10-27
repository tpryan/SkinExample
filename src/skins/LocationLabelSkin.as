package skins
{
	import components.LocationLabel;
	
	
	import spark.components.supportClasses.StyleableTextField;
	import spark.primitives.BitmapImage;
	import spark.skins.mobile.SkinnableContainerSkin;
	
	public class LocationLabelSkin extends SkinnableContainerSkin
	{
		
		[Embed(source="/assets/skins/locationbg.png")]
		private var bgClass160:Class;
		
		[Embed(source="/assets/skins/locationsmudge.png")]
		private var bgSmudgeClass160:Class;
		
		[Embed(source="/assets/skins/locationbg240.png")]
		private var bgClass240:Class;
		
		[Embed(source="/assets/skins/locationsmudge240.png")]
		private var bgSmudgeClass240:Class;
	
		[Embed(source="/assets/skins/locationbg320.png")]
		private var bgClass320:Class;

		[Embed(source="/assets/skins/locationsmudge320.png")]
		private var bgSmudgeClass320:Class;
		
		
		
		private var bgClass:Class;
		private var bgSmudgeClass:Class;
		
		protected var shadowLabel:StyleableTextField = new StyleableTextField();
		
		protected var bg:BitmapImage = new BitmapImage();
		protected var bgSmudge:BitmapImage = new BitmapImage();
		protected var host:LocationLabel;
		
		public function LocationLabelSkin()
		{
			super();
			
			if (applicationDPI == 160){
				bgClass = bgClass160;
				bgSmudgeClass = bgSmudgeClass160;
			}
			else if (applicationDPI == 240){
				bgClass = bgClass240;
				bgSmudgeClass = bgSmudgeClass240;
			}
			else if (applicationDPI == 320){
				bgClass = bgClass320;
				bgSmudgeClass = bgSmudgeClass320;
			}
			
		}
		
		override protected function childrenCreated():void{
			super.childrenCreated();
			host = hostComponent as LocationLabel;
		
			bg.source = bgClass;
			bgSmudge.source = bgSmudgeClass;
			
			switch (applicationDPI)
			{
				case 320:
				{
					setElementSize(bg, 640, 333);
					setElementSize(bgSmudge, 191, 226);
					setElementPosition(bg, 0, 0);
					setElementPosition(bgSmudge,bg.width-bgSmudge.width,90);
					host.textDisplay.y = 100;
					break;
				}
				case 240:
				{
					setElementSize(bg, 480, 250);
					setElementSize(bgSmudge, 143, 169);
					setElementPosition(bg, 0, 0);
					setElementPosition(bgSmudge,bg.width-bgSmudge.width,60);
					host.textDisplay.y = 75;
					break;
				}
				default:
				{
					setElementSize(bg, 320, 167);
					setElementSize(bgSmudge, 96, 114);
					setElementPosition(bg, 0, 0);
					setElementPosition(bgSmudge,bg.width-bgSmudge.width,45);
					host.textDisplay.y = 50;
					break;
				}
			}
			
			host.addElementAt(bg,0);
			host.addElementAt(bgSmudge,0);
			
			host.height = bg.height;
			
			host.textDisplay.rotation = -12.5;
			host.textDisplay.antiAliasType = "normal";
			host.textDisplay.y = 75;
			
			var shadowText:StyleableTextField = new StyleableTextField();
			shadowText.text = host.textDisplay.text;
			shadowText.x = host.textDisplay.x + 2;
			shadowText.y = host.textDisplay.y + 2;
			shadowText.setStyle("fontSize", host.textDisplay.getStyle("fontSize"));
			shadowText.setStyle("color", 0x000000);
			shadowText.rotation = host.textDisplay.rotation;
			
			host.addElementAt(shadowText,host.getElementIndex(host.textDisplay));
			
			
		}
		
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
		{
		}
		
		
		
		
	}
}