package commands_test {
	import commands_test.tests.LoadFileCommandTest;
	import commands_test.tests.CreateUICommandTest;

	/**
	 * @author phihey
	 */
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class CoreTestSuite {
		public var t1 : LoadFileCommandTest;
		public var t2 : CreateUICommandTest;
	}
}
