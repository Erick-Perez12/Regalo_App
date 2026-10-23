import 'package:flutter/material.dart';

import '../styles/app_styles.dart';
import '../widgets/romantic_lava_background.dart';
import 'game_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool showFirstText = true;
  double opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        opacityLevel = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () {
          setState(() {
            showFirstText = false;
          });
        },
        child: Stack(
          children: [
            const Positioned.fill(child: RomanticLavaBackground()),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child:
                      showFirstText ? _buildFirstText() : _buildSecondScreen(),
                ),
              ),
            ),
            if (!showFirstText) _buildBottomButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstText() {
    return AnimatedOpacity(
      key: UniqueKey(),
      opacity: opacityLevel,
      duration: const Duration(seconds: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'En este dia, tan especial',
            //'Para ti, mi lugar favorito',
            style: AppStyles.titleStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          Text(
            'Aunque existan dias grises, nunca olvides lo especial que eres.\nTienes esa forma bonita de iluminar todo, incluso sin darte cuenta.',
            style: AppStyles.messageStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSecondScreen() {
    return Column(
      key: UniqueKey(),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Te deseo un Feliz Cumpleaños Azumi🍰',
          //'Hay algo que quiero decirte...',
          style: AppStyles.messageStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'En este dia, tan especial \nquería decirte lo increíble que eres y agradecer por tu hermosa forma de ser.\nPara mí, vales muchísimo como persona.',
            //'Hay personas que llegan y ya...\npero algunas se vuelven melodias que uno nunca quiere dejar de escuchar.\nPara mí, tú eres esa canción.',
            style: AppStyles.messageStyle,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 28),
        Image.asset(
          'assets/torta.gif',
          width: 240,
          height: 240,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              'Error al cargar la imagen',
              style: TextStyle(color: Colors.red),
            );
          },
        ),
      ],
    );
  }

  Widget _buildBottomButton() {
    return Positioned(
      bottom: 120,
      left: 0,
      right: 0,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GameScreen()),
            );
          },
          style: AppStyles.buttonStylePrimary,
          child: const Text(
            'Seguir',
            style: AppStyles.buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
