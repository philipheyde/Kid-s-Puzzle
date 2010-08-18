package commands_test.tests {
	import com.heydeweb.puzzle.controller.CreateUICommand;
	import com.heydeweb.puzzle.view.ControlBar;
	import com.heydeweb.puzzle.view.PiecesCloud;
	import com.heydeweb.puzzle.view.PuzzleArea;

	import org.flexunit.asserts.assertTrue;
	import org.robotlegs.adapters.SwiftSuspendersInjector;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.Command;

	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	/**
	 * @author phihey
	 */
	public class CreateUICommandTest {
		private var _instance : CreateUICommand;
		private var _target : DisplayObjectContainer;

		[Before]
		public function setup():void {
			_instance = new CreateUICommand();
			_target = new Sprite() as DisplayObjectContainer;
			_instance.contextView = _target;

			var injector : SwiftSuspendersInjector = new SwiftSuspendersInjector();
			_instance.injector = injector as IInjector;
		}

		[After]
		protected function tearDown():void {
			_instance = null;
			_target = null;
		}

		[Test(order=1)]
		public function testInstantiated():void {
			assertTrue("instance is ClearSearchCommand", _instance is CreateUICommand);
		}

		[Test(order=2)]
		public function testIsCommand():void {
			assertTrue("instance is robotlegs Command", _instance is Command);
		}

		[Test(order=3)]
		public function testExecute():void {
			assertTrue("Execute returns null", (_instance.execute() == null));
		}

		[Test(order=4)]
		public function testControlBar():void {
			_instance.execute();
			assertTrue("ControlBar exists", checkForClip(_target, ControlBar));
		}

		[Test(order=5)]
		public function testPiecesCloud():void {
			_instance.execute();
			assertTrue("PiecesCloud exists", checkForClip(_target, PiecesCloud));
		}

		[Test(order=6)]
		public function testPuzzleArea():void {
			_instance.execute();
			assertTrue("PuzzleArea exists", checkForClip(_target, PuzzleArea));
		}
		
		private function checkForClip(source:DisplayObjectContainer, queryClass:Class):Boolean{
			var i:int;
			var len:int = source.numChildren;
			for(i=0;i<len;i++){
				if (source.getChildAt(i) is queryClass){
					return true;
				}
			}
			
			return false;
		}
	}
}
