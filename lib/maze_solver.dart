import 'package:data_structure_project/block_model.dart';

Future<bool> mazeSolver(Block start, Block end) async {
  Stack<Block> stack = Stack<Block>();
  stack.push(start);
  bool endPointReached = false;

  while (stack.isNotEmpty) {
    Block currentBlock = stack.pop()!;
    if (currentBlock.isVisited) {
      continue;
    }
    if (currentBlock.isEndPoint) {
      endPointReached = true;
      return true;
    }

    currentBlock.isVisited = true;

    List<Block?> neighbors = [
      currentBlock.getNeighborTop,
      currentBlock.getNeighborBot,
      currentBlock.getNeighborLeft,
      currentBlock.getNeighborRight,
    ];

    for (Block? neighbor in neighbors) {
      if (neighbor != null && !neighbor.isVisited && !neighbor.isWall) {
        stack.push(neighbor);
        neighbor.parent = currentBlock;
      }
    }
  }

  if (!endPointReached) {
    print('No way to reach the end point from the starting point.');
    return false;
  }
  return false;
}

class Stack<T> {
  final List<T> _list = [];

  void push(T element) {
    _list.add(element);
  }

  T? pop() {
    if (_list.isEmpty) {
      return null;
    }
    return _list.removeLast();
  }

  bool get isNotEmpty => _list.isNotEmpty;
}
