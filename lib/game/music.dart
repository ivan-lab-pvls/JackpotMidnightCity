import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AudioControl {
  final player = AudioPlayer();

  Future<void> playAudio() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool music = prefs.getBool('music') ?? false;
    if (music) {
      await player.setReleaseMode(ReleaseMode.loop);
      await player.play(
        AssetSource('music/music.mp3'),
        volume: 0.1,
      );
    }
  }

  Future<void> stopAudio() async {
    await player.stop();
  }
}
