import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

// PlatformViewLink: Links a platform view with the Flutter framework.
// Provides common functionality for embedding a platform view with the Flutter framework.
//
// viewType: The unique identifier for the view type to be embedded.
// It is of string type which uniquely identifies your view. you can name it anything in my case it is video_player_view.
//
// creationParams: using this we can pass data to native side.
//
// AndroidViewSurface: Integrates an Android view with Flutter’s compositor, touch, and semantics subsystems.
// it implements PlatformViewSurface.
//
// PlatformViewController: An interface for controlling a single platform view.

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    // Will be used in the platform side to register view
    const String viewType = 'video_player_view';
    const Map<String, dynamic> creationParams = <String, dynamic>{};
    return Scaffold(
      body: PlatformViewLink(
        viewType: viewType,
        surfaceFactory:
            (context, controller) {
          return AndroidViewSurface(
            controller: controller as AndroidViewController,
            gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
            hitTestBehavior: PlatformViewHitTestBehavior.opaque,
          );
        },
        onCreatePlatformView: (params) {
          return PlatformViewsService.initSurfaceAndroidView(
            id: params.id,
            viewType: viewType,
            layoutDirection: TextDirection.ltr,
            creationParams: creationParams,
            creationParamsCodec: const StandardMessageCodec(),
            onFocus: () {
              params.onFocusChanged(true);
            },
          )
            ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
            ..create();
        },
      ),
    );
  }
}
