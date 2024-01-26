// import 'package:data_structure_project/block_model.dart';
// import 'package:data_structure_project/maze_solver.dart';
// import 'package:data_structure_project/ui.dart';
// import 'package:flutter/material.dart';

// void main() {
// List<List<int>> mazeEntry = [
//   [1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1],
//   [1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1],
//   [1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1],
//   [1, 1, 0, 2, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1],
//   [1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1],
//   [1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1],
//   [1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1],
//   [1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1],
//   [0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1],
//   [1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1],
//   [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1, 1],
//   [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1],
// ];
//   List<List<int>> mazeEntry = [
//     [2, 0, 1, 0, 1, 1],
//     [1, 1, 1, 0, 1, 1],
//     [1, 0, 0, 0, 1, 1],
//     [1, 0, 1, 1, 1, 1],
//     [1, 0, 1, 0, 1, 1],
//     [1, 1, 1, 0, 3, 1],
//   ];
//   List<List<Block?>> mainMaze = List.generate(
//       mazeEntry.length, (i) => List.generate(mazeEntry[i].length, (j) => null));
//   Block? start;
//   Block? end;
//   for (var j = 0; j < mazeEntry.length; j++) {
//     for (var i = 0; i < mazeEntry[j].length; i++) {
//       if (mazeEntry[j][i] == 0) {
//         mainMaze[j][i] = Block(
//             x: i,
//             y: j,
//             isWall: true,
//             isEndPoint: false,
//             isStartPoint: false,
//             isVisited: false);
//       }
//       if (mazeEntry[j][i] == 2) {
//         mainMaze[j][i] = Block(
//             x: i,
//             y: j,
//             isStartPoint: true,
//             isWall: false,
//             isEndPoint: false,
//             isVisited: false);
//         start = Block(
//             x: i,
//             y: j,
//             isStartPoint: true,
//             isWall: false,
//             isEndPoint: false,
//             isVisited: false);
//       }
//       if (mazeEntry[j][i] == 3) {
//         mainMaze[j][i] = Block(
//             x: i,
//             y: j,
//             isEndPoint: true,
//             isWall: false,
//             isStartPoint: false,
//             isVisited: false);
//         end = Block(
//             x: i,
//             y: j,
//             isEndPoint: true,
//             isWall: false,
//             isStartPoint: false,
//             isVisited: false);
//       } else if (mazeEntry[j][i] == 1) {
//         mainMaze[j][i] = Block(
//             x: i,
//             y: j,
//             isEndPoint: false,
//             isStartPoint: false,
//             isWall: false,
//             isVisited: false);
//       }
//     }
//   }
//   dfs(start!, end!, () {
//     // Manually update UI state here

//   });
// }

import 'package:data_structure_project/maze_solver.dart';
import 'package:flutter/material.dart';
import 'package:data_structure_project/block_model.dart';

void main() {
  runApp(const MaterialApp(home: MazeSolverApp()));
}

class MazeSolverApp extends StatefulWidget {
  const MazeSolverApp({super.key});

  @override
  _MazeSolverAppState createState() => _MazeSolverAppState();
}

int group = 1;
Block? start;
Block? end;

class _MazeSolverAppState extends State<MazeSolverApp> {
  List<List<Block?>> mainMaze = [];

  List<Block?> path = [];

  @override
  void initState() {
    super.initState();
    initializeMaze();
  }

  void initializeMaze() {
    // List<List<int>> mazeEntry = [
    //   [1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1],
    //   [1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1],
    //   [1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1],
    //   [1, 1, 1, 2, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1],
    //   [1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1],
    //   [1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1],
    //   [1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1],
    //   [1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1],
    //   [0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1],
    //   [1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1],
    //   [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1],
    //   [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1],
    //   [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1],
    //   [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1],
    //   [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1],
    //   [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1],
    //   [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1],
    //   [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1],
    //   [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 3, 1, 1, 0, 1, 1, 0, 1],
    //   [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1],
    // ];
    List<List<int>> mazeEntry = [];

    if (mazeEntry.isNotEmpty) {
      mainMaze = List.generate(mazeEntry.length,
          (i) => List.generate(mazeEntry[i].length, (j) => null));

      for (var j = 0; j < mazeEntry.length; j++) {
        for (var i = 0; i < mazeEntry[j].length; i++) {
          if (mazeEntry[j][i] == 0) {
            mainMaze[j][i] = Block(
                x: i,
                y: j,
                isWall: true,
                isEndPoint: false,
                isStartPoint: false,
                isPath: false,
                isVisited: false);
          }
          if (mazeEntry[j][i] == 2) {
            mainMaze[j][i] = Block(
                x: i,
                y: j,
                isStartPoint: true,
                isWall: false,
                isPath: false,
                isEndPoint: false,
                isVisited: false);
            start = Block(
                x: i,
                y: j,
                isStartPoint: true,
                isWall: false,
                isPath: false,
                isEndPoint: false,
                isVisited: false);
          }
          if (mazeEntry[j][i] == 3) {
            mainMaze[j][i] = Block(
                x: i,
                y: j,
                isEndPoint: true,
                isPath: false,
                isWall: false,
                isStartPoint: false,
                isVisited: false);
            end = Block(
                x: i,
                y: j,
                isEndPoint: true,
                isWall: false,
                isPath: false,
                isStartPoint: false,
                isVisited: false);
          } else if (mazeEntry[j][i] == 1) {
            mainMaze[j][i] = Block(
                x: i,
                y: j,
                isPath: false,
                isEndPoint: false,
                isStartPoint: false,
                isWall: false,
                isVisited: false);
          }
        }
      }
    } else {
      mainMaze = List.generate(
          20,
          (i) => List.generate(
              20,
              (j) => Block(
                  x: i,
                  y: j,
                  isWall: false,
                  isEndPoint: false,
                  isStartPoint: false,
                  isVisited: false,
                  isPath: false)));
    }
  }

  void updateUI() async {
    Block? node = Block.allBlocks.where((element) => element.isEndPoint).first;

    while (node != null) {
      path.add(node);
      node = node.parent;
    }

    path = path.reversed.toList();

    for (var element in path) {
      element!.isPath = true;
      await Future.delayed(const Duration(milliseconds: 5));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maze Solver'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 400,
              height: 400,
              child: Table(
                border: TableBorder.all(),
                children: List.generate(
                  mainMaze.length,
                  (i) => TableRow(
                    children: List.generate(
                      mainMaze[i].length,
                      (j) => MazeBlockWidget(
                        block: mainMaze[i][j]!,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ChoiceChip(
                  label: const Text('wall'),
                  selected: group == 1,
                  onSelected: (value) {
                    setState(() {
                      group = 1;
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text('start point'),
                  selected: group == 2,
                  onSelected: (value) {
                    setState(() {
                      group = 2;
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text('end point'),
                  selected: group == 3,
                  onSelected: (value) {
                    setState(() {
                      group = 3;
                    });
                  },
                )
              ],
            ),
            ElevatedButton(
              child: const Text('Start'),
              onPressed: () async {
                for (var element in Block.allBlocks) {
                  element.isVisited = false;
                  element.isPath = false;
                }

                path.clear();
                setState(() {});
                bool isReched = await mazeSolver(start!, end!);
                if (!isReched) {
                  // ignore: use_build_context_synchronously
                  showDialog(
                    context: context, // Use setStateCallback to get the context
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("No way to reach end"),
                        content: const Text(
                            "There is no valid path to reach the end point."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  updateUI();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MazeBlockWidget extends StatefulWidget {
  Block block;

  MazeBlockWidget({super.key, required this.block});

  @override
  State<MazeBlockWidget> createState() => _MazeBlockWidgetState();
}

class _MazeBlockWidgetState extends State<MazeBlockWidget> {
  @override
  Widget build(BuildContext context) {
    Color color;
    if (widget.block.isStartPoint) {
      color = Colors.green;
    } else if (widget.block.isEndPoint) {
      color = Colors.red;
    } else if (widget.block.isPath) {
      color = Colors.yellow;
    } else if (widget.block.isWall) {
      color = Colors.black;
    } else {
      color = Colors.white;
    }

    return GestureDetector(
      onTap: () {
        widget.block = Block.allBlocks
            .where((element) =>
                widget.block.x == element.x && widget.block.y == element.y)
            .first;
        if (group == 1) {
          setState(() {
            if (widget.block.isWall) {
              color = Colors.white;
              widget.block.isWall = false;
              widget.block.isStartPoint = false;
              widget.block.isEndPoint = false;
              widget.block.isPath = false;
              widget.block.isVisited = false;
            } else {
              color = Colors.black;
              widget.block.isWall = true;
              widget.block.isStartPoint = false;
              widget.block.isEndPoint = false;
              widget.block.isPath = false;
              widget.block.isVisited = false;
            }
          });
        } else if (group == 2) {
          setState(() {
            if (widget.block.isStartPoint) {
              color = Colors.white;
              widget.block.isWall = false;
              widget.block.isStartPoint = false;
              widget.block.isEndPoint = false;
              widget.block.isPath = false;
              widget.block.isVisited = false;
              start = null;
            } else {
              color = Colors.green;
              widget.block.isWall = false;
              widget.block.isStartPoint = true;
              widget.block.isEndPoint = false;
              widget.block.isPath = false;
              widget.block.isVisited = false;
              start = widget.block;
            }
          });
        } else if (group == 3) {
          setState(() {
            if (widget.block.isEndPoint) {
              color = Colors.white;
              widget.block.isWall = false;
              widget.block.isStartPoint = false;
              widget.block.isEndPoint = false;
              widget.block.isPath = false;
              widget.block.isVisited = false;
              end = null;
            } else {
              color = Colors.red;
              widget.block.isWall = false;
              widget.block.isStartPoint = false;
              widget.block.isEndPoint = true;
              widget.block.isPath = false;
              widget.block.isVisited = false;
              end = widget.block;
            }
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1), color: color),
        width: double.infinity * 0.1,
        height: 20,
      ),
    );
  }
}
