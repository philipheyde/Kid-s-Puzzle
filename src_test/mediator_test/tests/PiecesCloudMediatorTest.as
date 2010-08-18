package mediator_test.tests {
	import com.heydeweb.puzzle.events.ControlEvent;
	import com.heydeweb.puzzle.view.PiecesCloud;
	import com.heydeweb.puzzle.view.PiecesCloudMediator;

	import org.flexunit.Assert;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	import org.robotlegs.mvcs.Mediator;

	import flash.events.EventDispatcher;

	/**
	 * @author phihey
	 */
	public class PiecesCloudMediatorTest{
		private var _instanceMediator : PiecesCloudMediator;

		[Before]
		public function setup():void {
			_instanceMediator = new PiecesCloudMediator();
			_instanceMediator.view = new PiecesCloud();
			_instanceMediator.eventDispatcher = new EventDispatcher();
			_instanceMediator.onRegister();
		}
		
		public function tearDown():void {
			_instanceMediator = null;
		}
		
		[Test]
		public function testInstantiated():void {
			assertTrue("instanceMediator is ControlBarMediator", _instanceMediator is PiecesCloudMediator);
		}
        
		[Test]
		public function testIsMediator():void{
			assertTrue("instanceMediator is robotlegs Mediator", _instanceMediator is Mediator);
		}

		[Test]
		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		[Test(async)]
		public function testRegisterDefinitionEventTriggersShowDefinitionButtonOnView():void{
			_instanceMediator.eventDispatcher.addEventListener(ControlEvent.FILE_BUTTON_CLICKED, Async.asyncHandler(this, checkAddButtonCalledOnView, 50, null, handleTimeout));
			_instanceMediator.view.dispatchEvent(new ControlEvent(ControlEvent.FILE_BUTTON_CLICKED));
		}

		private function checkAddButtonCalledOnView(e:ControlEvent, passThroughData : Object):void{
			assertTrue("File button click event dispatched", true);
		}

		private function handleTimeout(passThroughData : Object) : void {
			Assert.fail("Timeout reached before event");
		}
	}
}
