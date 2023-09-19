package com.example.platform_video_player

import android.content.Context
import com.example.platform_video_player.NativeView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

/*
Create a factory class that creates an instance
 of the NativeView created earlier (NativeView.kt):
So, a ViewFactory will get our view from here.

Also we can’t use a view directly first we have to register widgetFactory
in MainActivity.
 */

class NativeViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return NativeView(context, viewId, creationParams)
    }
}