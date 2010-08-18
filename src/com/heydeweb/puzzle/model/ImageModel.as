package com.heydeweb.puzzle.model {
	import org.robotlegs.mvcs.Actor;

	import flash.display.Bitmap;

	/**
	 * @author phihey
	 */
	public class ImageModel extends Actor {
		private var _image:Bitmap;
		
		public function ImageModel() {
		}

		public function get image() : Bitmap {
			return _image;
		}

		public function set image(image : Bitmap) : void {
			_image = image;
		}
	}
}
