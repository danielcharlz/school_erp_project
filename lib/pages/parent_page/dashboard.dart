import 'package:flutter/material.dart';
import 'package:edisapp/core/app_colors.dart';
import 'package:edisapp/core/app_fonts.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Home"),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Profile Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBlue.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 42, color: Colors.grey),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Prem", style: AppFonts.profileName),
                        Text("XI Science A", style: AppFonts.profileSub),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Attendance 0%", style: AppFonts.profileInfo),
                            Text("Fee 0%", style: AppFonts.profileInfo),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Sections
            buildSection("School Updates", [
              MenuItem("News", Icons.article, AppColors.teal),
              MenuItem("Events", Icons.event, AppColors.orange),
              MenuItem("Bulletin", Icons.campaign, AppColors.purple),
            ]),

            buildSection("Academics", [
              MenuItem("Daily Updates", Icons.update, AppColors.indigo),
              MenuItem("Assignment", Icons.assignment, AppColors.primaryBlue),
              MenuItem("Homework", Icons.book, AppColors.green),
              MenuItem("Exam Time Table", Icons.calendar_month, AppColors.red),
              MenuItem("E Learning", Icons.computer, AppColors.deepPurple),
              MenuItem("Certificate", Icons.card_membership, AppColors.teal),
              MenuItem("Report Card", Icons.grade, AppColors.amber),
            ]),

            buildSection("Student", [
              MenuItem("Attendance", Icons.check_circle, AppColors.primaryBlue),
              MenuItem("Complaints", Icons.report_problem, AppColors.red),
              MenuItem("Exam Result", Icons.school, AppColors.deepOrange),
              MenuItem("Fee Payment", Icons.payment, AppColors.green),
            ]),

            buildSection("Other", [
              MenuItem("Birthday", Icons.cake, AppColors.pink),
              MenuItem("Examination", Icons.edit_note, AppColors.indigo),
              MenuItem("Time Table", Icons.schedule, AppColors.brown),
              MenuItem("Fee", Icons.account_balance_wallet, AppColors.cyan),
            ]),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: "Assignment"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Homework"),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: "Pay Fees"),
        ],
      ),
    );
  }

  // Section Builder
  Widget buildSection(String title, List<MenuItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppFonts.sectionTitle),
        const SizedBox(height: 12),
        GridMenu(items: items),
        const SizedBox(height: 24),
      ],
    );
  }
}

// Grid Menu Widget
class GridMenu extends StatelessWidget {
  final List<MenuItem> items;
  const GridMenu({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 6,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(items[index].title, style: AppFonts.menuTitle, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: items[index].color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(14),
                child: Icon(items[index].icon, size: 28, color: items[index].color),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;
  final Color color;
  MenuItem(this.title, this.icon, this.color);
}
