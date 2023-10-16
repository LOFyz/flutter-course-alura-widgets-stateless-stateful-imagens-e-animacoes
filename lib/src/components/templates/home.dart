import 'package:flutter/material.dart';
import 'package:primeiro_projeto_do_curso/src/components/molecules/task_card.dart';

class Task {
  String name;
  String image;
  int difficulty;

  Task(this.name, this.image, this.difficulty);
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    // !mock
    List<Task> list = [];

    for (int i = 1; i <= 9; i++) {
      list.add(
          Task('Tarefa $i', 'https://picsum.photos/72/100', i <= 5 ? i : 5));
    }

    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(width: 32),
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: <Widget>[
            for (var item in list)
              TaskCard(
                item.name,
                'https://picsum.photos/72/100?random=2',
                difficulty: item.difficulty,
              ),
            const SizedBox(height: 80)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacity = !opacity;
            });
          },
          child: Icon(opacity ? Icons.visibility_off : Icons.visibility)),
    );
  }
}
