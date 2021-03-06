package com.n7mud.actTpc
{
    import com.n7mud.actSpr.structs.CACT;
    import com.n7mud.actSpr.structs.acth.AnyActAnyPat;
    import com.n7mud.actSpr.structs.acth.AnyPatSprV0101;
    import com.n7mud.display.texture.MultiStateTextureAnimaiton;
    import com.n7mud.events.ActTpcEvent;
    
    import flash.display.BitmapData;
    
    import starling.textures.Texture;
    import starling.textures.TextureAtlas;
    
    public class ActTpcView extends MultiStateTextureAnimaiton
    {
        protected static const NULL_TEXTURE:Texture = Texture.fromBitmapData(new BitmapData(1,1,true,0));
        
        protected var _aaapList:Vector.<Vector.<AnyActAnyPat>>;
        protected var _currentAaap:AnyActAnyPat;
        
        public function ActTpcView( name:String )
        {
            super( name );
        }
        
        public function initAct( cact:CACT  ):void
        {
            _couldTick = false;
            
            _animationConfig = new Vector.<Vector.<String>>();
            _aaapList = new Vector.<Vector.<AnyActAnyPat>>();
            
            var lenState:int = cact.aall.aa.length;
            var lenFrame:int;
            for( var i:int = 0;i<lenState ;i++)
            {
                _animationConfig[i] = new Vector.<String>();
                _aaapList[i] = new Vector.<AnyActAnyPat>();
                
                lenFrame =  cact.aall.aa[i].aaap.length;
                
                for( var j:int = 0;j<lenFrame;j++)
                {
                    _animationConfig[i][j] = cact.aall.aa[i].aaap[j].apsList[0];
                    _aaapList[i][j] = cact.aall.aa[i].aaap[j];
                }
            }
            
            stateIndex = 0;
            currentFrame = 0;
            _counter.initialize();
            _counter.reset( _counterTarget );
        }
        
        public function initTpc( resId:String , textureAtlas:TextureAtlas ):void
        {
            super.updateAnimation( textureAtlas );
        }
        
        override protected function onInited():void
        {
            stateIndex = 0;
            super.onInited();
        }
        
        override public function tick(delta:Number):void
        {
            if( !_couldTick )
            {
                return;
            }
            _counter.tick( delta );
            var couldRender:Boolean;
            
            var lenState:int = _animationConfig.length;
            while( _counter.expired == true )
            {
                if( lenState <= _stateIndex )
                {
                    _stateIndex = 0;
                    return;
                }
                if( _currentFrame >= _animationConfig[_stateIndex].length - 1 )
                {
                    if( _loop )
                    {
                        _currentFrame = 0;
                    }
                    dispatchEvent(new ActTpcEvent( ActTpcEvent.MOTION_FINISHED, true ));
                }
                else
                {
                    _currentFrame++;
                }
                couldRender = true;
                _counter.reset( _counterTarget );
            }
            
            if(couldRender == true)
            {
                updateFrame();
            }
        }
        
        override public function updateFrame():void
        {
            _currentAaap = _aaapList[_stateIndex][_currentFrame];
            
            var isExt:Boolean = false;
            if( _currentAaap.apsList.length == 0 )
            {
                return;
            }
            var apsv:AnyPatSprV0101 = _currentAaap.apsList[0];
            if( !apsv )
            {
                return;
            }
            if( apsv.sprNo == 0xffffffff )
            {
                if( _currentAaap.apsList.length > 1)
                {
                    apsv = _currentAaap.apsList[1];
                    isExt = true;
                }
            }
            if( apsv as AnyPatSprV0101 && apsv.sprNo != 0xffffffff )
            {
                var mTexture:Texture = _textureList[ apsv.sprNo ];
                if( mTexture && _animationDisplay.texture != mTexture )
                {
                    _animationDisplay.texture = mTexture ;
                    if( apsv.mirrorOn == 0 )
                    {
                        _animationDisplay.x = int(-_animationDisplay.texture.width / 2 + apsv.xOffs);
                        _animationDisplay.y = int(-_animationDisplay.texture.height / 2 + apsv.yOffs);
                        _animationDisplay.scaleX = 1;
                    }
                    else
                    {
                        _animationDisplay.x = int(_animationDisplay.texture.width / 2 + apsv.xOffs);
                        _animationDisplay.y = int(-_animationDisplay.texture.height / 2 + apsv.yOffs);
                        _animationDisplay.scaleX = -1;
                    }
                    _animationDisplay.readjustSize();
                }
            }
        }
        
        override public function dispose():void
        {
            super.dispose();
        }
        
        override protected function distruct():void
        {
            //TODO:
            super.distruct();
        }
        
        public function get currentAaap():AnyActAnyPat
        {
            return _currentAaap;
        }
    }
}