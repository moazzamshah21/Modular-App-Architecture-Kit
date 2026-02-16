import 'package:flutter/material.dart';

/// A widget that animates its child with a scale (pop-in) effect.
///
/// Example:
/// ```dart
/// ScaleIn(begin: 0.8, child: MyDialog())
/// ```
class ScaleIn extends StatefulWidget {
  const ScaleIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 400),
    this.curve = Curves.easeOutBack,
    this.begin = 0.8,
  });

  /// The child widget to animate.
  final Widget child;

  /// Delay before the animation starts.
  final Duration delay;

  /// Duration of the scale animation.
  final Duration duration;

  /// Animation curve.
  final Curve curve;

  /// Initial scale (0–1). Default 0.8.
  final double begin;

  @override
  State<ScaleIn> createState() => _ScaleInState();
}

class _ScaleInState extends State<ScaleIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: widget.begin, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );
    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => ScaleTransition(
        scale: _animation,
        child: child,
      ),
      child: widget.child,
    );
  }
}
