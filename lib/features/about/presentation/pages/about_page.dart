import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// หน้า About — ตัวอย่าง tab ที่ 2 ของ ShellRoute.
/// เป็น Stateless เพราะไม่มี state ของตัวเอง.
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      children: [
        const Text(
          'About',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text('ตัวอย่าง tab ที่ 2 ด้วย go_router + StatefulShellRoute.'),
        const SizedBox(height: 16),
        // ตัวอย่าง push หน้าซ้อนใน branch เดิม (stack) — ไม่สลับ tab
        FilledButton(
          onPressed: () => context.push('/about/detail'),
          child: const Text('ดูรายละเอียด (push)'),
        ),
      ],
    );
  }
}
