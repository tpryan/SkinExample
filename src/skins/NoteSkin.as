package skins
{
	import flash.events.Event;
	
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	import spark.components.TextArea;
	import spark.effects.Fade;
	import spark.primitives.BitmapImage;
	import spark.skins.mobile.TextAreaSkin;
	
	public class NoteSkin extends TextAreaSkin
	{
		
		
		[Embed(source="/assets/skins/noteTop.png")]
		private var top160:Class;
		
		[Embed(source="/assets/skins/noteTop240.png")]
		private var top240:Class;
		
		[Embed(source="/assets/skins/noteTop320.png")]
		private var top320:Class;
		
		[Embed(source="/assets/skins/noteBottom.png")]
		private var bottom160:Class;
		
		[Embed(source="/assets/skins/noteBottom240.png")]
		private var bottom240:Class;
		
		[Embed(source="/assets/skins/noteBottom320.png")]
		private var bottom320:Class;
		
		
		private var bottomImage:BitmapImage = new BitmapImage(); 
		private var topImage:BitmapImage = new BitmapImage(); 
		private var holder:Group = new Group();
		private var host:TextArea ;
		private var fadeIn:Fade = new Fade();
		
		public function NoteSkin()
		{
			super();
			addChild(holder);
			
		}
		
		override protected function childrenCreated():void{
			border.visible = false;	
			
			this.y = this.y + 10;
			this.alpha = 0;
			
			host = hostComponent as TextArea;
			host.setStyle("focusThickness", 0);
			
			
			switch (applicationDPI)
			{
				
				case 320:
				{
					bottomImage.source = bottom320;
					topImage.source = top320;
					setElementSize(topImage, this.width, 146);
					setElementSize(bottomImage, this.width, 149);
					break;
				}
				case 240:
				{
					bottomImage.source = bottom240;
					topImage.source = top240;
					setElementSize(topImage, this.width, 110);
					setElementSize(bottomImage, this.width, 112);
					
					break;
				}
				default:
				{
					bottomImage.source = bottom160;
					topImage.source = top160;
					setElementSize(topImage, this.width, 73);
					setElementSize(bottomImage, this.width, 75);
					break;
				}
			}
			
			setElementPosition(topImage, 0, -10);
			setElementPosition(bottomImage, 0, textDisplay.y + textDisplay.height);
			
			topImage.blendMode = "multiply";
			bottomImage.blendMode = "multiply";
			
			
			holder.addElement(bottomImage);
			holder.addElement(topImage);
			
			fadeIn.alphaFrom = 0;
			fadeIn.alphaTo = 1;
			fadeIn.duration = 1200;
			fadeIn.target = this;
			
			this.addEventListener(FlexEvent.CREATION_COMPLETE, playFadeIn);
			
		}
		
		
		protected function playFadeIn(event:FlexEvent):void
		{
			fadeIn.play();
		}	
		
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void{
			
		}
		
		override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void{
			super.layoutContents(unscaledWidth, unscaledHeight);
			setElementPosition(textDisplay, 50, textDisplay.y + 20);
			setElementPosition(bottomImage, 0, textDisplay.y + textDisplay.height);
			host.y = host.y + 20;
		}
		
		
	}
}