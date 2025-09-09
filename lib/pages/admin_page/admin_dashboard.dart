import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_fonts.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        title: Text("Admin Dashboard",
            style: AppFonts.profileName.copyWith(color: Colors.white)),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.white),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --------- Section 1 ----------
            Text("General", style: AppFonts.sectionTitle),
            const SizedBox(height: 12),
            _buildMenuGrid([
              {"title": "School Notice Board", "icon": Icons.dashboard, "color": Colors.blue},
              {"title": "Events", "icon": Icons.event, "color": Colors.orange},
              {"title": "Staff Birthday List", "icon": Icons.celebration, "color": Colors.purple},
              {"title": "Student Birthday List", "icon": Icons.cake, "color": Colors.pink},
              {"title": "Calendar", "icon": Icons.calendar_month, "color": Colors.teal},
              {"title": "Quotes", "icon": Icons.format_quote, "color": Colors.indigo},
            ]),

            const SizedBox(height: 20),

            // --------- Section 2 ----------
            Text("Finance Reports", style: AppFonts.sectionTitle),
            const SizedBox(height: 12),
            _buildMenuGrid([
              {"title": "Fee Report", "icon": Icons.receipt_long, "color": Colors.green},
              {"title": "Head-wise Collection", "icon": Icons.account_balance_wallet, "color": Colors.deepOrange},
              {"title": "Date-wise Collection", "icon": Icons.date_range, "color": Colors.cyan},
              {"title": "Year-wise Collection", "icon": Icons.bar_chart, "color": Colors.deepPurple},
              {"title": "Advance Amount Report", "icon": Icons.account_balance, "color": Colors.brown},
            ]),

            const SizedBox(height: 20),

            // --------- Section 3 ----------
            Text("Dashboards", style: AppFonts.sectionTitle),
            const SizedBox(height: 12),
            _buildMenuGrid([
              {"title": "Staff Dashboard", "icon": Icons.people_alt, "color": Colors.blueGrey},
              {"title": "Student Dashboard", "icon": Icons.school, "color": Colors.lightBlue},
              {"title": "Super Admin Dashboard", "icon": Icons.supervisor_account, "color": Colors.amber},
              {"title": "Certificates", "icon": Icons.card_membership, "color": Colors.pinkAccent},
              {"title": "Role-Based Dashboard", "icon": Icons.admin_panel_settings, "color": Colors.red},
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuGrid(List<Map<String, dynamic>> menus) {
    return GridView.builder(
      itemCount: menus.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // ✅ 3 per row
        childAspectRatio: 0.9,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
      itemBuilder: (context, index) {
        final menu = menus[index];
        return _DashboardCard(
          title: menu["title"],
          icon: menu["icon"],
          color: menu["color"],
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("${menu['title']} clicked")),
            );
          },
        );
      },
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 28, color: color),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: AppFonts.menuTitle.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
