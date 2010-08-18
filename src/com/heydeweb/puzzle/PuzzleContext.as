package com.heydeweb.puzzle {
	import com.heydeweb.puzzle.controller.CreateUICommand;
	import com.heydeweb.puzzle.controller.LoadFileCommand;
	import com.heydeweb.puzzle.events.ControlEvent;
	import com.heydeweb.puzzle.model.DimensionsModel;
	import com.heydeweb.puzzle.model.ImageModel;
	import com.heydeweb.puzzle.view.ControlBar;
	import com.heydeweb.puzzle.view.ControlBarMediator;
	import com.heydeweb.puzzle.view.PiecesCloud;
	import com.heydeweb.puzzle.view.PiecesCloudMediator;
	import com.heydeweb.puzzle.view.PuzzleArea;
	import com.heydeweb.puzzle.view.PuzzleAreaMediator;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author phihey
	 */
	public class PuzzleContext extends Context {
		public function PuzzleContext(contextView : DisplayObjectContainer) {
			super(contextView);
		}

		override public function startup():void {
			// Map some Commands to Events
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, CreateUICommand, ContextEvent, true);
			commandMap.mapEvent(ControlEvent.FILE_BUTTON_CLICKED, LoadFileCommand, ControlEvent);
			
			// Create a rule for Dependency Injection
			injector.mapSingleton(ImageModel);
			injector.mapSingleton(DimensionsModel);
			
			// Here we bind Mediator Classes to View Classes:
			// Mediators will be created automatically when
			// view instances arrive on stage (anywhere inside the context view)
			mediatorMap.mapView(ControlBar, ControlBarMediator);
			mediatorMap.mapView(PiecesCloud, PiecesCloudMediator);
			mediatorMap.mapView(PuzzleArea, PuzzleAreaMediator);

			// Manually add something to stage
//			contextView.addChild(new Readout());
			
			// And we're done
			super.startup();
		}
	}
}
