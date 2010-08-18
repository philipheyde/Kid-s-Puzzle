package com.heydeweb.puzzle.events {
	import flash.events.Event;

	/**
	 * @author phihey
	 */
	public class ControlEvent extends Event {
		public static const FILE_BUTTON_CLICKED : String = "com.heydeweb.puzzle.events.FILE_BUTTON_CLICKED";
		
		public function ControlEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event {
			return new ControlEvent(type, bubbles, cancelable);
		}
	}
}
