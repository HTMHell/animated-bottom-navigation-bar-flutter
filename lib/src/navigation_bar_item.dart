import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/src/bubble_selection_painter.dart';

class NavigationBarItem extends StatelessWidget {
  final GlobalKey keyRef;
  final bool isActive;
  final double bubbleRadius;
  final double maxBubbleRadius;
  final Color bubbleColor;
  final Color activeColor;
  final Color inactiveColor;
  final IconData iconData;
  final String label;
  final double iconScale;
  final double iconSize;
  final double labelSize;
  final bool showLabel;
  final VoidCallback onTap;

  NavigationBarItem({
    this.keyRef,
    this.isActive,
    this.bubbleRadius,
    this.maxBubbleRadius,
    this.bubbleColor,
    this.activeColor,
    this.inactiveColor,
    this.iconData,
    this.label,
    this.iconScale,
    this.iconSize,
    this.labelSize,
    this.showLabel,
    this.onTap,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        key: keyRef,
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: BubblePainter(
            bubbleRadius: isActive ? bubbleRadius : 0,
            bubbleColor: bubbleColor,
            maxBubbleRadius: maxBubbleRadius,
          ),
          child: InkWell(
            child: Transform.scale(
              scale: isActive ? iconScale : 1,
              child: label != null && showLabel
                  ? Padding(
                    padding: EdgeInsets.only(top: labelSize),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            iconData,
                            color: isActive ? activeColor : inactiveColor,
                            size: iconSize,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              label,
                              style: TextStyle(
                                color: isActive ? activeColor : inactiveColor,
                                fontSize: labelSize,
                              ),
                            ),
                          ),
                        ],
                      ),
                  )
                  : Icon(
                      iconData,
                      color: isActive ? activeColor : inactiveColor,
                      size: iconSize,
                    ),
            ),
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}

class GapItem extends StatelessWidget {
  final double width;

  GapItem({this.width});

  @override
  Widget build(BuildContext context) => Container(width: width);
}
