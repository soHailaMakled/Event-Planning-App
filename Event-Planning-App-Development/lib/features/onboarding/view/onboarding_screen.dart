import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<List<String>> _pagesImages = [
    [
      "assets/images/pic1.png",
      "assets/images/pic2.png",
      "assets/images/pic3.png",
      "assets/images/pic4.png",
      "assets/images/pic5.png",
      "assets/images/pic6.png",
    ],
    [
      "assets/images/pic7.png",
      "assets/images/pic8.png",
      "assets/images/pic9.png",
      "assets/images/pic10.png",
      "assets/images/pic11.png",
      "assets/images/pic12.png",
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// PageView
            Expanded(
              flex: 2,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: _pagesImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      children: _pagesImages[index]
                          .map((path) => _buildImage(path))
                          .toList(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            /// العنوان
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Find your favourite events here",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF25131A),
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// الوصف
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "The customer is very important, the customer will be followed by the customer.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pagesImages.length,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 28 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.grey : Colors.black26,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            /// زرار Next
            SizedBox(
              width: 246,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 6,
                  shadowColor: const Color.fromRGBO(111, 126, 201, 0.25),
                ),
                onPressed: () {
                  if (_currentPage < _pagesImages.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    // هنا توديه للصفحة الرئيسية أو Login
                  }
                },
                child: Text(
                  _currentPage == _pagesImages.length - 1 ? "Get Started" : "Next",
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFEEEEEE),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        path,
        fit: BoxFit.cover,
      ),
    );
  }
}
