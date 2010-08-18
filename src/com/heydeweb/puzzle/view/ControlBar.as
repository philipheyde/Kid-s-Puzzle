package com.heydeweb.puzzle.view {
	import com.heydeweb.puzzle.events.ControlEvent;
	import flash.events.MouseEvent;
	import com.heydeweb.puzzle.view.control_assets.ControlButton;

	import flash.display.Sprite;

	/**
	 * @author phihey
	 */
	public class ControlBar extends Sprite {
		public function ControlBar() {}

		public function build(width : int, height : int, borderThickness : int) : void {
			buildBorder(height, borderThickness);
			buildFileSelectButton();
		}

		private function buildBorder(height:int, borderThickness : int) : void {
			graphics.beginFill(0xffffff);
			graphics.drawRect(0, 0, borderThickness, height);
			graphics.endFill();
		}

		private function buildFileSelectButton() : void {
			var fileBtn : ControlButton = new ControlButton("Choose image");

			fileBtn.addEventListener(MouseEvent.CLICK, onFileBtnClicked);
			addChild(fileBtn);
		}

		private function onFileBtnClicked(event : MouseEvent) : void {
			dispatchEvent(new ControlEvent(ControlEvent.FILE_BUTTON_CLICKED));
		}
	}
}
