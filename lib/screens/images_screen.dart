import 'package:flutter/material.dart';

/// Screen 2 — Images, Assets & Fonts
/// Demonstrates loading local assets using Image.asset(), laying them out
/// cleanly in a responsive GridView.count, and using custom fonts (Poppins).
class ImagesScreen extends StatelessWidget {
  const ImagesScreen({super.key});

  // List of local image items mapped to asset paths and descriptions
  final List<Map<String, String>> _galleryItems = const [
    {
      'path': 'assets/images/flutter_mobile.png',
      'title': 'Mobile Apps',
      'tag': 'Flutter Core',
    },
    {
      'path': 'assets/images/code_development.png',
      'title': 'Clean Architecture',
      'tag': 'Dart Widgets',
    },
    {
      'path': 'assets/images/ui_ux_design.png',
      'title': 'UI / UX Design',
      'tag': 'Material 3',
    },
    {
      'path': 'assets/images/cloud_database.png',
      'title': 'Cloud Backend',
      'tag': 'REST & APIs',
    },
    {
      'path': 'assets/images/data_analytics.png',
      'title': 'Data Analytics',
      'tag': 'Performance',
    },
    {
      'path': 'assets/images/smart_algorithms.png',
      'title': 'Smart Algorithms',
      'tag': 'Animations',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Determine screen width for responsive GridView.count columns
    final double screenWidth = MediaQuery.of(context).size.width;
    final int crossAxisCount = screenWidth > 900
        ? 4
        : screenWidth > 600
            ? 3
            : 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Images, Assets & Fonts'),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Custom Font & Asset Banner
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: const Color(0xFFA5D6A7)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.font_download_outlined,
                      color: Color(0xFF2E7D32),
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Custom Typography: Poppins Font',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B5E20),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'All texts are rendered with the custom Poppins font configured globally via ThemeData in pubspec.yaml. Images below are local assets rendered via Image.asset() in a GridView.count.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF2E7D32),
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Font Showcase Chip Row
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Chip(
                    avatar: const Icon(Icons.check, size: 16, color: Color(0xFF2E7D32)),
                    label: const Text(
                      'Poppins Regular 400',
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                    ),
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  Chip(
                    avatar: const Icon(Icons.check, size: 16, color: Color(0xFF2E7D32)),
                    label: const Text(
                      'Poppins Bold 700',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  Chip(
                    avatar: const Icon(Icons.check, size: 16, color: Color(0xFF2E7D32)),
                    label: const Text(
                      'Image.asset() Bundle',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Section Title
              const Text(
                'Local Asset Gallery (GridView.count)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 12),

              // Responsive GridView.count with shrinkWrap & physics to scroll inside SingleChildScrollView
              GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 14.0,
                crossAxisSpacing: 14.0,
                childAspectRatio: 0.85,
                children: _galleryItems.map((item) {
                  return Card(
                    elevation: 2,
                    shadowColor: Colors.black12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Local Image display using Image.asset()
                        Expanded(
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                item['path']!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey.shade200,
                                    child: const Center(
                                      child: Icon(
                                        Icons.broken_image,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              // Floating category tag
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.6),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    item['tag']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Label & Info
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E293B),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item['path']!,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey.shade600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
