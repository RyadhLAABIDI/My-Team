import 'module.dart';

class Project {
  List<Module> modules;
  int totalDuration;
  DateTime startDate;
  DateTime endDate;

  Project({
    required this.modules,
    required this.totalDuration,
    required this.startDate,
    required this.endDate,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    List<Module> modules = (json['modules'] as List)
        .map((moduleData) => Module.fromJson(moduleData))
        .toList();

    return Project(
      modules: modules,
      totalDuration: json['total_duration'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
    );
  }
}
