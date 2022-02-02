import 'package:flutter/material.dart';
import 'dart:math' as math;

class BuilderSection extends StatefulWidget {
  const BuilderSection({Key? key}) : super(key: key);

  @override
  State<BuilderSection> createState() => _BuilderSectionState();
}

class _BuilderSectionState extends State<BuilderSection>
    with SingleTickerProviderStateMixin {
  bool show = false;

  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _controller.repeat();

    _heightAnimation = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    );

    _heightAnimation.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: child,
            );
          },
          child: Image.network(
            'https://i.pinimg.com/originals/5c/e7/3f/5ce73f64614b1fd07a44a8528fb55ece.png',
            height: 150,
            width: 150,
          ),
        ),
      ),
    );
  }
}
