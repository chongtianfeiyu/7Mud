package testPhase
{
    import com.n7mud.utils.GeomUtil;
    
    import flash.display.Shape;
    import flash.display.Stage;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Point;

    public class TestPhase002
    {
        private var player:Shape;
        private var _isDown:Boolean;
        private var _downPos:Point;
        private var _bulltList:Vector.<TestBullet>;
        private var _stage:Stage
        private var _lastTimeStamp:uint;
        private var _lastAttackStamp:uint;
        
        public function TestPhase002( stage:Stage )
        {
            _stage = stage;
            _bulltList = new Vector.<TestBullet>();
            
            player = new Shape();
            player.graphics.beginFill( 0xff0000 );
            player.graphics.drawCircle( 0 , 0 , 12 );
            player.graphics.endFill();
            
            stage.addChild( player );
            
            player.x = 200;
            player.y = 200;
            
            _lastTimeStamp = (new Date()).time;
            
            stage.addEventListener( Event.ENTER_FRAME, onEnterFrame );
            stage.addEventListener( MouseEvent.MOUSE_DOWN , onMouseDown );
            stage.addEventListener( MouseEvent.MOUSE_UP , onMouseUp );
            stage.addEventListener( MouseEvent.MOUSE_MOVE , onMouseOver );
        }
        
        protected function onEnterFrame(e:Event):void
        {
            var time:uint = (new Date()).time;
            _lastTimeStamp = time;
            if( _isDown )
            {
                if( _lastTimeStamp - _lastAttackStamp > 100 )
                {
                    var startPos:Point = new Point( player.x , player.y );
                    
                    var angle:Number = GeomUtil.getLineAngle( startPos , _downPos );
                    
                    var len:Number = GeomUtil.getLineLength( startPos , _downPos );
                    
                    var dp1:Point = GeomUtil.radiansToSpeed( angle + 0.1 );
                    dp1.x = dp1.x * len + startPos.x;
                    dp1.y = dp1.y * len + startPos.y;
                    var dp2:Point = GeomUtil.radiansToSpeed( angle - 0.1 );
                    dp2.x = dp2.x * len + startPos.x;
                    dp2.y = dp2.y * len + startPos.y;
                    var dp3:Point = GeomUtil.radiansToSpeed( angle + 0.2 );
                    dp3.x = dp3.x * len + startPos.x;
                    dp3.y = dp3.y * len + startPos.y;
                    var dp4:Point = GeomUtil.radiansToSpeed( angle - 0.2 );
                    dp4.x = dp4.x * len + startPos.x;
                    dp4.y = dp4.y * len + startPos.y;
                    
                    _lastAttackStamp = time;
                    
                    var testBullet:TestBullet = new TestBullet( startPos , _downPos , _bulltList );
                    _stage.addChild( testBullet._shape );
                    _bulltList.push( testBullet );
                    
                    testBullet = new TestBullet( startPos , dp1 , _bulltList );
                    _stage.addChild( testBullet._shape );
                    _bulltList.push( testBullet );

                    testBullet = new TestBullet( startPos , dp2 , _bulltList );
                    _stage.addChild( testBullet._shape );
                    _bulltList.push( testBullet );

                    testBullet = new TestBullet( startPos , dp3 , _bulltList );
                    _stage.addChild( testBullet._shape );
                    _bulltList.push( testBullet );

                    testBullet = new TestBullet( startPos , dp4 , _bulltList );
                    _stage.addChild( testBullet._shape );
                    _bulltList.push( testBullet );
                }
            }
            
            for( var i:int = 0;i<_bulltList.length;i++)
            {
                _bulltList[i].update();
            }
        }
        
        protected function onMouseOver( e:MouseEvent):void
        {
            _downPos = new Point();
            _downPos.x = int(e.stageX);
            _downPos.y = int(e.stageY);
        }
        
        protected function onMouseUp( e:MouseEvent):void
        {
            _isDown = false;
        }
        
        protected function onMouseDown( e:MouseEvent):void
        {
            _isDown = true;
            _downPos = new Point();
            _downPos.x = int(e.stageX);
            _downPos.y = int(e.stageY);
        }
    }
}