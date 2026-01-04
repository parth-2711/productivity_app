import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:productivity_app/model/task_model.dart';
import 'add_task_screen.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  int selectedDateIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Generate dummy dates
    final dates = List.generate(7, (index) {
        final date = DateTime.now().add(Duration(days: index));
        return date;
    });

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var taskDetail = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskScreen()));
          setState(() {
            taskList.add(taskDetail);
          });
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                   GestureDetector(
                     onTap: () => Navigator.pop(context),
                     child: Container(
                       padding: const EdgeInsets.all(10),
                       decoration: BoxDecoration(
                         color: Colors.white,
                         shape: BoxShape.circle,
                         boxShadow: [
                             BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
                         ],
                       ),
                       child: const Icon(Icons.arrow_back, size: 20, color: Color(0xFF1E293B)),
                     ),
                   ),
                   const SizedBox(width: 16),
                   Text("Timeline", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xFF1E293B))),
                   const Spacer(),
                   const Icon(Icons.calendar_month_outlined, color: Color(0xFF1E293B)),
                ],
              ),
            ),
            
            // Date
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  final date = dates[index];
                  final isSelected = index == selectedDateIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDateIndex = index;
                      });
                    },
                    child: Container(
                      width: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                         boxShadow: [
                             BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6),
                         ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('E').format(date),
                            style: TextStyle(fontSize: 12,color: isSelected ? Colors.white : Color(0xFF64748B), fontWeight: FontWeight.w600,),
                          ),
                          const SizedBox(height: 6),
                          Text(date.day.toString(),
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: isSelected ? Colors.white : Color(0xFF1E293B),),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Task List
            Expanded(
              child: taskList.isEmpty ? Center(child: Text("No task Found"),) :ListView.builder(
                shrinkWrap: true,
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24, left: 15, right: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 8,),
                          SizedBox(
                            width: 70,
                            child: Text(taskList[index].taskTime, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Column(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 2),
                                    boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.5), blurRadius: 4)],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 2,
                                    color: Color(0xFF64748B).withOpacity(0.2),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(16),
                                border: Border(left: BorderSide(color: Colors.blue, width: 4)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Text(taskList[index].taskTitle.toString(),
                                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Color(0xFF1E293B)),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis
                                          )
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.6),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(taskList[index].taskPriority, style: TextStyle(fontSize: 12,color: Color(0xFF1E293B))),
                                      )
                                    ],
                                  ),
                                  if (taskList[index].taskDescription.isNotEmpty) ...[
                                    const SizedBox(height: 4),
                                    Text(taskList[index].taskDescription, style: TextStyle(fontSize: 14,)),
                                  ]
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // child: ListView(
              //   padding: const EdgeInsets.all(24),
              //   children: [
              //     _buildTimelineItem(
              //       time: "09:00 AM",
              //       title: "Team Standup",
              //       description: "Discuss project updates",
              //       color: Colors.blue,
              //       duration: "30 min",
              //     ),
              //     _buildTimelineItem(
              //       time: "10:00 AM",
              //       title: "Mobile App Design",
              //       description: "F",
              //       color: Colors.blue,
              //       duration: "2 hrs",
              //     ),
              //     _buildTimelineItem(
              //       time: "01:00 PM",
              //       title: "Lunch Break",
              //       description: "Healthy meal",
              //       color: Color(0xFF10B981),
              //       duration: "1 hr",
              //     ),
              //      _buildTimelineItem(
              //       time: "03:00 PM",
              //       title: "Client Meeting",
              //       description: "Review initial mockups",
              //       color: Color(0xFFF59E0B),
              //       duration: "1 hr",
              //     ),
              //   ],
              // ),


            ),
          ],
        ),
      ),
    );
  }
  
  // Widget _buildTimelineItem({required String time, required String title, required String description, required Color color, required String duration}) {
  //    return
     //   IntrinsicHeight(
     //   child: Padding(
     //     padding: const EdgeInsets.only(bottom: 24),
     //     child: Row(
     //       crossAxisAlignment: CrossAxisAlignment.start,
     //       children: [
     //         SizedBox(
     //           width: 70,
     //           child: Text(time, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
     //         ),
     //         Padding(
     //           padding: const EdgeInsets.only(right: 16),
     //           child: Column(
     //             children: [
     //                Container(
     //                  width: 12,
     //                  height: 12,
     //                  decoration: BoxDecoration(
     //                    color: color,
     //                    shape: BoxShape.circle,
     //                    border: Border.all(color: Colors.white, width: 2),
     //                    boxShadow: [BoxShadow(color: color.withOpacity(0.5), blurRadius: 4)],
     //                  ),
     //                ),
     //                Expanded(
     //                  child: Container(
     //                    width: 2,
     //                    color: Color(0xFF64748B).withOpacity(0.2),
     //                  ),
     //                ),
     //             ],
     //           ),
     //         ),
     //         Expanded(
     //           child: Container(
     //             padding: const EdgeInsets.all(16),
     //             decoration: BoxDecoration(
     //               color: color.withOpacity(0.08),
     //               borderRadius: BorderRadius.circular(16),
     //               border: Border(left: BorderSide(color: color, width: 4)),
     //             ),
     //             child: Column(
     //               crossAxisAlignment: CrossAxisAlignment.start,
     //               children: [
     //                  Row(
     //                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
     //                    children: [
     //                      Expanded(
     //                          child: Text(title,
     //                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Color(0xFF1E293B)),
     //                              maxLines: 1,
     //                              overflow: TextOverflow.ellipsis
     //                          )
     //                       ),
     //                       Container(
     //                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
     //                         decoration: BoxDecoration(
     //                           color: Colors.white.withOpacity(0.6),
     //                           borderRadius: BorderRadius.circular(8),
     //                         ),
     //                         child: Text(duration, style: TextStyle(fontSize: 12,color: Color(0xFF1E293B))),
     //                       )
     //                    ],
     //                  ),
     //                  if (description.isNotEmpty) ...[
     //                    const SizedBox(height: 4),
     //                     Text(description, style: TextStyle(fontSize: 14,)),
     //                  ]
     //               ],
     //             ),
     //           ),
     //         ),
     //       ],
     //     ),
     //   ),
     // );
//   }
}
