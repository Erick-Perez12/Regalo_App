import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../styles/app_styles.dart';

class RomanticLavaBackground extends StatefulWidget {
  const RomanticLavaBackground({super.key});

  @override
  State<RomanticLavaBackground> createState() =>
      _RomanticLavaBackgroundState();
}

class _RomanticLavaBackgroundState extends State<RomanticLavaBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 16),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;
        final wave = Curves.easeInOut.transform(t);

        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(
                -1 + (math.sin(t * math.pi * 2) * 0.25),
                -1 + (math.cos(t * math.pi * 2) * 0.15),
              ),
              end: Alignment(
                1 + (math.cos(t * math.pi * 2) * 0.2),
                1 + (math.sin(t * math.pi * 2) * 0.15),
              ),
              colors: const [
                AppStyles.backgroundColor,
                AppStyles.wineColor,
                AppStyles.deepBlue,
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(-0.7 + wave * 0.6, -0.8 + wave * 0.5),
                      radius: 1.15,
                      colors: [
                        AppStyles.skyBlue.withValues(alpha: 0.16),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              _MovingBlob(
                animationValue: t,
                size: 280,
                color: AppStyles.wineColor.withValues(alpha: 0.30),
                start: const Offset(0.05, 0.12),
                end: const Offset(0.42, 0.25),
              ),
              _MovingBlob(
                animationValue: 1 - t,
                size: 320,
                color: AppStyles.skyBlue.withValues(alpha: 0.28),
                start: const Offset(0.68, 0.08),
                end: const Offset(0.5, 0.35),
              ),
              _MovingBlob(
                animationValue: wave,
                size: 300,
                color: AppStyles.deepBlue.withValues(alpha: 0.30),
                start: const Offset(0.12, 0.68),
                end: const Offset(0.35, 0.55),
              ),
              _MovingBlob(
                animationValue: Curves.easeInOutSine.transform(t),
                size: 260,
                color: AppStyles.softRose.withValues(alpha: 0.20),
                start: const Offset(0.7, 0.7),
                end: const Offset(0.52, 0.5),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MovingBlob extends StatelessWidget {
  const _MovingBlob({
    required this.animationValue,
    required this.size,
    required this.color,
    required this.start,
    required this.end,
  });

  final double animationValue;
  final double size;
  final Color color;
  final Offset start;
  final Offset end;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(
        (_lerp(start.dx, end.dx, animationValue) * 2) - 1,
        (_lerp(start.dy, end.dy, animationValue) * 2) - 1,
      ),
      child: IgnorePointer(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(size),
            boxShadow: [
              BoxShadow(
                color: color,
                blurRadius: 90,
                spreadRadius: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _lerp(double a, double b, double t) => a + ((b - a) * t);
}
