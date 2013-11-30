package com.n7mud.robotlegs
{
    import com.n7mud.robotlegs.extensions.displayMgrExtension.DisplayMgrExtension;
    import com.n7mud.robotlegs.extensions.keyMgrExtension.KeyMgrExtension;
    import com.n7mud.robotlegs.extensions.textureMgrExtension.TextureMgrExtension;
    import com.n7mud.robotlegs.extensions.uiMgrExtension.UIMgrExtension;
    import com.n7mud.robotlegs.extensions.zipMgrExtension.ZipMgrExtension;
    
    import robotlegs.bender.framework.api.IBundle;
    import robotlegs.bender.framework.api.IContext;
    
    public class DurianBundle implements IBundle
    {
        public function extend(context:IContext):void
        {
            context.install(
                DisplayMgrExtension,
                UIMgrExtension,
                KeyMgrExtension,
                ZipMgrExtension,
                TextureMgrExtension
                );    
            
            context.configure(DurianConfig);
        }
    }
}