package com.heydeweb.puzzle.view {
	import com.heydeweb.puzzle.model.DimensionsModel;
	import com.heydeweb.puzzle.events.ControlEvent;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author phihey
	 */
	public class ControlBarMediator extends Mediator {
		[Inject]
		public var view : ControlBar;
		
		[Inject]
		public var dimensions : DimensionsModel;

		public function ControlBarMediator() {
			// Avoid doing work in your constructors!
			// Mediators are only ready to be used when onRegister gets called
		}

		override public function onRegister():void {
			eventMap.mapListener(view, ControlEvent.FILE_BUTTON_CLICKED, onFileButtonClicked);
			
			positionView();
			view.build(dimensions.controlBarWidth, dimensions.appSize.height - dimensions.piecesCloudHeight, dimensions.borderThickness);
		}

		private function positionView() : void {
			view.x = dimensions.appSize.width - dimensions.controlBarWidth;
		}

		private function onFileButtonClicked(event : ControlEvent) : void {
			eventDispatcher.dispatchEvent(event.clone());
		}
	}
}
