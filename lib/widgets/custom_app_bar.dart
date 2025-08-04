import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zulkhaifahmed/widgets/nav_drawer.dart';

import 'gradient_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentPage;

  const CustomAppBar({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return _buildWideAppBar(context);
        } else {
          return _buildNarrowAppBar(context);
        }
      },
    );
  }

  Widget _buildWideAppBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0, left: 30.0, right: 30.0),
      child: GlassContainer(
        height: 80.0,
        width: double.infinity,
        blur: 10,
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.4),
        borderColor: Colors.transparent,
        borderWidth: 0,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PORTFOLIO',
                style: GoogleFonts.oswald(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildNavButton(context, 'Home', '/'),
                  SizedBox(width: 10,),
                  _buildNavButton(context, 'About', '/about'),
                  SizedBox(width: 10,),
                  _buildNavButton(context, 'Projects', '/projects'),
                  SizedBox(width: 10,),
                  _buildNavButton(context, 'Contact', '/contact'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNarrowAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'PORTFOLIO',
        style: GoogleFonts.oswald(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black, // Adjust color for narrow app bar
        ),
      ),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black), // Adjust icon color
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ],
    );
  }

  Widget _buildNavButton(BuildContext context, String text, String routeName) {
    final bool isActive = currentPage == routeName;

    final activeGradient = LinearGradient(
      colors: [
        Color(0xFF5F68BC), // purple/blue start
        Color(0xFFF78A77), // red/pink end
      ],
    );

    final inactiveColor = Colors.transparent; // A light grey for inactive state

    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, routeName),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: isActive ? activeGradient : null, // Apply gradient only when active
          color: isActive ? null : inactiveColor, // Apply solid color when inactive
        ),
        child:isActive? Text(
          text,
          style: GoogleFonts.poppins(
            color:  Colors.white, // White text for active, black for inactive
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 2
          ),
        ):  GradientText(
          text,
          gradient: LinearGradient(
            colors: [
              Color(0xFF5F68BC), // purple/blue start
              Color(0xFFF78A77), // red/pink end
            ],
          ),
          style: GoogleFonts.poppins(

            fontWeight: FontWeight.w600,
            fontSize: 16,
              letterSpacing: 2
          ),
        ),
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
