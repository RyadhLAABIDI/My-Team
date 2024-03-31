import 'task.dart';

class Module {
  final String moduleName;
  final DateTime moduleStartDate;
  final int totalDuration;
  final DateTime moduleEndDate;
  final List<Task> tasks;

  Module({
    required this.moduleName,
    required this.moduleStartDate,
    required this.totalDuration,
    required this.moduleEndDate,
    required this.tasks,
  });

  factory Module.fromJson(Map<String, dynamic> json) {
    List<Task> tasks = (json['tasks'] as List)
        .map((taskData) => Task.fromJson(taskData))
        .toList();

    return Module(
      moduleName: json['module_name'],
      totalDuration: json['total_duration'],
      moduleStartDate: DateTime.parse(json['module_start_date']),
      moduleEndDate: DateTime.parse(json['module_end_date']),
      tasks: tasks,
    );
  }
}
