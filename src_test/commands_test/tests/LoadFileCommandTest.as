package commands_test.tests {
	import com.heydeweb.puzzle.controller.LoadFileCommand;
	import com.heydeweb.puzzle.events.ImageEvent;
	import com.heydeweb.puzzle.model.ImageModel;

	import org.flexunit.Assert;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	import org.robotlegs.adapters.SwiftSuspendersInjector;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.Command;

	import flash.display.Bitmap;
	import flash.events.EventDispatcher;

	/**
	 * @author phihey
	 */
	public class LoadFileCommandTest {
		private var instance : LoadFileCommand;

		[Before]
		public function setup():void {
			instance = new LoadFileCommand();
			instance.eventDispatcher = new EventDispatcher();

			var injector : SwiftSuspendersInjector = new SwiftSuspendersInjector();
			injector.mapValue(ImageModel, new ImageModel());

			instance.injector = injector as IInjector;
		}

		[After]
		protected function tearDown():void {
			instance = null;
		}

		[Test(order=1)]
		public function testInstantiated():void {
			assertTrue("instance is ClearSearchCommand", instance is LoadFileCommand);
		}

		[Test(order=2)]
		public function testIsCommand():void {
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		[Test(async, order=3)]
		public function testExecute():void {
			instance.eventDispatcher.addEventListener(ImageEvent.IMAGE_LOADED, Async.asyncHandler(this, handleImagesReceived, 0, null, handleServiceTimeout));
			assertTrue("Execute returns null", (instance.execute() == null));
		}

		protected function handleServiceTimeout(object : Object):void {
			Assert.fail('Pending Event Never Occurred');
		}

		protected function handleImagesReceived(event : ImageEvent, object : Object):void {
			var model : ImageModel = (instance.injector.getInstance(ImageModel) as ImageModel);
			assertTrue("A photo should be loaded", model.image is Bitmap);
		}
	}
}
