package com.heydeweb.puzzle.view {
	import com.heydeweb.puzzle.events.ImageEvent;
	import com.heydeweb.puzzle.model.DimensionsModel;
	import com.heydeweb.puzzle.model.ImageModel;

	import org.robotlegs.mvcs.Mediator;

	import flash.display.Bitmap;

	/**
	 * @author phihey
	 */
	public class PuzzleAreaMediator extends Mediator {
		[Inject]
		public var view : PuzzleArea;
		
		[Inject]
		public var dimensions : DimensionsModel;
		
		[Inject]
		public var imageData : ImageModel;

		public function PuzzleAreaMediator() {
		}

		override public function onRegister():void {
			eventMap.mapListener(eventDispatcher, ImageEvent.IMAGE_LOADED, onImageUpdated);

			view.setMaxImageSize(dimensions.imageMaxDimensions);
		}

		private function onImageUpdated(event : ImageEvent) : void {
			var image:Bitmap = imageData.image;
			
			image = resizeImage(image);
			image.smoothing = true;
			
			view.updateImage(imageData.image);
		}

		private function resizeImage(image : Bitmap) : Bitmap {
			var pctDiff:Number;
			
			if (image.width > dimensions.imageMaxDimensions.width) {
				pctDiff = dimensions.imageMaxDimensions.width / image.width;
				image.width = dimensions.imageMaxDimensions.width;
				image.height = image.height * pctDiff;
			}
			
			if (image.height > dimensions.imageMaxDimensions.height){
				pctDiff = dimensions.imageMaxDimensions.height / image.height;
				image.height = dimensions.imageMaxDimensions.height;
				image.width = image.width * pctDiff;
			}
			return image;
		}
	}
}
