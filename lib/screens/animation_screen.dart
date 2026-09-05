import 'package:flutter/material.dart';

/// Screen 3 — Animations
/// Demonstrates AnimatedContainer smoothly animating visual properties:
/// Size, Color, Border Radius, and Box Shadow/Alignment between two states.
class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  // Boolean state variable controlling the animation
  bool _isToggled = false;

  void _toggleAnimation() {
    setState(() {
      _isToggled = !_isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Current animated property values based on _isToggled
    final double targetWidth = _isToggled ? 260.0 : 150.0;
    final double targetHeight = _isToggled ? 220.0 : 150.0;
    final Color targetColor =
        _isToggled ? const Color(0xFFFF5722) : const Color(0xFF3F51B5); // Deep Orange vs Indigo
    final double targetRadius = _isToggled ? 50.0 : 16.0;
    final double targetElevation = _isToggled ? 24.0 : 4.0;
    final Alignment targetAlignment =
        _isToggled ? Alignment.bottomRight : Alignment.center;

    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer Demo'),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Concept banner
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFFBE9E7),
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: const Color(0xFFFFCCBC)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.auto_awesome,
                      color: Color(0xFFD84315),
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Implicit Animation: AnimatedContainer',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFBF360C),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'AnimatedContainer automatically interpolates between old and new property values when rebuilt with setState().',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFD84315),
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Interactive Toggle Control Header
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            _isToggled
                                ? Icons.play_circle_fill
                                : Icons.stop_circle_outlined,
                            color: targetColor,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            _isToggled ? 'State: Transformed (B)' : 'State: Initial (A)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: targetColor,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      // Switch Toggle
                      Switch(
                        value: _isToggled,
                        onChanged: (val) => _toggleAnimation(),
                        activeThumbColor: const Color(0xFFFF5722),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // The Animation Stage / Arena
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Center(
                  // Core requirement: AnimatedContainer
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 650),
                    curve: Curves.easeInOutCubic,
                    width: targetWidth,
                    height: targetHeight,
                    alignment: targetAlignment,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: targetColor,
                      borderRadius: BorderRadius.circular(targetRadius),
                      boxShadow: [
                        BoxShadow(
                          color: targetColor.withValues(alpha: 0.45),
                          blurRadius: targetElevation,
                          offset: Offset(0, targetElevation / 2.5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _isToggled ? Icons.star_rounded : Icons.crop_square_rounded,
                          color: Colors.white,
                          size: _isToggled ? 46 : 34,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _isToggled ? 'State B (Active)' : 'State A (Default)',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Button to trigger animation
              ElevatedButton.icon(
                onPressed: _toggleAnimation,
                icon: Icon(
                  _isToggled ? Icons.replay : Icons.play_arrow_rounded,
                ),
                label: Text(
                  _isToggled ? 'Reset to Initial State' : 'Animate Container',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: targetColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                ),
              ),

              const SizedBox(height: 24),

              // Property values inspector card
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Live Property Inspector',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C3E50),
                        ),
                      ),
                      const Divider(height: 20),
                      _PropertyRow(
                        property: 'Width × Height',
                        value: '${targetWidth.toInt()} px × ${targetHeight.toInt()} px',
                      ),
                      _PropertyRow(
                        property: 'Background Color',
                        value: _isToggled ? 'Deep Orange (#FF5722)' : 'Indigo (#3F51B5)',
                      ),
                      _PropertyRow(
                        property: 'Border Radius',
                        value: '${targetRadius.toInt()} px (Curved)',
                      ),
                      _PropertyRow(
                        property: 'Box Shadow Blur',
                        value: '${targetElevation.toInt()} px blur',
                      ),
                      _PropertyRow(
                        property: 'Internal Alignment',
                        value: _isToggled ? 'bottomRight' : 'center',
                      ),
                      _PropertyRow(
                        property: 'Animation Curve',
                        value: 'Curves.easeInOutCubic (650ms)',
                      ),
                    ],
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

class _PropertyRow extends StatelessWidget {
  final String property;
  final String value;

  const _PropertyRow({
    required this.property,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            property,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
        ],
      ),
    );
  }
}
