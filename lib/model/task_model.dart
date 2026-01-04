class TaskModel {
  String taskTitle, taskDescription, taskCategory, taskDate, taskTime, taskPriority;

  TaskModel({
    required this.taskTitle,
    required this.taskDescription,
    required this.taskCategory,
    required this.taskDate,
    required this.taskTime,
    required this.taskPriority
});
}

List<TaskModel> taskList = [
  TaskModel(taskTitle: "Mobile App Design", taskDescription: "Work on Login Flow", taskCategory: "Work", taskDate: "Jan 03,2026", taskTime: "4:29 PM", taskPriority: "Medium")
];