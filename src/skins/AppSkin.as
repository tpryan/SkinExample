package skins
{
	import spark.components.Group;
	import spark.primitives.BitmapImage;
	import spark.skins.mobile.ViewNavigatorApplicationSkin;
	
	public class AppSkin extends ViewNavigatorApplicationSkin
	{
		
		[Embed(source="/assets/skins/mainbg.jpg")]
		private var bgClass160:Class;
		
		[Embed(source="/assets/skins/mainbg240.jpg")]
		private var bgClass240:Class;
		
		[Embed(source="/assets/skins/mainbg320.jpg")]
		private var bgClass320:Class;
		
		private var bgClass:Class;
		
		private var bg:BitmapImage = new BitmapImage();
		private var holder:Group = new Group;
		
		
		public function AppSkin()
		{
			super();
			
			addChild(holder);
			
			
			switch (applicationDPI)
			{
				case 320:
				{
					bg.source = bgClass320;
					setElementSize(bg, 640, 1608);
					break;
				}
				case 240:
				{
					bg.source = bgClass240;
					setElementSize(bg, 480, 1206);
					break;
				}
				default:
				{
					bg.source = bgClass160;
					setElementSize(bg, 320, 804);
					break;
				}
			}
			
			holder.addElement(bg);
			
		}
		
		
	}
}