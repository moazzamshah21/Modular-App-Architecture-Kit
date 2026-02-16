import 'package:flutter/material.dart';

/// A widget that animates its child with a slide-in effect.
///
/// Example:
/// ```dart
/// SlideIn(offset: Offset(0, 0.1), child: MyList())
/// ```
class SlideIn extends StatefulWidget {
  const SlideIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 400),
    this.curve = Curves.easeOutCubic,
    this.offset = const Offset(0, 0.1),
  });

  /// The child widget to animate.
  final Widget child;

  /// Delay before the animation starts.
  final Duration delay;

  /// Duration of the slide animation.
  final Duration duration;

  /// Animation curve.
  final Curve curve;

  /// Starting offset (e.g. Offset(0, 0.1) slides up from below).
  final Offset offset;

  @override
  State<SlideIn> createState() => _SlideInState();
}

class _SlideInState extends State<SlideIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<Offset>(
      begin: widget.offset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
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
      builder: (context, child) => SlideTransition(
        position: _animation,
        child: child,
      ),
      child: widget.child,
    );
  }
}
