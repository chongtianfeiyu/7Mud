package com.n7mud.interfaces
{
    import com.n7mud.actSpr.structs.CSPR;
    
    import flash.utils.ByteArray;
    
    import robotlegs.bender.extensions.mediatorMap.api.IMediator;

    public interface ISprMgr extends IMediator
    {
        function getCSPR( resId:String , sprByte:ByteArray, loadAsync:Function=null):CSPR;
        function disposeTexture( texture:CSPR ):void;
    }
}