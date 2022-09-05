import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:project_ui_intro_screen/models/item_model.dart';
import 'package:project_ui_intro_screen/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  Widget animation(
    int index,
    int delay,
    Widget child,
  ) {
    if (index == 1) {
      return FadeInDown(
          delay: Duration(
            milliseconds: delay,
          ),
          child: child);
    }
    return FadeInUp(
        delay: Duration(
          milliseconds: delay,
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              ///-----------------------------------------
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: listOfItems.length,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (newVal) {
                    setState(() {
                      currentIndex = newVal;
                    });
                  },
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: size.width,
                      height: size.height,
                      child: Column(
                        children: [
                          //IMG
                          Container(
                            margin: const EdgeInsets.fromLTRB(
                              15,
                              40,
                              15,
                              10,
                            ),
                            width: size.width,
                            height: size.height / 2.5,
                            child: animation(index, 300,
                                Image.asset(listOfItems[index].img)),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              bottom: 15,
                            ),
                            child: animation(
                              index,
                              500,
                              Text(
                                listOfItems[index].title,
                                textAlign: TextAlign.center,
                                style: textTheme.headline1,
                              ),
                            ),
                          ),

                          animation(
                            index,
                            100,
                            Text(
                              listOfItems[index].subTitle,
                              textAlign: TextAlign.center,
                              style: textTheme.headline2,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              ///-----------------------------------------
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      effect: const ExpandingDotsEffect(
                        spacing: 6.0,
                        radius: 10,
                        dotWidth: 10,
                        dotHeight: 10,
                        expansionFactor: 3.9,
                        dotColor: Colors.grey,
                        activeDotColor: MyColors.btnColor,
                      ),
                      count: listOfItems.length,
                      controller: pageController,
                      onDotClicked: (newVal) {
                        setState(() {
                          currentIndex = newVal;
                          pageController.animateToPage(newVal,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        });
                      },
                    ),

                    //=================
                    currentIndex == 2
                        ? GetStartBtn(size: size, textTheme: textTheme)
                        : SkipBTN(
                            size: size,
                            textTheme: textTheme,
                            onTap: () {
                              setState(() {
                                pageController.animateToPage(2,
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.fastOutSlowIn);
                              });
                            },
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
