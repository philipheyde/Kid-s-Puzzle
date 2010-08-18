package com.heydeweb.puzzle.model {
	import org.robotlegs.mvcs.Actor;

	import flash.geom.Rectangle;

	/**
	 * @author phihey
	 */
	public class DimensionsModel extends Actor {
		private static const APP_SIZE : Rectangle = new Rectangle(0,0,800,600);
		private static const IMAGE_MAX_DIMENSIONS : Rectangle = new Rectangle(0,0,650,450);
		private static const PIECES_CLOUD_HEIGHT : int = 150;
		private static const CONTROL_BAR_WIDTH : int = 150;
		private static const BORDER_THICKNESS : int = 5;

		public function get piecesCloudHeight() : int {
			return PIECES_CLOUD_HEIGHT;
		}

		public function get controlBarWidth() : int {
			return CONTROL_BAR_WIDTH;
		}

		public function get appSize() : Rectangle {
			return APP_SIZE;
		}
		
		public function get imageMaxDimensions() : Rectangle {
			return IMAGE_MAX_DIMENSIONS;
		}
		
		public function get borderThickness() : int {
			return BORDER_THICKNESS;
		}
	}
}
