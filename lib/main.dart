import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:the_wallpaper_company/core/constants.dart';
import 'package:the_wallpaper_company/features/favorite/provider/favorite_provider.dart';
import 'package:the_wallpaper_company/features/home/models/wallpaper_model.dart';
import 'package:the_wallpaper_company/features/home/presentation/screen/home_screen.dart';
import 'package:the_wallpaper_company/features/home/presentation/screen/wallpaper_detail_screen.dart';
import 'package:the_wallpaper_company/features/home/provider/wallpaper_provider.dart';

import 'package:the_wallpaper_company/firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WallpaperProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()..init()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  @override
  void initState() {
    super.initState();
    _initRemoteConfig();
    // Handle notification tap when app is launched from terminated state
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final initialMessage = await FirebaseMessaging.instance
          .getInitialMessage();
      if (initialMessage != null) {
        // Use the same logic as _handleBackgroundMessage
        final data = initialMessage.data;
        final wallpaperId = data['id'];
        final imageUrl = data['imageUrl'];
        final title = data['title'];
        final category = data['category'];
        final context = navigatorKey.currentContext;
        if (wallpaperId != null &&
            imageUrl != null &&
            title != null &&
            category != null &&
            context != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => WallpaperDetailScreen(
                wallpaper: Wallpaper(
                  id: wallpaperId,
                  imageUrl: imageUrl,
                  title: title,
                  category: category,
                ),
              ),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'The Wallpaper Co.',
      theme: _isDarkMode
          ? ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black)
          : ThemeData.light().copyWith(
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color(0xFFF5F5F5),
                  statusBarIconBrightness: Brightness.dark, // dark icons
                  statusBarBrightness: Brightness.light, // for iOS
                ),
              ),
            ),
      home: const HomeScreen(),
    );
  }

  void _initRemoteConfig() async {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await remoteConfig.fetchAndActivate();
      setState(() {
        _isDarkMode = remoteConfig.getBool(AppConstants.remoteConfigKey);
        debugPrint('hello Dark Mode:[$_isDarkMode');
      });
      remoteConfig.onConfigUpdated.listen((event) async {
        await remoteConfig.activate();
        setState(() {
          _isDarkMode = remoteConfig.getBool(AppConstants.remoteConfigKey);
        });
      });
    } catch (e, stack) {
      debugPrint('RemoteConfig error: $e');
      debugPrint('Stack: $stack');
    }
  }
}
