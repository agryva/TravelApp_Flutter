import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int pageCount;

  PageIndicator(this.currentIndex, this.pageCount);

  _indicator(bool isActive) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Container(
        width: 40,
        height: 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isActive ? Color(0xff03A4DC).withOpacity(0.7) : Colors.grey.withAlpha(150),
            shape: BoxShape.rectangle),
      ),
    );
  }

  _buildPageIndicators() {
    List<Widget> indicatorList = [];
    for (int i = 0; i < pageCount; i++) {
      indicatorList
          .add(i == currentIndex ? _indicator(true) : _indicator(false));
    }
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildPageIndicators(),
    );
  }
}
