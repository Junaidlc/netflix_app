import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/domain/core/di/injectable.dart';
import 'core/colors.dart';
import 'pressentation/main_page/widgets/screen_main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.dev);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getIt<SearchBloc>(),),
      ],
      child: MaterialApp(
        title: 'Netflix',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: (Colors.transparent),
            ),
            scaffoldBackgroundColor: backgroundColor,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white),
            ),
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
                .copyWith(background: Colors.black)),
        home: AnimatedSplashScreen(
          nextScreen: ScreenMainPage(),
          splash: "assets/image/netflix_write.png",
          splashIconSize: 200,
          backgroundColor: Colors.black,
          duration: 1000,
          splashTransition: SplashTransition.scaleTransition,
        ),
      ),
    );
  }
}
