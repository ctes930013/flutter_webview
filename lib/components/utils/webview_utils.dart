import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewUtils extends WebView{
  const WebViewUtils({
    Key? key,
    WebViewCreatedCallback? onWebViewCreated,
    String? initialUrl,
    List<WebViewCookie> initialCookies = const <WebViewCookie>[],
    JavascriptMode javascriptMode = JavascriptMode.unrestricted,
    Set<JavascriptChannel>? javascriptChannels,
    NavigationDelegate? navigationDelegate,
    Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers,
    PageStartedCallback? onPageStarted,
    PageFinishedCallback? onPageFinished,
    PageLoadingCallback? onProgress,
    WebResourceErrorCallback? onWebResourceError,
    bool debuggingEnabled = false,
    bool gestureNavigationEnabled = false,
    String? userAgent,
    bool zoomEnabled = false,
    AutoMediaPlaybackPolicy initialMediaPlaybackPolicy =
        AutoMediaPlaybackPolicy.require_user_action_for_all_media_types,
    bool allowsInlineMediaPlayback = false,
    Color? backgroundColor,
  }) : super(
      key: key,
      onWebViewCreated: onWebViewCreated,
      initialUrl: initialUrl,
      initialCookies: initialCookies,
      javascriptMode: javascriptMode,
      javascriptChannels: javascriptChannels,
      navigationDelegate: navigationDelegate,
      gestureRecognizers: gestureRecognizers,
      onPageStarted: onPageStarted,
      onPageFinished: onPageFinished,
      onProgress: onProgress,
      onWebResourceError: onWebResourceError,
      debuggingEnabled: debuggingEnabled,
      gestureNavigationEnabled: gestureNavigationEnabled,
      userAgent: userAgent,
      zoomEnabled: zoomEnabled,
      initialMediaPlaybackPolicy: initialMediaPlaybackPolicy,
      allowsInlineMediaPlayback: allowsInlineMediaPlayback,
      backgroundColor: backgroundColor,
  );

}