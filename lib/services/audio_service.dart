import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;

  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isInitialized = false;

  AudioService._internal();

  Future<void> playMusic() async {
    if (!_isInitialized) {
      await _audioPlayer.setReleaseMode(ReleaseMode.loop);
      await _audioPlayer.setVolume(0.65);
      _isInitialized = true;
    }

    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource('Unicos.mp3'));
  }

  Future<void> pauseMusic() async {
    await _audioPlayer.pause();
  }

  Future<void> stopMusic() async {
    await _audioPlayer.stop();
  }
}
