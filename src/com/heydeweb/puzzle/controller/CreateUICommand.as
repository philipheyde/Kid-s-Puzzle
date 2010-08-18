package com.heydeweb.puzzle.controller {
	import com.heydeweb.puzzle.view.PuzzleArea;
	import com.heydeweb.puzzle.view.PiecesCloud;
	import com.heydeweb.puzzle.view.ControlBar;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author phihey
	 */
	public class CreateUICommand extends Command {
		override public	function execute():void {
			contextView.addChild(new ControlBar());
			contextView.addChild(new PiecesCloud());
			contextView.addChild(new PuzzleArea());
		}
	}
}
