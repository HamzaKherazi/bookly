import 'dart:ui';

import 'package:flutter/material.dart';

/// margin

double kMargin = 14.0;

/// bottom bar height

double kHeight = 62.0;

/// notch circle circle radius

const double kCircleRadius = 30.0;

/// margin between notch and circle

const double kCircleMargin = 8.0;

/// top radius

double kTopRadius = 10.0;

/// top margin

const double kTopMargin = 10.0;

/// bottom radius

double kBottomRadius = 28.0;

/// bottom bar item size

const double kIconSize = 24.0;

/// Pi value

const double kPi = 3.1415926535897932;

class BottomBarActiveItem extends StatelessWidget {
  const BottomBarActiveItem(
    this.index, {
    super.key,

    required this.itemWidget,

    required this.onTap,

    required this.scrollPosition,

    required this.kIconSize,
  });

  /// item index

  final int index;

  final double kIconSize;

  /// item

  final Widget itemWidget;

  /// Double value to indicate the item position

  final double scrollPosition;

  /// Function called when an item was tapped

  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final icon = itemWidget;

    return GestureDetector(
      child: SizedBox.fromSize(
        size: Size(kIconSize, kIconSize),

        child: Opacity(
          opacity: kPi * 2 * (scrollPosition % 1) == 0 ? 1 : 0,
          child: icon,
        ),
      ),

      onTap: () => onTap(index),
    );
  }
}

class BottomBarItem {
  const BottomBarItem({
    required this.inActiveItem,

    required this.activeItem,

    this.itemLabel,

    this.itemLabelWidget,
  }) : assert(itemLabel == null || itemLabelWidget == null);

  /// Selected bottom bar item

  final Widget inActiveItem;

  /// Un selected bottom bar item

  final Widget activeItem;

  /// bottom bar item label

  final String? itemLabel;

  /// bottom bar item label widget

  final Widget? itemLabelWidget;
}

/// Class to generate the inactive icon on bottom bar

class BottomBarInActiveItem extends StatelessWidget {
  const BottomBarInActiveItem(
    this.index, {
    super.key,

    required this.itemWidget,

    required this.kIconSize,

    required this.onTap,

    required this.showLabel,

    this.label,

    this.labelStyle,

    this.labelWidget,

    this.maxLine,

    this.textOverflow,

    this.textAlign,

    this.textDirection,
  });

  /// item index

  final int index;

  /// item widget

  final Widget itemWidget;

  /// String to indicate the label item

  final Widget? labelWidget;

  /// String to indicate the label item

  final String? label;

  /// Boolean to show the item label

  final bool showLabel;

  /// set the maxLine of item label

  final int? maxLine;

  /// to handle the overflow of the item label

  final TextOverflow? textOverflow;

  /// textAlign to align the label text

  final TextAlign? textAlign;

  /// set the textDirection of item label

  final TextDirection? textDirection;

  ///icon size

  final double kIconSize;

  /// Value to indicate the label Style

  final TextStyle? labelStyle;

  /// Function called when an item was tapped

  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),

      child: Container(
        color: Colors.transparent,

        child: SizedBox.fromSize(
          size: const Size(kCircleRadius * 2, kCircleRadius * 2),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              SizedBox(height: kIconSize, width: kIconSize, child: itemWidget),

              if (labelWidget != null || (label != null && showLabel)) ...[
                const SizedBox(height: 5.0),

                labelWidget ??
                    Text(
                      label!,

                      maxLines: maxLine ?? 1,

                      overflow: textOverflow ?? TextOverflow.ellipsis,

                      textAlign: textAlign,

                      textDirection: textDirection,

                      style:
                          labelStyle ??
                          TextStyle(color: Colors.grey[700], fontSize: 12.0),
                    ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBarPainter extends CustomPainter {
  BottomBarPainter({
    required this.position,

    required this.color,

    required this.showShadow,

    required this.notchColor,

    required this.elevation,

    required this.kBottomRadius,

    this.shadowElevation,

    this.shader,

    this.gradient,
  }) : _paint = Paint()
         ..color = color
         ..isAntiAlias = true,

       _shadowColor = Colors.grey.shade600,

       _notchPaint = Paint()
         ..color = notchColor
         ..isAntiAlias = true
         ..shader = gradient?.createShader(
           Rect.fromCircle(
             center: Offset(
               position + kCircleMargin + kCircleRadius,

               kMargin + kCircleMargin,
             ),

             radius: kCircleRadius,
           ),
         );

  /// position

  final double position;

  /// Color for the bottom bar

  final Color color;

  //final shadow show

  final double? shadowElevation;

  /// Paint value to custom painter

  final Paint _paint;

  // shader

  final Shader? shader;

  /// Shadow Color

  final Color _shadowColor;

  // bottom radius

  double kBottomRadius;

  /// Boolean to show shadow

  final bool showShadow;

  /// Paint Value of notch

  final Paint _notchPaint;

  /// Color for the notch

  final Color notchColor;

  /// To add any gradient to the notch

  final Gradient? gradient;

  /// To add any gradient to the notch

  final double elevation;

  @override
  void paint(Canvas canvas, Size size) {
    _drawBar(canvas, size);

    _drawFloatingCircle(canvas, shader);
  }

  @override
  bool shouldRepaint(BottomBarPainter oldDelegate) {
    return position != oldDelegate.position || color != oldDelegate.color;
  }

  /// draw bottom bar

  void _drawBar(Canvas canvas, Size size) {
    final double left = kMargin;

    final double right = size.width - kMargin;

    final double top = kMargin;

    final double bottom = top + kHeight;

    final path = Path()
      ..moveTo(left + kTopRadius, top)
      ..lineTo(position - kTopRadius, top)
      ..relativeArcToPoint(
        Offset(kTopRadius, kTopRadius),

        radius: Radius.circular(kTopRadius),
      )
      ..relativeArcToPoint(
        const Offset((kCircleRadius + kCircleMargin) * 2, 0.0),

        radius: const Radius.circular(kCircleRadius + kCircleMargin),

        clockwise: false,
      )
      ..relativeArcToPoint(
        Offset(kTopRadius, -kTopRadius),

        radius: Radius.circular(kTopRadius),
      )
      ..lineTo(right - kTopRadius, top)
      ..relativeArcToPoint(
        Offset(kTopRadius, kTopRadius),

        radius: Radius.circular(kTopRadius),
      )
      ..lineTo(right, bottom - kBottomRadius)
      ..relativeArcToPoint(
        Offset(-kBottomRadius, kBottomRadius),

        radius: Radius.circular(kBottomRadius),
      )
      ..lineTo(left + kBottomRadius, bottom)
      ..relativeArcToPoint(
        Offset(-kBottomRadius, -kBottomRadius),

        radius: Radius.circular(kBottomRadius),
      )
      ..lineTo(left, top + kTopRadius)
      ..relativeArcToPoint(
        Offset(kTopRadius, -kTopRadius),

        radius: Radius.circular(kTopRadius),
      );

    if (showShadow) {
      canvas.drawShadow(path, _shadowColor, shadowElevation ?? 5, true);
    }

    canvas.drawPath(path, _paint);
  }

  /// Function used to draw the circular indicator

  void _drawFloatingCircle(Canvas canvas, Shader? shader) {
    final path = Path()
      ..addArc(
        Rect.fromCircle(
          center: Offset(
            position + kCircleMargin + kCircleRadius,

            kMargin + kCircleMargin,
          ),

          radius: kCircleRadius,
        ),

        0,

        kPi * 2,
      );

    if (showShadow) {
      canvas.drawShadow(path, _shadowColor, shadowElevation ?? 5.0, true);
    }

    shader != null
        ? canvas.drawPath(path, _notchPaint..shader = shader)
        : canvas.drawPath(path, _notchPaint);
  }
}

/// Class to generate the NotchBottomBar

class CustomNavigationBottomBar extends StatefulWidget {
  /// Controller for animation

  final NotchBottomBarController notchBottomBarController;

  /// List of items of bottom bar

  final List<BottomBarItem> bottomBarItems;

  /// Function called when an item was tapped

  final ValueChanged<int> onTap;

  /// Color of bottom bar

  final Color color;

  /// Boolean to show shadow

  final bool showShadow;

  /// Boolean to show bottom text

  final bool showLabel;

  /// TextStyle to show bottom text

  final TextStyle? itemLabelStyle;

  ///Boolean to show blur effect

  final bool showBlurBottomBar;

  ///Opacity

  final double blurOpacity;

  /// Filter X

  final double blurFilterX;

  /// Filter Y

  final double blurFilterY;

  /// Color of bottom bar

  final Color notchColor;

  final Shader? notchShader;

  final double? shadowElevation;

  final double kIconSize;

  final double kBottomRadius;

  /// set the maxLine of item label

  final int? maxLine;

  /// to handle the overflow of the item label

  final TextOverflow? textOverflow;

  /// textAlign to align the label text

  final TextAlign? textAlign;

  /// set the textDirection of item label

  final TextDirection? textDirection;

  /// Duration in milliseconds for animation

  final int durationInMilliSeconds;

  /// bottom bar width for web and desktop apps (It should be greater then 500 otherwise it will take media query width)

  final double bottomBarWidth;

  /// Hide side and bottom margins of bottom navigation bar

  final bool removeMargins;

  /// bottom bar height can be modify

  final double bottomBarHeight;

  /// elevation

  final double elevation;

  /// set bottom radius

  final bool showBottomRadius;

  /// set top radius

  final bool showTopRadius;

  /// add any gradient color to the notch

  final Gradient? notchGradient;

  /// set margin between notch and circle

  final double circleMargin;

  /// set top margin

  final double topMargin;

  const CustomNavigationBottomBar({
    super.key,

    required this.notchBottomBarController,

    required this.bottomBarItems,

    required this.onTap,

    required this.kIconSize,

    this.color = Colors.white,

    this.itemLabelStyle,

    this.shadowElevation,

    this.showShadow = true,

    this.showLabel = true,

    required this.kBottomRadius,

    this.notchShader,

    this.showBlurBottomBar = false,

    this.blurOpacity = 0.5,

    this.blurFilterX = 5.0,

    this.blurFilterY = 10.0,

    this.notchColor = Colors.white,

    this.durationInMilliSeconds = 300,

    this.bottomBarWidth = 500,

    this.removeMargins = false,

    this.bottomBarHeight = 62.0,

    this.elevation = 5.0,

    this.showBottomRadius = true,

    this.showTopRadius = true,

    this.notchGradient,

    this.maxLine,

    this.textOverflow,

    this.textAlign,

    this.textDirection,

    this.topMargin = 10.0,

    this.circleMargin = 8.0,
  });

  @override
  _CustomNavigationBottomBarState createState() =>
      _CustomNavigationBottomBarState();
}

class _CustomNavigationBottomBarState extends State<CustomNavigationBottomBar>
    with SingleTickerProviderStateMixin {
  late double _screenWidth;

  int maxCount = 5;

  int currentIndex = 0;

  late final AnimationController _animationController;

  bool _isInitial = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenWidth = MediaQuery.of(context).size.width <= 500
        ? MediaQuery.of(context).size.width
        : widget.bottomBarWidth;
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.durationInMilliSeconds),
    );

    kHeight = (widget.bottomBarHeight >= kBottomNavigationBarHeight)
        ? widget.removeMargins
              ? widget.bottomBarHeight + 10.0
              : widget.bottomBarHeight
        : widget.removeMargins
        ? kHeight + 10
        : kHeight;

    kTopRadius = widget.showTopRadius ? kTopRadius : 0;

    kBottomRadius = widget.showBottomRadius ? kBottomRadius : 0;

    kMargin = widget.removeMargins ? 0 : 14.0;

    widget.notchBottomBarController.addListener(() {
      _animationController.reset();

      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// throws exception if list length is more then 5

    if (widget.bottomBarItems.length > 5) {
      throw Exception(' Bottom bar item length should not be more than 5');
    }

    /// uncomment

    if (widget.notchBottomBarController.index >
        widget.bottomBarItems.length - 1) {
      throw Exception(
        ' Initial page index cannot be higher than bottom bar items length',
      );
    }

    final double height = kHeight + kMargin * 2;

    return widget.bottomBarItems.length > maxCount
        ? SizedBox.shrink()
        : AnimatedBuilder(
            animation: _animationController,

            builder: (BuildContext _, Widget? __) {
              ///to set any initial page

              double scrollPosition = widget.notchBottomBarController.index
                  .toDouble();

              int? currentIndex = widget.notchBottomBarController.index;

              if (widget.notchBottomBarController.oldIndex != null) {
                _isInitial = false;

                scrollPosition =
                    Tween<double>(
                      begin: widget.notchBottomBarController.oldIndex!
                          .toDouble(),

                      end: widget.notchBottomBarController.index.toDouble(),
                    )
                    // ignore: invalid_use_of_protected_member
                    .lerp(_animationController.value);

                currentIndex = widget.notchBottomBarController.index;
              } else {
                scrollPosition = widget.notchBottomBarController.index
                    .toDouble();

                currentIndex = widget.notchBottomBarController.index;
              }

              return ClipRRect(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: widget.removeMargins ? 22.0 : 8.0,
                  ),

                  child: Stack(
                    clipBehavior: Clip.none,

                    children: <Widget>[
                      BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: widget.showBlurBottomBar
                              ? widget.blurFilterX
                              : 0.0,

                          sigmaY: widget.showBlurBottomBar
                              ? widget.blurFilterY
                              : 0.0,
                        ),

                        child: Opacity(
                          opacity: widget.showBlurBottomBar
                              ? widget.blurOpacity
                              : 1,

                          child: CustomPaint(
                            size: Size(_screenWidth, height),

                            painter: BottomBarPainter(
                              position: _itemPosByScrollPosition(
                                scrollPosition,
                              ),

                              color: widget.color,

                              showShadow: widget.showShadow,

                              notchColor: widget.notchColor,

                              shader: widget.notchShader,

                              shadowElevation: widget.shadowElevation,

                              kBottomRadius: widget.kBottomRadius,

                              gradient: widget.notchGradient,

                              elevation: widget.elevation,
                            ),
                          ),
                        ),
                      ),

                      for (
                        var i = 0;
                        i < widget.bottomBarItems.length;
                        i++
                      ) ...[
                        if (i == currentIndex &&
                            (_animationController.value == 1.0 || _isInitial))
                          Positioned(
                            top: widget.removeMargins
                                ? -widget.circleMargin / 2
                                : widget.topMargin,

                            left:
                                kCircleRadius -
                                widget.topMargin / 2 +
                                _itemPosByScrollPosition(scrollPosition) +
                                2,

                            child: BottomBarActiveItem(
                              i,

                              itemWidget: widget.bottomBarItems[i].activeItem,

                              scrollPosition: scrollPosition,

                              onTap: widget.onTap,

                              kIconSize: widget.kIconSize,
                            ),
                          ),

                        if (i != currentIndex)
                          Positioned(
                            top: kMargin + (kHeight - kCircleRadius * 2) / 2,

                            left: widget.circleMargin + _itemPosByIndex(i),

                            child: BottomBarInActiveItem(
                              i,

                              textOverflow: widget.textOverflow,

                              textDirection: widget.textDirection,

                              textAlign: widget.textAlign,

                              maxLine: widget.maxLine,

                              itemWidget: widget.bottomBarItems[i].inActiveItem,

                              labelWidget:
                                  widget.bottomBarItems[i].itemLabelWidget,

                              label: widget.bottomBarItems[i].itemLabel,

                              onTap: (selectedIndex) {
                                widget.notchBottomBarController.jumpTo(
                                  selectedIndex,
                                );

                                widget.onTap.call(selectedIndex);
                              },

                              showLabel: widget.showLabel,

                              labelStyle: widget.itemLabelStyle,

                              kIconSize: widget.kIconSize,
                            ),
                          ),
                      ],
                    ],
                  ),
                ),
              );
            },
          );
  }

  double _firstItemPosition(double spaceParameter) {
    return (_screenWidth - kMargin * 2) * spaceParameter;
  }

  double _lastItemPosition(double spaceParameter) {
    return _screenWidth -
        (_screenWidth - kMargin * 2) * spaceParameter -
        (kCircleRadius + widget.circleMargin) * 2;
  }

  double _itemDistance() {
    return (_lastItemPosition(widget.removeMargins ? 0.05 : 0.1) -
            _firstItemPosition(widget.removeMargins ? 0.05 : 0.1)) /
        (widget.bottomBarItems.length - 1);
  }

  double _itemPosByScrollPosition(double scrollPosition) {
    return _firstItemPosition(widget.removeMargins ? 0.05 : 0.1) +
        _itemDistance() * scrollPosition;
  }

  double _itemPosByIndex(int index) {
    return _firstItemPosition(widget.removeMargins ? 0.05 : 0.1) +
        _itemDistance() * index;
  }
}

class NotchBottomBarController extends ChangeNotifier {
  int index;

  int? oldIndex;

  NotchBottomBarController({this.index = 0});

  jumpTo(int index) {
    oldIndex = this.index;

    this.index = index;

    notifyListeners();
  }
}
