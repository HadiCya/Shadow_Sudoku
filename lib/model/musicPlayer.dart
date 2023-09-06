import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:audioplayers/audioplayers.dart';

playMusic() async {
  final file = 'music/ShadowSudokuSong.mp3';
  final player = AudioPlayer(playerId: "MusicPlayer");
  player.play(AssetSource(file));
}