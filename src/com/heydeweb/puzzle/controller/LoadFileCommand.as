package com.heydeweb.puzzle.controller {
	import com.heydeweb.puzzle.events.ImageEvent;
	import com.heydeweb.puzzle.model.ImageModel;

	import org.robotlegs.mvcs.Command;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.geom.Matrix;
	import flash.net.FileFilter;
	import flash.net.FileReference;

	/**
	 * @author phihey
	 */
	public class LoadFileCommand extends Command {
		private var file : FileReference;
		private var bytesLoader : Loader;

		override public	function execute():void {
			file = new FileReference();

			configureListeners(file);

			file.browse(getTypes());
		}

		private function configureListeners(dispatcher : IEventDispatcher):void {
			dispatcher.addEventListener(Event.COMPLETE, completeHandler);
			dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			dispatcher.addEventListener(Event.SELECT, selectHandler);
		}

		private function getTypes() : Array {
			return [new FileFilter("Images (*.jpg, *.jpeg, *.gif, *.png)", "*.jpg;*.jpeg;*.gif;*.png")];
		}

		private function completeHandler(event : Event):void {
			bytesLoader = new Loader();
			bytesLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageBytesLoaded);
			bytesLoader.loadBytes(file.data);
		}

		private function onImageBytesLoaded(event : Event) : void {
			var content : DisplayObject = bytesLoader.content;
			var BMPData : BitmapData = new BitmapData(content.width, content.height);
			var UIMatrix : Matrix = new Matrix();
			BMPData.draw(content, UIMatrix);
			var image : Bitmap = new Bitmap(BMPData);
			(injector.getInstance(ImageModel) as ImageModel).image = image;
			eventDispatcher.dispatchEvent(new ImageEvent(ImageEvent.IMAGE_LOADED));
		}

		private function ioErrorHandler(event : IOErrorEvent):void {
			trace("ioErrorHandler: " + event);
		}

		private function securityErrorHandler(event : SecurityErrorEvent):void {
			trace("securityErrorHandler: " + event);
		}

		private function selectHandler(event : Event):void {
			var file : FileReference = FileReference(event.target);
			file.load();
		}
	}
}
