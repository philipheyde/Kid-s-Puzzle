package com.heydeweb.puzzle.events {
	import flash.events.Event;

	/**
	 * @author phihey
	 */
	public class ImageEvent extends Event {
		public static const IMAGE_LOADED : String = "com.heydeweb.puzzle.events.ImageEvent.IMAGE_LOADED";
		public static const IMAGE_LOAD_CANCELED : String = "com.heydeweb.puzzle.events.ImageEvent.IMAGE_LOAD_CANCELED";
		
		public function ImageEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event {
			return new ImageEvent(type, bubbles, cancelable);
		}
	}
}
