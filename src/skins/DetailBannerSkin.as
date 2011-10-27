package skins
{
	import components.DetailBanner;
	
	import spark.primitives.BitmapImage;
	import spark.skins.mobile.SkinnableContainerSkin;

	public class DetailBannerSkin extends SkinnableContainerSkin
	{
		
		[Bindable]
		[Embed(source="/assets/skins/detailBanner.png")]
		private var bgClass160:Class;
		
		[Bindable]
		[Embed(source="/assets/skins/detailBanner240.png")]
		private var bgClass240:Class;
		
		[Bindable]
		[Embed(source="/assets/skins/detailBanner320.png")]
		private var bgClass320:Class;
		
		private var bgClass:Class;
		private var bg:BitmapImage = new BitmapImage();
		protected var host:DetailBanner;
		
		public function DetailBannerSkin()
		{
			super();
			
			switch (applicationDPI)
			{
				case 320:
				{
					bgClass = bgClass320;
					setElementSize(bg, 467, 467);
					break;
				}
				case 240:
				{
					bgClass = bgClass240;
					setElementSize(bg, 350, 158);
					break;
				}
				default:
				{
					bgClass = bgClass160;
					setElementSize(bg, 234, 106);
					break;
				}
			}
			
			
		}
		
		override protected function childrenCreated():void{
			host = hostComponent as DetailBanner;
			bg.source = bgClass;
			host.addElementAt(bg,0);
			host.height = bg.height;
			this.width = host.width;
			bg.horizontalCenter = 0;
		}
		
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
		{
		}
		
		
		override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void{
			super.layoutContents(unscaledWidth, unscaledHeight);
			host.textDisplay.x = bg.width/2 ;
			host.textDisplay.y = bg.height/2;
		}
			
			
			
		
	}
}