package com.example.platform_video_player

import android.content.Context
import android.view.View
import io.flutter.plugin.platform.PlatformView


/*
Extend io.flutter.plugin.platform.PlatformView to provide a reference to the
android.view.View
 */
internal class NativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?) :
    PlatformView {

    private var view: VideoViewPlayer? = VideoViewPlayer(context)

    override fun getView(): View {
        return view!!
    }

    override fun dispose() {
        view = null
    }

}