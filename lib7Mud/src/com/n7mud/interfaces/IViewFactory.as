package com.n7mud.interfaces
{
    import morn.core.components.View;

    public interface IViewFactory
    {
        function getView( name:String ):View;
    }
}