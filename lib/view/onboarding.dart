import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelapp/config/application.dart';
import 'package:travelapp/config/routes.dart';
import 'package:travelapp/custom/pageIndicator.dart';
import 'package:travelapp/data/OnBoardingModel.dart';

class OnBoardingWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OnBoardingState();
  }
}

class _OnBoardingState extends State<OnBoardingWidget> {
  PageController _controller;
  int currentPage = 0;

  @override
  void initState() {
    _controller = PageController(initialPage: currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomPaint(
          painter: DrawCircleCustom(),
          child: Stack(
            children: <Widget>[
              PageView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: pageBoarding.length,
                pageSnapping: true,
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Stack(
                    fit: StackFit.passthrough,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SvgPicture.asset(
                              pageBoarding[index].imageUrl,
                              fit: BoxFit.contain,
                              height: 400,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              pageBoarding[index].title,
                              style: TextStyle(
                                  fontFamily: "font-light",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 28,
                                  letterSpacing: 1),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              pageBoarding[index].body,
                              style: TextStyle(
                                  fontFamily: "font-heavy",
                                  fontSize: 17,
                                  wordSpacing: 1,
                                  color: Colors.black38),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            PageIndicator(currentPage, pageBoarding.length)
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              Positioned(
                bottom: 10,
                right: 0,
                left: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    if (currentPage < pageBoarding.length - 1)
                      Column(
                        children: <Widget>[
                          Container(
                            child: CupertinoButton(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    color: Color(0xff03A4DC).withAlpha(200),
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 2,
                                    letterSpacing: 0.7),
                              ),
                              onPressed: () {
                                if (currentPage < pageBoarding.length - 1) {
                                  currentPage++;
                                  _controller.animateToPage(currentPage,
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.easeIn);
                                } else {
                                  print("ini SKIP");
                                }
                              },
                              color: Color(0xff03A4DC).withAlpha(80),
                              borderRadius: BorderRadius.circular(80),
                            ),
                            margin: EdgeInsets.only(left: 80, right: 80),
                          ),
                          CupertinoButton(
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                  color: Color(0xff03A4DC).withOpacity(0.8)),
                            ),
                            onPressed: () {
                              currentPage = pageBoarding.length;
                              _controller.animateToPage(currentPage,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeInExpo);
                            },
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ],
                      )
                    else
                      Column(
                        children: <Widget>[
                          Container(
                            child: CupertinoButton(
                              child: Text(
                                "Get Started",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 2,
                                    letterSpacing: 0.7),
                              ),
                              onPressed: () {
                                Application.router.navigateTo(
                                    context, Routes.dashboard,
                                    clearStack: false);
                              },
                              color: Color(0xff03A4DC),
                              borderRadius: BorderRadius.circular(80),
                            ),
                            margin: EdgeInsets.only(left: 80, right: 80),
                          ),
                          SizedBox(height: 40,),
                        ],
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DrawCircleCustom extends CustomPainter {
  Paint _paint;

  DrawCircleCustom() {
    _paint = Paint()
      ..color = Color(0xffd1d1d1).withAlpha(70)
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(size.bottomRight(Offset(0.0, 0.0)), 100.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
