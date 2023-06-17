import 'package:assignment_flutter/controller/workout_log_controller.dart';
import 'package:assignment_flutter/view/widgets/warmsup_setup_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutLogScreen extends StatefulWidget {
  const WorkoutLogScreen({super.key});

  @override
  State<WorkoutLogScreen> createState() => _WorkoutLogScreenState();
}

class _WorkoutLogScreenState extends State<WorkoutLogScreen> {
  final WorkoutLogsController screenController = WorkoutLogsController();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController logController = TextEditingController();

  createLog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          title: const Text("Add Workout"),
          content: Form(
            key: _formKey,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: logController,
              decoration: const InputDecoration(
                hintText: "Workout Name",
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    screenController.addWorkoutLog(logController.text);
                    logController.clear();
                    Get.back();
                  }
                },
                child: const Text("Add Workout"))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Workout-Logs Screen'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              createLog(context);
            },
            label: const Text("Add Workout")),
        body: Obx(
          () => ListView.builder(
            itemCount: screenController.logs.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          screenController.logs[index].workoutName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            screenController.removeWorkoutLog(index);
                          },
                        ),
                      ),
                      const WarmUpSetUpRow(txt: "Warm-up"),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.sports_gymnastics),
                            Text(
                              "0 kg",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "0 reps",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            Icon(Icons.more_vert)
                          ],
                        ),
                      ),
                      const WarmUpSetUpRow(txt: "Set")
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
