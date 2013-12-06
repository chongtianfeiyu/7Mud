package
{
    import com.n7mud.info.UserInfo;
    import com.n7mud.interfaces.IUserInfo;
    import com.n7mud.interfaces.IViewFactory;
    import com.n7mud.managers.MainMgr;
    
    import robotlegs.bender.framework.api.IConfig;
    import robotlegs.bender.framework.api.IInjector;
    
    public class MainConfig implements IConfig
    {
        [Inject]
        public var injector:IInjector;
        
        public function configure():void
        {
            injector.map(IUserInfo).toSingleton(UserInfo);
            injector.map(IViewFactory).toSingleton(ViewFactory);
            
            injector.injectInto( MainMgr.instance );
        }
    }
}