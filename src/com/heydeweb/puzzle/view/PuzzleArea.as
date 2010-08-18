package com.heydeweb.puzzle.view {
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	/**
	 * @author phihey
	 */
	public class PuzzleArea extends Sprite {
		private var _maxDimensions : Rectangle;
		
		public function PuzzleArea() {
		}
		
		public function setMaxImageSize(sizeObj : Rectangle):void {
			_maxDimensions = sizeObj;
		}
		
		public function updateImage(image : Bitmap):void {
			image.x = (_maxDimensions.width * .5) - (image.width * .5);
			image.y = (_maxDimensions.height * .5) - (image.height * .5);
			
			addChildAt(image, 0);
		}
	}
}
