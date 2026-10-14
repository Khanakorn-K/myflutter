import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// หน้าซ้อนใน About branch — ไว้สาธิต context.push (stack) ต่างจากสลับ tab.
class AboutDetailPage extends StatelessWidget {
  const AboutDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Detail ใน About branch...'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.pop(), // กลับ About โดย tab ไม่เปลี่ยน
              child: const Text('ย้อนกลับ'),
            ),
          ],
        ),
      ),
    );
  }
}
