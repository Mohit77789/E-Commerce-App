import 'package:flutter/material.dart';

class ConfirmationSlider extends StatefulWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final Color backgroundColorEnd;
  final Color foregroundColor;
  final Color iconColor;
  final IconData icon;
  final String text;
  final TextStyle textStyle;
  final VoidCallback onConfirmation;
  final BorderRadius foregroundShape;
  final BorderRadius backgroundShape;

  const ConfirmationSlider(
      {Key? key,
      this.height = 90,
      this.width = 390,
      required this.backgroundColor,
      required this.backgroundColorEnd,
      required this.foregroundColor,
      this.iconColor = Colors.white,
      this.icon = Icons.chevron_right,
      required this.text,
      required this.textStyle,
      required this.onConfirmation,
      required this.foregroundShape,
      required this.backgroundShape})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ConfirmationSliderState();
  }
}

class ConfirmationSliderState extends State<ConfirmationSlider> {
  double _position = 0;
  int _duration = 0;

  double getPosition() {
    if (_position < 0) {
      return 0;
    } else if (_position > widget.width - widget.height) {
      return widget.width - widget.height;
    } else {
      return _position;
    }
  }

  void updatePosition(details) {
    if (details is DragEndDetails) {
      setState(() {
        _duration = 600;
        _position = 0;
      });
    } else if (details is DragUpdateDetails) {
      setState(() {
        _duration = 0;
        _position = details.localPosition.dx - (widget.height / 2);
      });
    }
  }

  void sliderReleased(details) {
    if (_position > widget.width - widget.height) {
      widget.onConfirmation();
    }
    updatePosition(details);
  }

  Color calculateBackground() {
    double percent;

    // calculates the percentage of the position of the slider
    if (_position > widget.width - widget.height) {
      percent = 1.0;
    } else if (_position / (widget.width - widget.height) > 0) {
      percent = _position / (widget.width - widget.height);
    } else {
      percent = 0.0;
    }

    int red = widget.backgroundColorEnd.red;
    int green = widget.backgroundColorEnd.green;
    int blue = widget.backgroundColorEnd.blue;

    return Color.alphaBlend(
        Color.fromRGBO(red, green, blue, percent), widget.backgroundColor);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    style = widget.textStyle;

    return Padding(
      padding: const EdgeInsets.only(top: 660, bottom: 60, left: 10, right: 10),
      child: AnimatedContainer(
        duration: Duration(milliseconds: _duration),
        curve: Curves.ease,
        height: widget.height,
        width: widget.width,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(widget.height)),
          color: widget.backgroundColor,
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Text(
                widget.text,
                style: style,
              ),
            ),
            Positioned(
              left: widget.height / 2,
              child: AnimatedContainer(
                height: widget.height - 10,
                width: getPosition(),
                duration: Duration(milliseconds: _duration),
                curve: Curves.ease,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.height)),
                  color: widget.backgroundColor,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: _duration),
              curve: Curves.bounceOut,
              left: getPosition(),
              top: 0,
              child: GestureDetector(
                onPanUpdate: (details) => updatePosition(details),
                onPanEnd: (details) => sliderReleased(details),
                child: Container(
                  height: widget.height - 10,
                  width: widget.height - 10,
                  decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Colors.white),
                    borderRadius:
                        BorderRadius.all(Radius.circular(widget.height / 2)),
                    color: widget.foregroundColor,
                  ),
                  child: Icon(
                    widget.icon,
                    color: widget.iconColor,
                    size: widget.height * 0.75,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
