import 'task.dart';

class Module {
  String id;
  String moduleName;
  int? totalDuration;
  DateTime? moduleStartDate;
  DateTime? moduleEndDate;
  String projectID; // Ajout du champ projectID
  List<Task> tasks;
  final List<String> teamM;

  Module({
    required this.id,
    required this.moduleName,
    this.totalDuration,
    this.moduleStartDate,
    this.moduleEndDate,
    required this.projectID, // Modification
    required this.tasks,
    required this.teamM,
  });

  // In Module.fromJson
  factory Module.fromJson(Map<String, dynamic> json) {
    print("Debug Module - ID: ${json['_id']}, Name: ${json['module_name']}");

    int? totalDuration = json['total_duration'] as int?;
    return Module(
      id: json['_id'] ?? 'default-module-id',
      moduleName: json['module_name'] ?? 'Unnamed Module',
      totalDuration: json['total_duration'] ?? 0,
      teamM: List<String>.from(json['teamM']),
      moduleStartDate: json['module_start_date'] != null
          ? DateTime.tryParse(json['module_start_date'])
          : null,
      moduleEndDate: json['module_end_date'] != null
          ? DateTime.tryParse(json['module_end_date'])
          : null,
      projectID: json['projectID'] ?? 'default-project-id',
      tasks: (json['tasks'] as List? ?? [])
          .map((taskJson) => Task.fromJson(taskJson))
          .toList(),
    );
  }
  void updateWithPredictedData(Map<String, dynamic> data) {
    if (data.containsKey('module_start_date')) {
      this.moduleStartDate = DateTime.parse(data['module_start_date']);
    }
    if (data.containsKey('module_end_date')) {
      this.moduleEndDate = DateTime.parse(data['module_end_date']);
    }
    if (data.containsKey('total_duration')) {
      this.totalDuration = data['total_duration'];
    }
  }
}
