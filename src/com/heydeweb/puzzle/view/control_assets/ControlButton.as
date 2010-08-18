package com.heydeweb.puzzle.view.control_assets {
	import flash.text.TextFieldAutoSize;
	import flash.text.TextField;
	import flash.geom.Rectangle;
	import flash.display.Sprite;

	/**
	 * @author phihey
	 */
	public class ControlButton extends Sprite {
		private static const DIMENSIONS : Rectangle = new Rectangle(0,0,80,20);
		
		public function ControlButton(label:String) {
			graphics.beginFill(0x00ffff);
			graphics.drawRect(0, 0, DIMENSIONS.width, DIMENSIONS.height);
			graphics.endFill();
			
			var tf:TextField = new TextField();
			tf.autoSize = TextFieldAutoSize.LEFT;
			tf.text = label;
			tf.x = (DIMENSIONS.width * .5) - (tf.textWidth * .5);
			tf.y = (DIMENSIONS.height * .5) - (tf.textHeight * .5);
			addChild(tf);
			
			mouseChildren = false;
			buttonMode = true;
		}
	}
}
