

import 'package:audioplayers/audioplayers.dart';

const file = 'music/ShadowSudokuSong.mp3';
final player = AudioPlayer(playerId: "MusicPlayer");

playMusic() async {
  player.play(AssetSource(file));
  player.setReleaseMode(ReleaseMode.loop);
}

stopMusic() async {
  player.pause();
}