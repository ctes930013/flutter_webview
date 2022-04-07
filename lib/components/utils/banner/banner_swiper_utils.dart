import 'dart:async';

import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterwebview/providers/banner_swiper_utils_provider.dart';

import 'banner_indicator_utils.dart';

typedef GetWidgetCallback = Widget Function(int index);

class BannerSwiperUtils extends StatefulWidget {
  final int length;
  final GetWidgetCallback? getwidget;
  final int width;
  final int height;
  final Widget? selectorWidget;
  final Widget? normalWidget;
  final bool autoLoop;
  final bool showIndicator;
  final bool spaceMode;
  BannerSwiperUtils(
      {Key? key,
      required this.length,
      this.getwidget,
      required this.width,
      required this.height,
      this.selectorWidget,
      this.normalWidget,
      this.autoLoop = true,
      this.showIndicator = true,
      this.spaceMode = true});

  @override
  State<StatefulWidget> createState() {
    return _BannerSwiperUtilsState();
  }
}

class _BannerSwiperUtilsState extends State<BannerSwiperUtils> {
  @override
  void didUpdateWidget(BannerSwiperUtils oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  late PageController _pageController;
  int _currentIndex = 0;
  late Timer _timer;

  //设置定时器
  _setTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      _pageController.animateToPage(_currentIndex + 1,
          duration: const Duration(milliseconds: 1000), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    final BannerSwiperUtilsProvider bannerProvider =
        Provider.of<BannerSwiperUtilsProvider>(context, listen: false);
    return getBanner2(bannerProvider);
  }

  int bannerMax = 10000000000;

  double mywidth = 0;

  late SquareIndicator squareIndicator;

  GlobalKey<MSquareIndicator> indicatorKey = GlobalKey<MSquareIndicator>();

  double viewportFractionCustom = 1; //定義圖片之間的距離   1代表圖片滿版
  double paddingCustom = 0;
  Widget getBanner2(bannerProvider) {
    if (widget.spaceMode) {
      viewportFractionCustom = 0.825;
      paddingCustom = 0.0125;
    }
    mywidth = MediaQuery.of(context).size.width;

    if (widget.length > 0) {
      _pageController = PageController(
          initialPage: widget.length * 100,
          viewportFraction: viewportFractionCustom);
      _currentIndex = widget.length * 100;

      if (widget.autoLoop) {
        _setTimer();
      }
    }
    if (widget.length == 0) {
      return Container();
    }

    PageView pageView = PageView.builder(
      itemBuilder: ((context, index) {
        GlobalKey _key = GlobalKey();
        Container cc = Container(
          key: _key,
          //左右两个padding
          margin: EdgeInsets.only(
              left: mywidth * paddingCustom, right: mywidth * paddingCustom),
          width: mywidth,

          height: mywidth *
              (viewportFractionCustom - paddingCustom * 2) *
              widget.width /
              widget.height,
          child: widget.getwidget!(index),
        );

        return cc;
      }),
      itemCount: bannerMax,
      scrollDirection: Axis.horizontal,
      reverse: false,
      controller: _pageController,
      physics: const PageScrollPhysics(parent: BouncingScrollPhysics()),
      onPageChanged: ((index) {
//        setState(() {
        _currentIndex = index;
        if (indicatorKey.currentState != null) {
          indicatorKey.currentState
              ?.updateWidgets(widget.length, (_currentIndex) % widget.length);
        } else {}
//        squareIndicator.createState().setState((){});
//        });
      }),
    );
    if (widget.showIndicator) {
      squareIndicator = SquareIndicator(
        normalWidget: widget.normalWidget,
        selectorWidget: widget.selectorWidget,
        key: indicatorKey,
        length: widget.length,
        select: (_currentIndex) % widget.length,
      );
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width *
          widget.width /
          widget.height *
          (viewportFractionCustom - paddingCustom * 2),
      child: Stack(
        children: <Widget>[
          NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              ScrollDirection direction = notification.direction;
              //向左滑
              if (direction == ScrollDirection.reverse) {
                bannerProvider.setScrollStatus('left');
                //向右滑
              } else if (direction == ScrollDirection.forward) {
                bannerProvider.setScrollStatus('right');
                //停止左右刷banner
              } else if (direction == ScrollDirection.idle) {
                bannerProvider.setScrollStatus('none');
              }
              return true;
            },
            child: pageView,
          ),
          _getSquareIndicator(),
        ],
      ),
    );
  }

  Widget _getSquareIndicator() {
    if (widget.showIndicator) {
      return Positioned(
        bottom: mywidth * 0.02,
        left: 0,
        right: 0,
        child: squareIndicator,
      );
    } else {
      return Container();
    }
  }
}
