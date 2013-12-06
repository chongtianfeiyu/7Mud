package testPhase
{
    import com.n7mud.utils.GeomUtil;
    
    import flash.display.Shape;
    import flash.geom.Point;

    public class TestBullet
    {
        public var _shape:Shape;
        private var _currentPos:Point;
        private var _downPos:Point;
        
        private var _conList:Vector.<TestBullet>;
        private var _speed:Number = 10;
        private var _angel:Number;
        
        public function TestBullet( startPos:Point , downPos:Point , conList:Vector.<TestBullet> )
        {
            _currentPos = new Point();
            _currentPos.x = startPos.x;
            _currentPos.y = startPos.y;
            
            _conList = conList;
            
            _angel = GeomUtil.getLineAngle( startPos , downPos );
            
            _shape = new Shape();
            _shape.graphics.beginFill( 0x00ff00 );
            _shape.graphics.drawCircle( 0 , 0 , 4 );
            _shape.graphics.endFill();
            
            _shape.x = _currentPos.x;
            _shape.y = _currentPos.y;
            
            _downPos = new Point();
            _downPos.x = downPos.x;
            _downPos.y = downPos.y;
        }
        
        public function update():void
        {
            if( Point.distance( _currentPos , _downPos ) > _speed )
            {
                _currentPos.x += GeomUtil.radiansToSpeed( _angel ).x * _speed;
                _currentPos.y += GeomUtil.radiansToSpeed( _angel ).y * _speed;
                
                _shape.x = _currentPos.x;
                _shape.y = _currentPos.y;
            }
            else
            {
                remove();
            }
        }
        
        private function remove():void
        {
            if( _conList.indexOf( this ) != -1 )
            {
                _shape.parent.removeChild( _shape );
                _conList.splice( _conList.indexOf( this ) , 1 );
            }
        }
    }
}