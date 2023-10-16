import 'package:flutter/material.dart';
import '../atoms/difficulty.dart';

class TaskCard extends StatefulWidget {
  final String name;
  final String image;
  final int difficulty;
  const TaskCard(this.name, this.image, {Key? key, this.difficulty = 1})
      : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  int level = 0;
  int mastery = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              //make a hsl color using mastery
              color: HSLColor.fromAHSL(
                      1, mastery * 50 <= 360 ? mastery * 50 : 360, 1, 0.5)
                  .toColor(),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
          ),
          Column(
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black26,
                        image: DecorationImage(
                          image: NetworkImage(widget.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.name,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Difficulty(
                          difficultyLevel: widget.difficulty,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 70,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if ((level / widget.difficulty) / 10 == 1) {
                              mastery++;
                              level = 0;
                            } else {
                              level++;
                            }
                          });
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.arrow_drop_up),
                            Text('UP'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          value: (level / widget.difficulty) / 10,
                          color: Colors.white,
                          backgroundColor: Colors.white54,
                        )),
                    Text('Nível: $level',
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
