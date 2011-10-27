package renderers
{
	import flash.events.MouseEvent;
	
	import spark.components.Group;
	import spark.components.IconItemRenderer;
	import spark.primitives.BitmapImage;
	
	public class ItemListRenderer extends IconItemRenderer
	{
		
		
		[Embed(source='/assets/skins/rule.png')]
		private static var rule1:Class;
		
		[Embed(source='/assets/skins/rule2.png')]
		private static var rule2:Class;
		
		[Embed(source='/assets/skins/rule3.png')]
		private static var rule3:Class;
		
		
		[Embed(source='/assets/skins/itemListDown.png')]
		private static var itemListDown160:Class;
		
		[Embed(source='/assets/skins/itemListDown240.png')]
		private static var itemListDown240:Class;
		
		[Embed(source='/assets/skins/itemListDown320.png')]
		private static var itemListDown320:Class;
		
		[Embed(source='/assets/skins/itemListUp.png')]
		private static var itemListUp160:Class;
		
		[Embed(source='/assets/skins/itemListUp240.png')]
		private static var itemListUp240:Class;
		
		[Embed(source='/assets/skins/itemListUp320.png')]
		private static var itemListUp320:Class;
		
		[Embed(source='/assets/skins/itemListHL.png')]
		private static var itemListHL160:Class;
		
		[Embed(source='/assets/skins/itemListHL240.png')]
		private static var itemListHL240:Class;
		
		[Embed(source='/assets/skins/itemListHL320.png')]
		private static var itemListHL320:Class;
		
		
		protected var decoratorClass:Class;
		protected var decoratorCoverClass:Class;
		protected var decoratorWidth:int;
		protected var decoratorHeight:int;
		
		protected var highlightClass:Class;
		protected var highlightWidth:int;
		protected var highlightHeight:int;
		
		protected var xOffset:int = 0;
		protected var rendererHeight:int = 0;
		
		protected var rule:BitmapImage = new BitmapImage();
		protected var holder:Group = new Group();
		protected var hl:BitmapImage = new BitmapImage();
		protected var decoratorCover:BitmapImage = new BitmapImage();
		
		public function ItemListRenderer()
		{
			super();
			
			switch (applicationDPI)
			{
				case 320:
				{
					decoratorClass = itemListUp320;
					decoratorCoverClass = itemListDown320;
					highlightClass = itemListHL320;
					xOffset = 40;
					rendererHeight = 180;
					decoratorHeight = 63;
					decoratorWidth = 61;
					highlightWidth = 243;
					highlightHeight = 75;
					break;
				}
				case 240:
				{
					decoratorClass = itemListUp240;
					decoratorCoverClass = itemListDown240;
					highlightClass = itemListHL240;
					xOffset = 60;
					rendererHeight = 135;
					decoratorHeight = 92;
					decoratorWidth = 94;
					highlightWidth = 493;
					highlightHeight = 113;
					break;
				}
				default:
				{
					decoratorClass = itemListUp160;
					decoratorCoverClass = itemListDown160;
					highlightClass = itemListHL160;
					xOffset = 80;
					rendererHeight = 90;
					decoratorHeight = 125;
					decoratorWidth = 123;
					highlightWidth = 585;
					highlightHeight = 150;
					break;
				}
			}
			
			addChild(holder);
			holder.addElement(rule);

			addChild(holder);
			
			setElementSize(hl, highlightWidth, highlightHeight);
			hl.source = highlightClass;
			hl.visible = false;
			holder.addElement(hl);
			
			decoratorCover.source = decoratorCoverClass;
			setElementSize(decoratorCover, decoratorWidth, decoratorHeight);
			decoratorCover.visible = false;
			holder.addElement(decoratorCover);
			
			this.addEventListener(MouseEvent.CLICK, toggleHighlight);
		}
		
		
		
		protected function toggleHighlight(event:MouseEvent):void
		{
			hl.visible = true;
			decoratorCover.visible = true;
			
		}
		
		override protected function layoutContents(unscaledWidth:Number,
												   unscaledHeight:Number):void{
			super.layoutContents(unscaledWidth, unscaledHeight);
			setElementPosition(labelDisplay, xOffset, labelDisplay.y);
			setElementPosition(messageDisplay, xOffset, messageDisplay.y);
			this.height = rendererHeight;
			
			var ruleNumber:Number = labelDisplay.text.length % 3;
			
			switch(ruleNumber)
			{
				case 1:
				{
					rule.source = rule2;
					break;
				}
				case 2:
				{
					rule.source = rule3;
					break;
				}
					
				default:
				{
					rule.source = rule1;
					break;
				}
			}
			
			holder.addElement(rule);
			decoratorDisplay.source = decoratorClass;
			setElementPosition(decoratorCover, decoratorDisplay.x, decoratorDisplay.y);
			
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void{
			
		}
		
		
		
	}
}