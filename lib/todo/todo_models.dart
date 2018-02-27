import 'package:meta/meta.dart';

class TodoHomeModel {
  TodoHomeModel({@required this.name, @required this.taskGroups});

  String name;
  List<TaskGroup> taskGroups = <TaskGroup>[];
}

class TaskGroup {
  String groupName;
  int numTasks;
  int numComplete;

  TaskGroup(this.groupName, this.numTasks, this.numComplete);

  double get percentComplete => numTasks / numComplete;
}

TodoHomeModel getHomeModel() {
  return new TodoHomeModel(
    name: "Tomi",
    taskGroups: <TaskGroup>[
      new TaskGroup("Personal", 9, 7),
      new TaskGroup("Work", 12, 3),
      new TaskGroup("Home", 4, 2),
    ],
  );
}