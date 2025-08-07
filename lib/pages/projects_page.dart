import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zulkhaifahmed/widgets/nav_drawer.dart';
import '../models/project_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/gradient_text.dart';
import '../widgets/project_card.dart';
import '../widgets/project_view.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  Future<List<Project>> _getProjects() async {
    // Simulate a network delay
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      Project(
        title: 'Alkremeya',
        description: '''
Alkremeya is a digital B2B e-commerce platform I built to modernise Libya’s grocery supply chain.
It connects retailers directly with importers and wholesalers, streamlining procurement and pricing.
The platform reduces manual effort through real-time listings, predictive analytics, and smart tools.
Designed for scalability, Alkremeya empowers small retailers and supports regional expansion across MENA.''',
        imageUrl: 'assets/images/Alkremeya.webp',
        technologies: ['Flutter', 'Dart', 'Firebase'],
      ),
      Project(
        title: 'Imitation Learning Project',
        description: 'This project automates a medicine production line using a robotic arm guided by visual input from multiple cameras. It leverages 3D voxel maps, computer vision (e.g., SAM), and motion planning to detect, segment, and interact with medicine bottles without reinforcement learning.',
        imageUrl: 'assets/images/robot.webp',
        technologies: ['AI', 'Simulation', 'Pybullet'],
      ),
      Project(
        title: 'FrameIntel',
        description: '''
FrameIntel is a modular and scalable AI-powered platform that analyzes image frames from cameras to detect and classify objects or events in real time. 
Originally built for garbage monitoring, FrameIntel has evolved into a general-purpose vision intelligence system that can be adapted to various use cases, 
from environmental monitoring to industrial automation.

        
        
        ''',
        imageUrl: 'assets/images/frameintel.webp',
        technologies: ['Python', 'Django', 'PostgreSQL'],
      ),
      Project(
        title: 'Point of Sale System',
        description: '''
The POS System is a modern solution designed to simplify sales, inventory, and franchise management for retail businesses. 
It features an intuitive user interface, real-time reporting, and cloud-based data management to ensure smooth operations. 
Built with scalability and security in mind, the system is ideal for multi-location businesses and supports both online and offline functionality.        
        
        ''',
        imageUrl: 'assets/images/pos.webp',
        technologies: ['Flutter', 'Dart', 'Django'],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(currentPage: '/projects'),
      endDrawer: const NavDrawer(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF5F68BC), // Deep Purple Blue
                  Color(0xFF9D50BB), // Purple
                  Color(0xFFFF6A00), // Orange
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 120),
                  Text(
                    'My Projects',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FutureBuilder<List<Project>>(
                    future: _getProjects(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No projects found.'));
                      }

                      final projects = snapshot.data!;
                      return LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount;
                          if (constraints.maxWidth > 1200) {
                            crossAxisCount = 4;
                          } else if (constraints.maxWidth > 800) {
                            crossAxisCount = 3;
                          } else if (constraints.maxWidth > 600) {
                            crossAxisCount = 2;
                          } else {
                            crossAxisCount = 1;
                          }
                          return AnimationLimiter(
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 3 / 2,
                              ),
                              itemCount: projects.length,
                              itemBuilder: (context, index) {
                                final project = projects[index];
                                return AnimationConfiguration.staggeredGrid(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  columnCount: crossAxisCount,
                                  child: ScaleAnimation(
                                    child: FadeInAnimation(
                                      child: ProjectCard(
                                        project: project,
                                        img: project.imageUrl,
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => ProjectView(
                                              project: project,
                                              img: project.imageUrl,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

