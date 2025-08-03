import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/app/app_name.dart';
import 'package:fruit_hub_dashboard/core/styles/app_text_style.dart';
import 'package:fruit_hub_dashboard/core/themes/app_colors_manger.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(context),
            const SizedBox(height: 16),
            // Stats Cards
            _buildStatsCards(context),
            const SizedBox(height: 16),
            // Action Grid
            _buildActionGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fruits Hub Dashboard',
              style: AppTextStyles.bold23.copyWith(
                color: AppColorsManger.primaryColor,
              ),
            ),
            Text(
              'Manage your e-commerce platform',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.red, size: 28),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Logout functionality TBD')),
            );
          },
        ),
      ],
    );
  }

  Widget _buildStatsCards(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth =
            (constraints.maxWidth - 16) / 3; // Subtract 16px for spacing
        return Row(
          children: [
            Expanded(
              child: _buildStatCard(
                title: 'Total Products',
                value: '120', // Replace with Firestore data
                icon: Icons.store,
                color: Colors.orange,
                width: cardWidth,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildStatCard(
                title: 'Total Orders',
                value: '85', // Replace with Firestore data
                icon: Icons.shopping_cart,
                color: Colors.green,
                width: cardWidth,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildStatCard(
                title: 'Total Users',
                value: '200', // Replace with Firestore data
                icon: Icons.person,
                color: Colors.blue,
                width: cardWidth,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required double width,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 1.3,
      children: [
        _buildActionCard(
          context,
          title: 'Add Data',
          icon: Icons.add_circle,
          color: Colors.green,
          onTap: () {
            Navigator.pushNamed(context, AppName.addproductView);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Add Product screen TBD')),
            );
          },
        ),
        _buildActionCard(
          context,
          title: 'Manage Products',
          icon: Icons.edit,
          color: Colors.orange,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Manage Products screen TBD')),
            );
          },
        ),
        _buildActionCard(
          context,
          title: 'View Orders',
          icon: Icons.shopping_bag,
          color: Colors.blue,
          onTap: () {
            // TODO: Navigate to Orders screen
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Orders screen TBD')));
          },
        ),
        _buildActionCard(
          context,
          title: 'Manage Users',
          icon: Icons.person_add,
          color: Colors.purple,
          onTap: () {
            // TODO: Navigate to Users screen
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Manage Users screen TBD')),
            );
          },
        ),
      ],
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
