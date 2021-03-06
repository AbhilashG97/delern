import 'package:delern_flutter/flutter/styles.dart';
import 'package:delern_flutter/views/helpers/non_scrolling_markdown.dart';
import 'package:flutter/material.dart';

class CardDisplayWidget extends StatelessWidget {
  final String front;
  final String back;
  final bool showBack;
  final Color backgroundColor;
  final bool isMarkdown;

  const CardDisplayWidget(
      {@required this.front,
      @required this.back,
      @required this.showBack,
      @required this.backgroundColor,
      @required this.isMarkdown});

  @override
  Widget build(BuildContext context) => Card(
        color: backgroundColor,
        margin: const EdgeInsets.all(8.0),
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: _buildCardBody(context),
        ),
      );

  List<Widget> _buildCardBody(BuildContext context) {
    var widgetList = [
      _sideText(front, context),
    ];

    if (showBack) {
      widgetList
        ..add(const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Divider(
            height: 1.0,
          ),
        ))
        ..add(_sideText(back, context));
    }

    return widgetList;
  }

  Widget _sideText(String text, BuildContext context) {
    if (isMarkdown) {
      return buildNonScrollingMarkdown(text, context);
    }
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppStyles.primaryText,
    );
  }
}
