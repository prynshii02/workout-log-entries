import 'package:assignment_flutter/model/workout_log_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class WorkoutLogsController {
  static WorkoutLogsController? _instance;

  WorkoutLogsController._();

  factory WorkoutLogsController() {
    _instance ??= WorkoutLogsController._();
    return _instance!;
  }

  RxList<WorkoutLogEntry> logs = RxList<WorkoutLogEntry>([
    WorkoutLogEntry(
        workoutName: "Overhead Press", warmpupRows: [], setRows: []),
    WorkoutLogEntry(workoutName: "Bench Press", warmpupRows: [], setRows: []),
    WorkoutLogEntry(workoutName: "Lat Pulldown", warmpupRows: [], setRows: [])
  ]);

  addWorkoutLog(String logName) {
    logs.add(
      WorkoutLogEntry(workoutName: logName, warmpupRows: [], setRows: []),
    );
  }

  removeWorkoutLog(int index) {
    logs.removeAt(index);
  }
}
