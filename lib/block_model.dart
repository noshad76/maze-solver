import 'dart:collection';

class Block {
  int x;
  int y;
  bool isWall;
  bool isStartPoint;
  bool isEndPoint;
  bool isVisited;
  bool isPath;
  Block? parent;
  static List<Block> allBlocks = [];

  Block? get getNeighborTop => allBlocks
      .where((element) => element.y == y - 1 && element.x == x)
      .firstOrNull;
  Block? get getNeighborBot => allBlocks
      .where((element) => element.y == y + 1 && element.x == x)
      .firstOrNull;
  Block? get getNeighborLeft => allBlocks
      .where((element) => element.x == x - 1 && element.y == y)
      .firstOrNull;
  Block? get getNeighborRight => allBlocks
      .where((element) => element.x == x + 1 && element.y == y)
      .firstOrNull;

  Block({
    required this.x,
    required this.y,
    required this.isWall,
    required this.isEndPoint,
    required this.isStartPoint,
    required this.isVisited,
    required this.isPath
  }) {
    allBlocks.add(this);
  }

  @override
  String toString() {
    return 'Block( x=$x,y=$y iswall=$isWall isstart=$isStartPoint isend=$isEndPoint ispath=$isPath isvisited=$isVisited )';
  }
}
