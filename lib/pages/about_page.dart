import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zulkhaifahmed/widgets/gradient_text.dart';
import 'package:zulkhaifahmed/widgets/nav_drawer.dart';
import '../widgets/custom_app_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(currentPage: '/about'),
      endDrawer: const NavDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return _buildWideLayout(context);
                  } else {
                    return _buildNarrowLayout(context);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildTextContent(),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 1,
          child: _buildProfileImage(),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildProfileImage(),
        const SizedBox(height: 20),
        _buildTextContent(),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        image: DecorationImage(
          image: AssetImage('assets/images/pfp.webp'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradientText(
          'About Me',
          style: GoogleFonts.playfairDisplay(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
          gradient: LinearGradient(
            colors: [
              Color(0xFF5F68BC), // purple/blue start
              Color(0xFFF78A77), // red/pink end
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '''I'm Zulkhaif Ahmed, a Python and Flutter developer passionate about building intelligent web and mobile applications. My work often involves AI and computer vision, especially for solving real-world problems like automation and monitoring. I enjoy developing scalable systems and exploring innovative ways to integrate machine learning into practical solutions.''',
          style: GoogleFonts.lato(fontSize: 16, height: 1.5),
        ),
      ],
    );
  }
}
