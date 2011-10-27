package skins
{
	import spark.components.Group;
	import spark.primitives.BitmapImage;
	import spark.skins.mobile.ViewNavigatorSkin;
	
	public class ViewSkin extends ViewNavigatorSkin
	{
		
		[Embed(source="/assets/skins/detailbg.jpg")]
		private var bgClass160:Class;
		
		[Embed(source="/assets/skins/detailbg240.jpg")]
		private var bgClass240:Class;
		
		[Embed(source="/assets/skins/detailbg320.jpg")]
		private var bgClass320:Class;
		
		private var bgClass:Class;
		
		private var bg:BitmapImage = new BitmapImage();
		private var holder:Group = new Group;
		
		
		public function ViewSkin()
		{
			
			addChild(holder);
			
			switch (applicationDPI)
			{
				case 320:
				{
					bg.source = bgClass320;
					bg.width = 640;
					bg.height = 1608;
					break;
				}
				case 240:
				{
					bg.source = bgClass240;
					bg.width = 480;
					bg.height = 1206;
					break;
				}
				default:
				{
					bg.source = bgClass160;
					bg.width = 320;
					bg.height = 804;
					break;
				}
			}
			
			holder.addElement(bg);
			
		}
		
		override protected function childrenCreated():void{
			super.childrenCreated();
			this.actionBar.height = 0;
		}
		
	}
}