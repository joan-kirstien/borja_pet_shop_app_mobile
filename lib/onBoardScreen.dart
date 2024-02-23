import 'package:flutter/material.dart';
import 'package:flutter1_pet_shop_app_borja/colors.dart';
import 'package:flutter1_pet_shop_app_borja/homescreen/homescreen.dart';
import 'data.dart';
import 'style.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int currentIndex = 0;

  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  _onPageChanged(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const SizedBox(
                  height: 500,
                  child: Image(
                    image: AssetImage('assets/images/samoyed.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
                //paw print logo supposed to be here (must not be included)
              ],
            ),
          ),
          //const DotIndicator(true),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < onBoardDataList.length; i++)
                if (currentIndex == i)
                  const DotIndicator(true)
                else
                  const DotIndicator(false)
            ],
          ),
          Expanded(
            flex: 2,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: onBoardDataList.length,
              itemBuilder: (context, index) => OnBoardPageCard(
                title: onBoardDataList[index]['title'],
                subTitle: onBoardDataList[index]['subtitle'],
              ),
            ),
          ),
          //kani nakapa next sa get started
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Palette().pYellowOrageColor,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0), //140
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  final bool isActive;

  const DotIndicator(this.isActive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 21,
      margin: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: isActive ? Palette().pYellowOrangeShadeColor : Colors.white,
        border: Border.all(
          color: isActive
              ? Palette().pYellowOrangeShadeColor
              : Colors.grey.shade400,
          width: 0,
        ),
      ),
    );
  }
}

class OnBoardPageCard extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const OnBoardPageCard({this.title, this.subTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        Text(
          title.toString(),
          textAlign: TextAlign.center,
          style: onBoardHeadingTitle,
        ),
        const SizedBox(height: 20.0),
        Text(
          subTitle.toString(),
          textAlign: TextAlign.center,
          style: onBoardHeadingSubtitle,
        )
      ],
    );
  }
}
