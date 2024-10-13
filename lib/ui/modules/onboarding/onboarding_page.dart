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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            color: Colors.white,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
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
                  )
                ];

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
              activeDotColor: Colors.green,
              dotColor: Color.fromARGB(255, 169, 182, 192),
            ),
          ),
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
