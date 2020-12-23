import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String label;
  final String info;
  final double radius;
  final double fontSize;
  final Color color;
  final double margin;
  final bool shadow;
  final Icon icon;
  final Function onTap;
  const InfoCard({
    @required this.label,
    this.info,
    this.radius = 12,
    this.fontSize = 24,
    this.color = Colors.teal,
    this.margin = 8,
    this.shadow = false,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return onTap == null
        ? _Card(
            color: color,
            shadow: shadow,
            radius: radius,
            label: label,
            margin: margin,
            fontSize: fontSize,
            info: info,
            icon: icon,
          )
        : InkWell(
            child: _Card(
              color: color,
              shadow: shadow,
              radius: radius,
              label: label,
              margin: margin,
              fontSize: fontSize,
              info: info,
              icon: icon,
            ),
            onTap: onTap,
          );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key key,
    @required this.color,
    @required this.shadow,
    @required this.radius,
    @required this.label,
    @required this.margin,
    @required this.fontSize,
    @required this.info,
    @required this.icon,
  }) : super(key: key);

  final Color color;
  final bool shadow;
  final double radius;
  final String label;
  final double margin;
  final double fontSize;
  final String info;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        boxShadow: shadow != false
            ? [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ]
            : null,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              label == null
                  ? SizedBox.shrink()
                  : Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(margin),
                      child: Text(
                        label,
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              info == null
                  ? SizedBox.shrink()
                  : Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(margin),
                      child: Text(
                        info,
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ],
          ),
          icon == null
              ? SizedBox.shrink()
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: icon,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}