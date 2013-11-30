package com.n7mud.robotlegs.extensions.uiMgrExtension
{
    import com.n7mud.interfaces.IUIMgr;
    
    import robotlegs.bender.framework.api.IContext;
    import robotlegs.bender.framework.api.IExtension;
    
    public class UIMgrExtension implements IExtension
    {
        /*============================================================================*/
        /* Private Properties                                                         */
        /*============================================================================*/
        
        private var _context:IContext;
        
        /*============================================================================*/
        /* Constructor                                                                */
        /*============================================================================*/
        
        /*============================================================================*/
        /* Public Functions                                                           */
        /*============================================================================*/
        
        /**
         * @inheritDoc
         */
        public function extend(context:IContext):void
        {
            _context = context;
            _context.injector.map(IUIMgr).toSingleton(UIMgr);
            _context.beforeInitializing(configureLifecycleEventRelay);
            _context.afterDestroying(destroyLifecycleEventRelay);
        }
        
        /*============================================================================*/
        /* Private Functions                                                          */
        /*============================================================================*/
        
        private function configureLifecycleEventRelay():void
        {
            
        }
        
        private function destroyLifecycleEventRelay():void
        {
            
        }
    }
}


