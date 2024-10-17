import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/utils/app_colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  int currentPage = 0;

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  List<OnbordingData> imagePaths = [
    OnbordingData(
      'lib/ui/assets/images/primeira_planta.png',
      'Best collection of\n',
      'indoor & outdoor ',
      'Lorem ipsom dolor sit amet, consectetur\n adipscing elit. Fringillain sed risus sit.',
    ),
    OnbordingData(
      'lib/ui/assets/images/segunda_planta.png',
      'Keep your\n plants ',
      'alive',
      'Lorem ipsom dolor sit amet, consectetur\n adipscing elit. Fringillain sed risus sit.',
    ),
    OnbordingData(
      'lib/ui/assets/images/terceira_planta.png',
      'Plan a tree & \n green the ',
      'earth',
      'Lorem ipsom dolor sit amet, consectetur\n adipscing elit. Fringillain sed risus sit.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            color: Colors.white,
            child: PageView.builder(
              onPageChanged: onPageChanged,
              controller: _pageController,
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        imagePaths[index].image,
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: 295,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: imagePaths[index].titleBlack,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                TextSpan(
                                  text: imagePaths[index].titleGreen,
                                  style: const TextStyle(
                                    color: AppColors.primaryGreenColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                textAlign: TextAlign.center,
                                imagePaths[index].description,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: const WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Colors,
              dotColor: AppColors.secondaryTextColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: currentPage == 2
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: AppColors.primaryGreenColor,
                        fixedSize: const Size(335, 56)),
                    onPressed: () {},
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            fixedSize: const Size(138, 56)),
                        onPressed: () {},
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: AppColors.primaryGreenColor,
                            fixedSize: const Size(138, 56)),
                        onPressed: () {},
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
          )
        ],
      ),
    );
  }
}

class OnbordingData {
  final String image;
  final String titleBlack;
  final String titleGreen;
  final String description;

  OnbordingData(this.image, this.titleBlack, this.titleGreen, this.description);
}
