import 'package:flutter/material.dart';
import 'package:productivity_app/screen/login_screen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [

              // Header
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10
                          )
                        ],
                      ),
                      child: const Icon(Icons.arrow_back, size: 20, ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text("My Profile", style: TextStyle(fontSize: 24)),
                  Spacer(),
                  Icon(Icons.settings_outlined),
                ],
              ),
              const SizedBox(height: 32),

              // Profile Info
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 3),
                ),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  child: Text("PG", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 16),
              Text("Parth Godhani", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text("Flutter Developer", style: TextStyle(fontSize: 14)),

              const SizedBox(height: 32),

              // Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard("120", "Tasks Done", Color(0xFF10B981)),
                  _buildStatCard("12", "Day Streak", Color(0xFFF59E0B)),
                  _buildStatCard("45h", "Hours Saved", Color(0xFF10B981)),
                ],
              ),

              const SizedBox(height: 32),

              // Options
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    _buildOptionTile("Notifications", Icons.notifications_outlined, () {}),
                    _buildOptionTile("Theme", Icons.dark_mode_outlined, () {}),
                    _buildOptionTile("Language", Icons.language, () {}),
                    _buildOptionTile("Account Settings", Icons.person_outline, () {}),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()),(route) => false);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.logout, color: Colors.red),
                    const SizedBox(width: 8),
                    Text("Logout",style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)
          ],
        ),
        child: Column(
          children: [
            Text(value, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Color(0xFF1E293B), size: 20),
      ),
      title: Text(title,
          style: TextStyle(fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.arrow_forward_ios,
          size: 16, color: Color(0xFF64748B)),
      onTap: onTap,
    );
  }
}
