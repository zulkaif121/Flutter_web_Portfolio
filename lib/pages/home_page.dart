import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zulkhaifahmed/widgets/nav_drawer.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/gradient_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(currentPage: '/'),
      endDrawer: const NavDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hi, I’m Zulkhaif Ahmed \n I love building with Python & Flutter, and Exploring AI',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(

                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: Color(0xFF434446),
              ),
            ),
            // Normal Text (no gradient)

            const SizedBox(height: 20),

// Gradient Text using your GradientText widget
            InkWell(
            borderRadius: BorderRadius.circular(10),
              onTap: () {
                Navigator.pushNamed(context, "/projects");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientText(
                  'View My Work',
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF5F68BC), // purple/blue start
                      Color(0xFFF78A77), // red/pink end
                    ],
                  ),
                  alignment: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize:24,
                    fontWeight: FontWeight.w600,
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


