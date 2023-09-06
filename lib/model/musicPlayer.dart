import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:audioplayers/audioplayers.dart';

final file = 'music/ShadowSudokuSong.mp3';
final player = AudioPlayer(playerId: "MusicPlayer");

playMusic() async {
  player.play(AssetSource(file));
  player.setReleaseMode(ReleaseMode.loop);
}

stopMusic() async {
  player.pause();
}