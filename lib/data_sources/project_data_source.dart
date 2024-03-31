import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:my__team/models/project.dart';

class ProjectDataSource extends CalendarDataSource {
  final List<Project> projects;

  ProjectDataSource(this.projects);

  @override
  DateTime getStartTime(int index) {
    return projects[index].startDate;
  }

  @override
  DateTime getEndTime(int index) {
    return projects[index].endDate;
  }

  @override
  String getSubject(int index) {
    return projects[index]
        .modules
        .first
        .moduleName; // Utilisation du nom du premier module comme sujet
  }

  String getDetails(int index) {
    String details = '';
    for (var module in projects[index].modules) {
      details += ' - ${module.moduleName}:\n';
      for (var task in module.tasks) {
        details += '   * ${task.taskName}\n';
      }
    }
    return details;
  }
}
