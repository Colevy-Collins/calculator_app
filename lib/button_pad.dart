class ButtonPad {
  List<List<String?>> _grid = [];
  final int maxHeight = 5; // Maximum number of rows
  final int maxWidth = 5; // Number of columns (fixed)

  ButtonPad() {
    _initializeGrid();
  }

  // Initialize the grid with the provided buttons
  void _initializeGrid() {
    _grid = [['C', 'DEL', '%', '/'],
             ['9', '8', '7', '*'],
             ['6', '5', '4', '-'],
             ['3', '2', '1', '+'],
             ['0', '.', 'ANS', '='],
             ['Empty', 'Empty', 'Empty', 'Empty'],
    ];
    }

  // Get the current grid
  List<List<String?>> getGrid() {
    return _grid;
  }

}
