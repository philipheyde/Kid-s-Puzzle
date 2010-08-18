package com.heydeweb.puzzle.view {
	import com.heydeweb.puzzle.model.DimensionsModel;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author phihey
	 */
	public class PiecesCloudMediator extends Mediator {
		[Inject]
		public var view : PiecesCloud;
		
		[Inject]
		public var dimensions : DimensionsModel;

		public function PiecesCloudMediator() {
			// Avoid doing work in your constructors!
			// Mediators are only ready to be used when onRegister gets called
		}

		override public function onRegister():void {
			positionView();

			view.build(dimensions.appSize.width, dimensions.piecesCloudHeight, dimensions.borderThickness);
		}

		private function positionView() : void {
			view.y = dimensions.appSize.height - dimensions.piecesCloudHeight;
		}
	}
}
