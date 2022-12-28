import 'package:flutter/material.dart';
import 'package:intro_ui/pages/home_page.dart';
import 'package:intro_ui/utils/strings.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            controller: _controller,
            children: [
              page(
                  imgPath: 'assets/images/image_1.png',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent),
              page(
                  imgPath: 'assets/images/image_2.png',
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent),
              page(
                  imgPath: 'assets/images/image_3.png',
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent),
            ],
          ),
          _currentIndex == 2
              ? Positioned(
                  right: 10,
                  bottom: 60,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, HomePage.routeName);
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  ),
                )
              : Container(),
          Positioned(
            bottom: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicator(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> widgets = [];
    for (int i = 0; i < 3; i++) {
      if (_currentIndex == i) {
        widgets.add(_indicator(true));
      } else {
        widgets.add(_indicator(false));
      }
    }
    return widgets;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isActive ? 30 : 6,
      height: 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.red,
      ),
    );
  }

  Widget page({
    required String imgPath,
    required String title,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            content,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Image.asset(imgPath),
        ],
      ),
    );
  }
}
