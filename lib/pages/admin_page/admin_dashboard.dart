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
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: Text(
          "Dashboard",
          style: AppFonts.profileName.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.notifications_none, color: Colors.white),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSection(
              title: "General",
              menus: [
                {"title": "School Notice Board", "icon": Icons.dashboard},
                {"title": "Events", "icon": Icons.event},
                {"title": "Staff Birthday List", "icon": Icons.celebration},
                {"title": "Student Birthday List", "icon": Icons.cake},
                {"title": "Calendar", "icon": Icons.calendar_month},
                {"title": "Quotes", "icon": Icons.format_quote},
              ],
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: "Finance Reports",
              menus: [
                {"title": "Fee Report", "icon": Icons.receipt_long},
                {"title": "Head-wise Collection", "icon": Icons.account_balance_wallet},
                {"title": "Date-wise Collection", "icon": Icons.date_range},
                {"title": "Year-wise Collection", "icon": Icons.bar_chart},
                {"title": "Advance Amount Report", "icon": Icons.account_balance},
              ],
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: "Dashboards",
              menus: [
                {"title": "Staff Dashboard", "icon": Icons.people_alt},
                {"title": "Student Dashboard", "icon": Icons.school},
                {"title": "Super Admin Dashboard", "icon": Icons.supervisor_account},
                {"title": "Certificates", "icon": Icons.card_membership},
                {"title": "Role-Based Dashboard", "icon": Icons.admin_panel_settings},
              ],
            ),
          ],
        ),
      ),

      // -------- Scrollable Bottom Bar --------
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _bottomNavItem(Icons.home, "Dashboard"),
              _bottomNavItem(Icons.fact_check, "Attendance",),
              _bottomNavItem(Icons.assignment, "Exams"),
              _bottomNavItem(Icons.payments, "Fees"),
              _bottomNavItem(Icons.directions_bus, "Transport"),
              _bottomNavItem(Icons.library_books, "Library"),
              _bottomNavItem(Icons.message, "Communication"),
              _bottomNavItem(Icons.school, "Learning"),
              _bottomNavItem(Icons.more_horiz, "More"),
            ],
          ),
        ),
      ),
    );
  }

  // ---- Section Builder ----
  Widget _buildSection({required String title, required List<Map<String, dynamic>> menus}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppFonts.sectionTitle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.primaryBlue,
            ),
          ),
          const SizedBox(height: 12),
          _buildMenuGrid(menus),
        ],
      ),
    );
  }

  // ---- Grid Builder ----
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
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("${menu['title']} clicked")),
            );
          },
        );
      },
    );
  }

  // ---- Bottom Navigation Item ----
  Widget _bottomNavItem(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        // Handle navigation
        
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 24, color: AppColors.primaryBlue),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

// ---- Card ----
class _DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade200),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title first
            Text(
              title,
              style: AppFonts.menuTitle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),

            // Small icon below
            Icon(
              icon,
              size: 22,
              color: AppColors.primaryBlue,
            ),
          ],
        ),
      ),
    );
  }
}
