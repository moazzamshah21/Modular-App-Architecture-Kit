import 'package:flutter/material.dart';

/// A widget that animates its child with a fade-in effect.
///
/// Use [delay] to wait before starting, [duration] for animation length,
/// and [curve] for the animation curve.
///
/// Example:
/// ```dart
/// FadeIn(delay: 200.ms, child: MyCard())
/// ```
class FadeIn extends StatefulWidget {
  const FadeIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOut,
  });

  /// The child widget to animate.
  final Widget child;

  /// Delay before the animation starts.
  final Duration delay;

  /// Duration of the fade-in animation.
  final Duration duration;

  /// Animation curve (e.g. [Curves.easeOut]).
  final Curve curve;

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
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
      builder: (context, child) => Opacity(
        opacity: _animation.value.clamp(0.0, 1.0),
        child: child,
      ),
      child: widget.child,
    );
  }
}

/// Extension for concise duration literals.
///
/// Example: `200.ms` returns `Duration(milliseconds: 200)`.
extension DurationExtension on int {
  /// Returns a [Duration] with this many milliseconds.
  Duration get ms => Duration(milliseconds: this);
}
