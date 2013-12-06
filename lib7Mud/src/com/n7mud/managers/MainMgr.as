package com.n7mud.managers
{
    import com.n7mud.interfaces.IDisplayMgr;
    import com.n7mud.interfaces.IKeyMgr;
    import com.n7mud.interfaces.ITextureMgr;
    import com.n7mud.interfaces.IUIMgr;
    import com.n7mud.interfaces.IUserInfo;
    import com.n7mud.interfaces.IViewFactory;
    import com.n7mud.interfaces.IZipMgr;

    public class MainMgr
    {
        private static var _instance:MainMgr;
        
        private var _displayMgr:IDisplayMgr;
        private var _uiMgr:IUIMgr;
        private var _keyMgr:IKeyMgr;
        private var _zipMgr:IZipMgr;
        private var _textureMgr:ITextureMgr;
        
        [Inject]
        public var mUserInfo:IUserInfo;
        
        [Inject]
        public var mViewFactory:IViewFactory;
        
        public static function get instance():MainMgr
        {
            if( !_instance )
            {
                _instance = new MainMgr();
            }
            return _instance;
        }
        
        public function MainMgr()
        {
            if( _instance )
            {
                return;
            }
            _displayMgr = new DisplayMgr();
            _uiMgr = new UIMgr();
            _keyMgr = new KeyMgr();
            _zipMgr = new ZipMgr();
            _textureMgr = new TextureMgr();
        }
        
        public static function get displayMgr():IDisplayMgr
        {
            return _instance._displayMgr;
        }
        public static function get uiMgr():IUIMgr
        {
            return _instance._uiMgr;
        }
        public static function get textureMgr():ITextureMgr
        {
            return _instance._textureMgr;
        }
        public static function get zipMgr():IZipMgr
        {
            return _instance._zipMgr;
        }
        
        public static function get userInfo():IUserInfo
        {
            return _instance.mUserInfo;
        }
        public static function get viewFactory():IViewFactory
        {
            return _instance.mViewFactory;
        }
    }
}