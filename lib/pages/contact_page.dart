import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zulkhaifahmed/widgets/nav_drawer.dart';
import '../widgets/custom_app_bar.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(currentPage: '/contact'),
      endDrawer: const NavDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get in Touch',
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(Icons.web),
                  const SizedBox(width: 10),
                  Text(
                    'https://www.linkedin.com/in/zulkhaif-ahmed/',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(const ClipboardData(
                              text: 'https://www.linkedin.com/in/zulkhaif-ahmed/'))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Copied to your clipboard!')));
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
