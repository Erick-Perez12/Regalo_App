import 'package:flutter/material.dart';

import '../styles/app_styles.dart';
import '../widgets/romantic_lava_background.dart';
import 'home_screen.dart';

class YesScreen extends StatefulWidget {
  const YesScreen({super.key});

  @override
  State<YesScreen> createState() => _YesScreenState();
}

class _YesScreenState extends State<YesScreen> {
  bool showContent = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        showContent = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const Positioned.fill(child: RomanticLavaBackground()),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 32),
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: showContent
                    ? Column(
                        key: const ValueKey(1),
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            opacity: showContent ? 1.0 : 0.0,
                            duration: const Duration(seconds: 1),
                            child: const Text(
                              'Sabia que te gustaria.',
                              style: AppStyles.titleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 20),
                          AnimatedOpacity(
                            opacity: showContent ? 1.0 : 0.0,
                            duration: const Duration(seconds: 1),
                            child: const Text(
                              'Espero verte pronto😉\nAsi darte un abrazo por tu cumple\nY por todo lo que pasaste',
                              //'Y ahora que te vuelvo a ver\nYa no quiero amanecer tan solo\nOtra vez',
                              style: AppStyles.messageStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 16),
                          AnimatedOpacity(
                            opacity: showContent ? 1.0 : 0.0,
                            duration: const Duration(seconds: 1),
                            child: const Text(
                              'Porque te lo mereces y mucho más.\nAsique pasala bien hoy\nya te dare mas sorpresas y detalles🎉🎉.',
                              //'Porque ahora somos unicos, los unicos.\nY ahora que te vuelvo a ver,\nya no quiero amanecer tan solo.',
                              style: AppStyles.messageStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 24),
                          AnimatedOpacity(
                            opacity: showContent ? 1.0 : 0.0,
                            duration: const Duration(seconds: 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/corazon.gif',
                                  width: 110,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 18),
                                Image.asset(
                                  'assets/flores.gif',
                                  width: 110,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 0.8, end: 1.0),
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                            builder: (context, scale, child) {
                              return Transform.scale(
                                scale: scale,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MainScreen(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  style: AppStyles.buttonStylePrimary,
                                  child: const Text(
                                    'Volver al inicio',
                                    style: AppStyles.buttonTextStyle,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    : const SizedBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
