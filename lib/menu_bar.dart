import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/features/home/presentation/pages/home_page.dart';
import 'package:myflutter/features/home/presentation/view_model/home_viewmodel.dart';
/// แถบล่าง 5 tab — รับ ViewModel ผ่าน constructor (ห้ามเรียก sl ตรงนี้).
class MenuBarMain extends StatefulWidget {
  final HomeViewModel homeViewModel;

  const MenuBarMain({super.key, required this.homeViewModel});

  @override
  State<MenuBarMain> createState() => _MenuBarMainState();
}

class _MenuBarMainState extends State<MenuBarMain> {
  var _selectedIndex = 0;

  // สร้างครั้งเดียวใน State ไม่ใช่ใน build (ดูจุดพลาดข้อ 2 ด้านล่าง).
  late final _pages = <Widget>[
    HomePage(homeViewModel: widget.homeViewModel),
    const _PlaceholderTab(icon: Icons.favorite, label: 'Liked'),
    const _PlaceholderTab(icon: Icons.add_circle, label: 'Add'),
    const _PlaceholderTab(icon: Icons.search, label: 'Search'),
    const _PlaceholderTab(icon: Icons.person, label: 'Profile'),
  ];

  void _handleIndexChanged(int i) {
    setState(() => _selectedIndex = i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CrystalNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _handleIndexChanged,
        showLabels: true,
        blurSigma: 14,
        indicatorColor: Colors.white,
        unselectedItemColor: Colors.white54,
        borderWidth: 1.5,
        outlineBorderColor: Colors.white.withValues(alpha: 0.55),
        backgroundColor: Colors.black.withValues(alpha: 0.45),
        items: [
          CrystalNavigationBarItem(
            icon: Icons.person,
            unselectedIcon: Icons.home_outlined,
            selectedColor: Colors.white,
            label: 'Home',
            badge: Badge(
              backgroundColor: const Color(0xFFE53935),
              textColor: Colors.white,
              label: const Text(
                '9+',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          CrystalNavigationBarItem(
            icon: Icons.person,
            unselectedIcon: Icons.favorite_border,
            selectedColor: const Color(0xFFFF5252),
            label: 'Liked',
          ),
          CrystalNavigationBarItem(
            icon: Icons.add_circle,
            unselectedIcon: Icons.add_circle_outline,
            selectedColor: const Color(0xFF69F0AE),
            label: 'Add',
          ),
          CrystalNavigationBarItem(
            icon: Icons.search,
            unselectedIcon: Icons.search_outlined,
            selectedColor: const Color(0xFF40C4FF),
            label: 'Search',
          ),
          CrystalNavigationBarItem(
            icon: Icons.person,
            unselectedIcon: Icons.person_outline,
            selectedColor: const Color(0xFFFFD740),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

/// ที่พักหน้าที่ยังไม่ทำ กัน RangeError ตอนกด tab ที่ยังไม่มีหน้า.
class _PlaceholderTab extends StatelessWidget {
  final IconData icon;
  final String label;

  const _PlaceholderTab({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 64, color: Colors.white54),
          const SizedBox(height: 12),
          Text(label, style: const TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }
}
