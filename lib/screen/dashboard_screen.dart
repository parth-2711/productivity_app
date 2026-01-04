import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productivity_app/model/task_model.dart';
import 'package:productivity_app/screen/add_task_screen.dart';
import 'package:productivity_app/screen/profile_screen.dart';
import 'package:productivity_app/screen/timeline_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  taskTitle () {
    if(taskList.isNotEmpty){
      String name = taskList[0].taskTitle;
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async{
          var taskDetail = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskScreen()));
          setState(() {
            taskList.add(taskDetail);
          });
        },
        child: Icon(Icons.add, color: Colors.white,),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good Morning,", style: TextStyle(fontSize: 16)),
                        Text("Alex!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text("40 tasks this month", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => ProfileScreen(),));
                      },
                      child: const CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                    ),
                    
            
                  ],
                ),
                const SizedBox(height: 30,),
                SearchBar(
                  hintText: "Search a task",
                  leading: Icon(Icons.search_rounded),
                ),
            
                const SizedBox(height: 50,),
                // Status Categories
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatusCard(
                        "To-Do", Icons.assignment_outlined, Colors.blue),
                    _buildStatusCard(
                        "Progress", Icons.timelapse, Colors.orange),
                    _buildStatusCard(
                        "Done", Icons.check_circle_outline, Colors.green),
                  ],
                ),
                const SizedBox(height: 30,),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today's Tasks", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => TimelineScreen(),));
                      },
                      child: Text("See All", style: TextStyle(color: Colors.blue, fontSize: 18)),
                    )
                  ],
                ),
            
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        margin: const EdgeInsets.only(right: 16, bottom: 8),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text("Work", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600,),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text("Progress", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w600,),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text("Mobile App Design", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.access_time, size: 16, color: Colors.grey,),
                                const SizedBox(width: 4),
                                Text("10:00 AM", style: TextStyle()),
                              ],
                            ),
                          ],
                        ),
                      ),
            
                      Container(
                        width: 200,
                        height: 200,
                        margin: const EdgeInsets.only(right: 16, bottom: 8),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text("Marketing", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600,),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text("Done", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600,),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text("Market Research", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.access_time, size: 16, color: Colors.grey,),
                                const SizedBox(width: 4),
                                Text("02:00 PM", style: TextStyle()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 200,
                        margin: const EdgeInsets.only(right: 16, bottom: 8),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text("Work", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600,),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text("Done", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600,),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text("Team Meeting", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.access_time, size: 16, color: Colors.grey,),
                                const SizedBox(width: 4),
                                Text("04:00 PM", style: TextStyle()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                taskList.isNotEmpty ? Text(taskList[0].taskTitle): Text("No Task Found"),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildStatusCard(String title, IconData icon, Color color) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(title,
              style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    ),
  );
}