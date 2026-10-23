import 'package:flutter/material.dart';

import '../styles/app_styles.dart';
import '../widgets/romantic_lava_background.dart';
import 'yes_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final List<String> messages = [
    'No',
    'Segura?',
    'Piensalo bien',
    'Lloro eh',
    'Me moleto uu',
  ];

  final List<String> images = [
    'assets/game.gif',
    'assets/game_1.gif',
    'assets/game_2.gif',
    'assets/game_3.gif',
    'assets/game_4.gif',
    'assets/game_5.gif',
  ];

  int messageIndex = 0;
  int noClickCount = 0;
  double noButtonSize = 1.0;
  double yesButtonSize = 1.0;

  void handleNoClick() {
    setState(() {
      if (noClickCount < 5) {
        messageIndex = (messageIndex + 1) % messages.length;
        yesButtonSize += 0.2;
        noButtonSize = (noButtonSize - 0.1).clamp(0.72, 1.0);
        noClickCount++;
      }
    });
  }

  void handleYesClick() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const YesScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const Positioned.fill(child: RomanticLavaBackground()),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(seconds: 2),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: Text(
                      'te gusto este pequeño detalle?',
                      key: ValueKey(noClickCount),
                      style: AppStyles.titleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    child: Image.asset(
                      images[noClickCount],
                      key: ValueKey(noClickCount),
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 80),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 1.0, end: yesButtonSize),
                          duration: const Duration(milliseconds: 300),
                          builder: (context, size, child) {
                            return Transform.scale(
                              scale: size,
                              child: ElevatedButton(
                                onPressed: handleYesClick,
                                style: AppStyles.buttonStyleYes,
                                child: const Text(
                                  'Si',
                                  style: AppStyles.buttonTextStyle,
                                ),
                              ),
                            );
                          },
                        ),
                        if (noClickCount < 5)
                          TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 1.0, end: noButtonSize),
                            duration: const Duration(milliseconds: 300),
                            builder: (context, size, child) {
                              return Transform.scale(
                                scale: size,
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    minWidth: 120,
                                    maxWidth: 190,
                                  ),
                                  child: ElevatedButton(
                                    onPressed: handleNoClick,
                                    style: AppStyles.buttonStyleNo,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        messages[messageIndex],
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: AppStyles.buttonTextStyle,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                      ],
                    ),
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
