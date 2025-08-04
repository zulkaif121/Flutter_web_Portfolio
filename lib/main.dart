import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'pages/projects_page.dart' deferred as projects_page;
import 'pages/contact_page.dart';
import 'widgets/fade_page_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Zulkhaif Ahmed - Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.interTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.inter(textStyle: textTheme.bodyMedium),
          displayLarge: GoogleFonts.inter(textStyle: textTheme.displayLarge, fontWeight: FontWeight.bold),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return FadePageRoute(page: const HomePage());
          case '/about':
            return FadePageRoute(page: const AboutPage());
          case '/projects':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return FutureBuilder(
                  future: projects_page.loadLibrary(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return projects_page.ProjectsPage();
                    } else {
                      return const Material(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                );
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
          case '/contact':
            return FadePageRoute(page: const ContactPage());
          default:
            return null;
        }
      },
    );
  }
}
