package mediator_test {
	import mediator_test.tests.PuzzleAreaMediatorTest;
	import mediator_test.tests.PiecesCloudMediatorTest;
	import mediator_test.tests.ControlBarMediatorTest;
	/**
	 * @author phihey
	 */
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class MediatorTestSuite {
		public var t1 : ControlBarMediatorTest;
		public var t2 : PiecesCloudMediatorTest;
		public var t3 : PuzzleAreaMediatorTest;
	}
}
