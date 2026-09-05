import 'package:flutter/material.dart';

/// The HomeScreen serves as the main navigation page of the application.
/// It provides access to three core Flutter concepts using named routes
/// with [Navigator.pushNamed].
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Concepts Demo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Simple overview card
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3F51B5).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Icon(
                          Icons.dashboard_outlined,
                          color: Color(0xFF3F51B5),
                          size: 26,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Core Flutter Concepts',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1E293B),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Select a concept below to view its functional implementation.',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF64748B),
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Concept 1: User Input & Forms
              _ConceptNavigationCard(
                title: 'User Input & Forms',
                description:
                    'Demonstrates Form, GlobalKey<FormState>, TextFormField, TextEditingController, validators, and SnackBar feedback.',
                icon: Icons.assignment_outlined,
                iconColor: const Color(0xFF1E88E5), // Blue
                onTap: () {
                  Navigator.pushNamed(context, '/form');
                },
              ),

              const SizedBox(height: 14),

              // Concept 2: Images, Assets & Fonts
              _ConceptNavigationCard(
                title: 'Images, Assets & Fonts',
                description:
                    'Demonstrates local asset management, Image.asset(), responsive GridView.count, and custom fonts in ThemeData.',
                icon: Icons.photo_library_outlined,
                iconColor: const Color(0xFF2E7D32), // Green
                onTap: () {
                  Navigator.pushNamed(context, '/images');
                },
              ),

              const SizedBox(height: 14),

              // Concept 3: Animations
              _ConceptNavigationCard(
                title: 'Animations',
                description:
                    'Demonstrates smooth transitions of size, color, border radius, and elevation using AnimatedContainer.',
                icon: Icons.animation_outlined,
                iconColor: const Color(0xFFD84315), // Deep Orange
                onTap: () {
                  Navigator.pushNamed(context, '/animation');
                },
              ),

              const SizedBox(height: 24),

              // Clean footer note
              Center(
                child: Text(
                  'Material Widgets • Named Route Navigation',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A clean, professional card widget for named route navigation.
class _ConceptNavigationCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  const _ConceptNavigationCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon container
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Icon(icon, color: iconColor, size: 28),
              ),
              const SizedBox(width: 16),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Trailing arrow
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
