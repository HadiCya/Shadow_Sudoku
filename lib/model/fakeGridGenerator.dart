import 'dart:math';

fakeGrid() {
  var rng = Random();
  var grid = [];
  for (int i = 0; i < 10; i++){
    grid.add(List<int>.generate(9, (int index) => rng.nextInt(9) + 1));
  }
  return grid;
}

var grid = fakeGrid();
