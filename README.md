7Mud
====

class MainSprite
	onAddToStage()	
		//stage3DManager,stage3DProxy
	onContextCreated()	
		//initAway3D,initStarling,initMornUI,initListeners
			//stageProxy -> onEnterFrame
	onEnterFrame()
		//onStarlingInitialized()
		//tick()
		//nextFrame()
		//render()
	onStarlingInitialized()
		//MainMgr.instance
		//robotlegs -> init
		//onContextInitialized()
			->injectInto( this )
			->initStarlingLevls( _starlingMain )
			->protected override -> App.LoadAssets() -> configs
	onLoadComplete()
		//perload
	onPerloadComplete()
		//MornUI.start()
		//TestPhase()
	MainViewController
		//=>
			
						