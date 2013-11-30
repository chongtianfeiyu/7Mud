package com.n7mud.actSpr
{
    import com.n7mud.events.ActSprEvent;

    /**
     * body view 
     * @author inoah
     * 
     */    
    public class ActSprBodyView extends ActSprView
    {
        public function ActSprBodyView()
        {
            super();
        }
        
        override public function updateFrame():void
        {
            super.updateFrame();
            dispatchEvent( new ActSprEvent( ActSprEvent.NEXT_FRAME ) );
        }
    }
}