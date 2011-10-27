package components
{
	import spark.components.SkinnableContainer;
	import spark.components.supportClasses.StyleableTextField;
	
	public class LocationLabel extends SkinnableContainer
	{
		private var _text:String = "";
		[Bindable]
		public var textDisplay:StyleableTextField = new StyleableTextField();
		
		public function LocationLabel()
		{
			super();
			
			textDisplay.selectable = false;
			textDisplay.editable = false;
			textDisplay.text = this.text;
			addElement(textDisplay);
			
		}

		[Bindable]
		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
			textDisplay.text = this.text;
		}

	}
}