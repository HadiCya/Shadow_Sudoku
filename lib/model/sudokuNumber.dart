class SudokuNumber {
  int num;
  List<bool> notes;
  bool isSystemGenerated, isCorrect, isNote;

  SudokuNumber({this.num = 0, List<bool>? notes, this.isSystemGenerated = false, this.isCorrect = true, this.isNote = false}) : notes = notes ?? List.generate(9, (_) => false);
}