import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_wallpaper_company/features/home/presentation/screen/home_screen.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  final GlobalKey searchKey = GlobalKey();
  final GlobalKey langKey = GlobalKey();
  final GlobalKey themeKey = GlobalKey();
  final GlobalKey categoryKey = GlobalKey();
  final GlobalKey favKey = GlobalKey();

  List<TargetFocus> targets = [];
  TutorialCoachMark? tutorial;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => checkTutorial());
  }

  // Check if tutorial was already shown
  Future<void> checkTutorial() async {
    final prefs = await SharedPreferences.getInstance();
    bool isTutorialShown = prefs.getBool('tutorial_shown') ?? false;

    if (!isTutorialShown) {
      showTutorial();
      // Save that tutorial has been shown
      await prefs.setBool('tutorial_shown', true);
    } else {
      // Navigate directly to home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  void showTutorial() {
    Widget buildText(String text) {
      return Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    targets = [
      TargetFocus(
        identify: "Search",
        keyTarget: searchKey,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: buildText("Search wallpapers easily here 🔍"),
          ),
        ],
      ),
      TargetFocus(
        identify: "Language",
        keyTarget: langKey,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: buildText("Switch between different languages 🌍"),
          ),
        ],
      ),
      TargetFocus(
        identify: "Theme",
        keyTarget: themeKey,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: buildText("Toggle between Light and Dark mode 🌗"),
          ),
        ],
      ),
      TargetFocus(
        identify: "Category",
        keyTarget: categoryKey,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: buildText("Browse wallpapers by category 🎨"),
          ),
        ],
      ),
      TargetFocus(
        identify: "Favorites",
        keyTarget: favKey,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildText("Access your favorite wallpapers here ❤️"),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    tutorial?.finish();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                  ),
                  child: const Text(
                    "Done",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ];

    tutorial = TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black.withOpacity(0.7),
      paddingFocus: 8,
      opacityShadow: 0.8,
      skipWidget: Positioned(
        top: 50,
        left: 20,
        child: GestureDetector(
          onTap: () {
            tutorial?.finish();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Text(
              "SKIP",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
      onFinish: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      },
      onClickTarget: (target) {},
    );

    tutorial?.show(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: Container(
                key: searchKey,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.search, color: Colors.black54),
                    SizedBox(width: 8),
                    Text(
                      'Search wallpapers...',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              key: langKey,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'EN',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              key: themeKey,
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.wb_sunny, color: Colors.black54),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      key: categoryKey,
                      height: 80,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (_, __) =>
                            const SizedBox(width: 12),
                        itemBuilder: (context, index) => Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: 12,
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  key: favKey,
                  width: 220,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home, color: Colors.black54),
                          SizedBox(height: 4),
                          Text('Home',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12)),
                        ],
                      ),
                      Container(
                        width: 1,
                        height: 36,
                        color: Colors.grey[400],
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite_border, color: Colors.black54),
                          SizedBox(height: 4),
                          Text('Favorites',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
