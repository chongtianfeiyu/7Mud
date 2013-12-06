package testPhase
{
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.display.Stage;

    public class TestPhase001
    {
        private var iconShapeList:Vector.<Shape>;
        private var iconShape:Shape;
        
        public function TestPhase001( stage:Stage )
        {
            var conSpr:Sprite = new Sprite();
            conSpr.scaleX = 0.4;
            conSpr.scaleY = 0.4;
            stage.addChild( conSpr );
            
            var strLength:String;
            iconShapeList = new Vector.<Shape>();
            
            for ( var i:int = 0;i<4096;i++)
            {
                iconShape = new Shape();
                
                iconShape.graphics.lineStyle( 1 , 0xff0000 );
                iconShape.graphics.drawRect( 0 , 0 , 32 , 32 );
                iconShape.graphics.endFill();
                
                strLength = i.toString(2);
                
                //0 1 10 11 100
                //0 1 01 11 001
                var index:int;
                for( var j:int = 0;j<strLength.length;j++)
                {
                    index = strLength.length - j - 1;
                    if( strLength.charAt( j ) == "1" )
                    {
                        iconShape.graphics.beginFill( 0xff0000 );
                        iconShape.graphics.drawRect( (index%4) * 8 , int(index/4)*8 , 8 , 8 );
                        iconShape.graphics.endFill();
                    }
                    else
                    {
                        
                    }
                }
                
                
                conSpr.addChild( iconShape );
                iconShape.x = 10 + ( i % 72 ) * 36;
                iconShape.y = 100 + int( i / 72 ) * 36;

                iconShapeList[i] = iconShape;
            }
            
        }
    }
}