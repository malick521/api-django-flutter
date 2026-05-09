import 'package:flutter/material.dart';
import 'package:todo/provider/task.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    taskProvider.fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter'), elevation: 12),
      body: Consumer<TaskProvider>(
        builder: (context, provider, child) {
          if (provider.tasks.isEmpty) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else {
            return ListView.builder(
              itemCount: provider.tasks.length,
              itemBuilder: (context, index) {
                final task = provider.tasks[index];
                return ListTile(
                  title: Text(task.task),
                  trailing: IconButton(
                    onPressed: () {
                      provider.deleteTask(task);
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
