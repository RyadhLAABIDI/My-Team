import 'module.dart';

class Project {
  String id;
  String name;
  List<Module> modules;
  int? total_duration;
  DateTime? startDate; // Déclaré comme DateTime nullable
  DateTime? endDate; // Déclaré comme DateTime nullable
  bool isComplete; // Champ booléen pour l'état du projet

  Project({
    required this.id,
    required this.name,
    required this.modules,
    this.total_duration,
    this.startDate, // Déclaré comme DateTime nullable
    this.endDate, // Déclaré comme DateTime nullable
    this.isComplete =
        false, // Assurez-vous qu'isComplete a une valeur par défaut de false
  });

  // In Project.fromJson
  factory Project.fromJson(Map<String, dynamic> json) {
    print("Debug Project - ID: ${json['_id']}, Name: ${json['name']}");

    int? total_duration = json['total_duration'] as int?;
    return Project(
      id: json['_id'] ?? 'default-id', // Utilisez '_id' au lieu de 'id'
      name: json['name'] ?? 'Unnamed Project',
      modules: (json['modules'] as List? ?? [])
          .map((moduleData) => Module.fromJson(moduleData))
          .toList(),
      total_duration: json['total_duration'] ?? 0,
      startDate: json['startDate'] != null
          ? DateTime.tryParse(json['startDate'])
          : null,
      endDate:
          json['endDate'] != null ? DateTime.tryParse(json['endDate']) : null,
      isComplete: json['isComplete'] ?? false,
    );
  }

  void updateWithPredictedData(Map<String, dynamic> data) {
    if (data.containsKey('project_start_date')) {
      this.startDate = DateTime.tryParse(data['project_start_date']);
      print("Updated Project Start Date: ${this.startDate}");
    }
    if (data.containsKey('project_end_date')) {
      this.endDate = DateTime.tryParse(data['project_end_date']);
      print("Updated Project End Date: ${this.endDate}");
    }
    if (data.containsKey('project_status')) {
      // Mise à jour du statut en fonction de la complétude du projet
      this.isComplete = data['project_status'] == 'Complete';
      print(
          "Project status updated to: ${this.isComplete ? 'Complete' : 'Incomplete'}");
    }
    if (data.containsKey('total_duration')) {
      // Mise à jour de la durée totale du projet
      this.total_duration = int.tryParse(data['total_duration'].toString());
      print("Updated Project Total Duration: ${this.total_duration}");
    }
  }
}
