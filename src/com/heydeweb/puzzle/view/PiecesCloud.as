package com.heydeweb.puzzle.view {
	import flash.display.Sprite;

	/**
	 * @author phihey
	 */
	public class PiecesCloud extends Sprite {
		public function PiecesCloud() {}

		public function build(width : int, height : int, borderThickness : int) : void {
			buildBorder(width, borderThickness);
		}

		private function buildBorder(width:int, borderThickness : int) : void {
			graphics.beginFill(0xffffff);
			graphics.drawRect(0, 0, width, borderThickness);
			graphics.endFill();
		}
	}
}
