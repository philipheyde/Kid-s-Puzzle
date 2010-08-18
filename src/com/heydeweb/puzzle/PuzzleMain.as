package com.heydeweb.puzzle {
	import flash.display.Sprite;
	
	[SWF(width="800", height="600", frameRate="24", backgroundColor="#000000")]
	
	/**
	 * @author phihey
	 */
	public class PuzzleMain extends Sprite {
		private var context : PuzzleContext;

		public function PuzzleMain() {
			context = new PuzzleContext(this);
		}
	}
}
