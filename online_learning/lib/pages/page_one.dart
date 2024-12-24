import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final List<Map<String, String>> pages = [
    {
      "image": "assets/images/img1.png",
      "title": "Numerous free trial courses",
      "subtitle": "Free courses for you to find your way to learning"
    },
    {
      "image": "assets/images/img2.png",
      "title": "Quick and easy learning",
      "subtitle": "Learn with fun and interactive methods"
    },
    {
      "image": "assets/images/img3.png",
      "title": "Join a community of learners",
      "subtitle": "Connect with peers from around the world"
    },
  ];

  final PageController _controller = PageController();
  bool _isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SafeArea(
          child: Stack(
            children: [
              // PageView
              PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _isLastPage = (index == pages.length - 1);
                  });
                },
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image Section
                      Image.asset(
                        page['image']!,
                        width: 300,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 25),

                      // Title
                      Text(
                        page['title']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Subtitle
                      Text(
                        page['subtitle']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(133, 133, 151, 1),
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Buttons
                      if (_isLastPage)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Sign Up Button
                              GestureDetector(
                                onTap: () {
                                  // TODO: Navigate to Sign Up
                                },
                                child: Container(
                                  height: 60,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    color: Colors.indigoAccent[200],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Log In Button
                              GestureDetector(
                                onTap: () {
                                  // TODO: Navigate to Log In
                                },
                                child: Container(
                                  height: 60,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.indigoAccent,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Log in",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.indigoAccent[200],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  );
                },
              ),

              // Skip/At Start Button
              Positioned(
                top: 10,
                right: 20,
                child: TextButton(
                  onPressed: () {
                    if (_isLastPage) {
                      _controller.jumpToPage(0);
                    } else {
                      _controller.jumpToPage(pages.length - 1);
                    }
                  },
                  child: Text(
                    _isLastPage ? "At Start" : "Skip",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(133, 133, 151, 1),
                    ),
                  ),
                ),
              ),

              // Smooth Page Indicator
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: pages.length,
                    effect: const WormEffect(
                      dotHeight: 7,
                      dotWidth: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
