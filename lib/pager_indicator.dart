import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_chanllenge_material_page_reveal/pages.dart';

class PagerIndicator extends StatelessWidget {

final PagerIndicatorViewModel viewModel;

  const PagerIndicator({Key key, this.viewModel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return   Column(
            children: [
              new Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                              PageBubble(viewModel: PageBubbleViewModel('assets/banks.png', Colors.green,  false, 0.0),),
                              PageBubble(viewModel: PageBubbleViewModel('assets/shopping_cart.png', Colors.green,  false, 0.7),),
                              PageBubble(viewModel: PageBubbleViewModel('assets/shopping_cart.png', Colors.green,  true, 0.0),),
                ],
              )
            ],
          );
  }
}


class PageBubble  extends StatelessWidget {
final PageBubbleViewModel viewModel;

  const PageBubble({Key key, this.viewModel}) : super(key: key);
 @override
  Widget build(BuildContext context) {
    return new Container(
      width: 55.0,
      height: 65.0,
      child: new Center(
        child: new Container (
          width: lerpDouble(20.0, 45.0, viewModel.activePercent),
          height: lerpDouble(20.0, 45.0, viewModel.activePercent),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: viewModel.isHollow
                ? const Color(0x88FFFFFF).withAlpha((0x88 * viewModel.activePercent).round())
                : const Color(0x88FFFFFF),
            border: new Border.all(
              color: viewModel.isHollow
                  ? const Color(0x88FFFFFF).withAlpha((0x88 * (1.0 - viewModel.activePercent)).round())
                  : Colors.transparent,
              width: 3.0,
            ),
          ),
          child: new Opacity(
            opacity: viewModel.activePercent,
            child: new Image.asset(
              viewModel.iconAssetPath,
              color: viewModel.color,
            ),
          ),
        ),
      ),
    );
  }
}

enum SlideDirection {
  leftToRight,
  rightToLeft,
  none,
}


class PagerIndicatorViewModel {
  final List<PageViewModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidePercent;

  PagerIndicatorViewModel(
    this.pages,
    this.activeIndex,
    this.slideDirection,
    this.slidePercent,
  );
}


class PageBubbleViewModel {
  final String iconAssetPath;
  final Color color;
  final bool isHollow;
  final double activePercent;

  PageBubbleViewModel(
    this.iconAssetPath,
    this.color,
    this.isHollow,
    this.activePercent,
  );
}