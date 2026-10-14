# MyFlutter — Working Guide

## Commands
- วิเคราะห์: `flutter analyze` (ต้อง `No issues found!` ก่อนรันเสมอ)
- รัน: `flutter run` / เว็บ-เดสก์ท็อปตาม target ที่มี
- เช็คคอมไพล์เร็วโดยไม่รอ Gradle: `flutter build bundle --debug`
- เพิ่ม package: `flutter pub add <pkg>` / ถอด: `flutter pub remove <pkg>`

## Architecture (Clean + Feature-first)
- `lib/features/<feature>/{data,domain,presentation}/` — เพิ่ม feature ใหม่ copy ทรง `home/`
- Dependency ชี้เข้าหา Domain เท่านั้น: `presentation/data → domain` ห้ามกลับทิศ
- Domain ห้าม import Flutter / GetIt / http / data-model — pure Dart + `core/` เท่านั้น
- `Exception → Failure` แปลงที่ Repository (`data/repositories/`) ที่เดียว
- Mapping `Model → Entity` อยู่ไฟล์เดียว: `data/mappers/<feature>_mapper.dart` (extension) ห้ามซ้ำซ้อน
- `sl<>()` ใช้ได้แค่ composition root (`main.dart`, `app.dart`, `*_di.dart`) — ห้ามเรียกใน Widget/ViewModel โดยตรง ส่งผ่าน constructor แทน
- ViewModel 1 ตัวต่อ 1 หน้า: สร้างใน `initState`/State field, ทิ้งใน `dispose` — ใครสร้างคนนั้นทิ้ง ห้าม dispose ของที่ยืมมา

## Flutter rules (บทเรียนราคาแพง)
- `build()` ต้อง pure: ห้าม `sl()`, ห้าม `new` object มี state, ห้ามยิง async ข้างใน
- Constructor ชื่อเดียวกับ class เสมอ (`const MenuBarMain`, ห้าม `const new`)
- `initState` เปิดอะไร → `dispose` ปิดอันนั้น; hot reload ไม่เรียก `initState` ซ้ำ
- จำนวน tab ต้องเท่ากับจำนวนหน้า (กัน `RangeError` ตอนกด tab)
- Entry ของแอปคือ `lib/main.dart` ไฟล์เดียว — ห้ามมี `main()` ที่อื่น
- ไฟล์/โฟลเดอร์ snake_case (`view_model/`) / class PascalCase / ตัวแปร camelCase
- อย่าเพิ่ม dependency ที่เลิก maintain (เช็ค pub.dev: updated ล่าสุด + Flutter version ที่รองรับ) — เคยพังมาแล้วกับ `iconly`

## Workflow (กันใจร้อน)
1. อ่าน error ให้จบ (บอกไฟล์+บรรทัด+สาเหตุเสมอ) ก่อนถาม/ก่อนแก้
2. อ่านไฟล์จริงในดิสก์ก่อน (`read`/`grep`) อย่าแก้จากโค้ดที่จำได้ — ไฟล์อาจถูกเขียนทับไปแล้ว
3. ห้าม paste โค้ดเก่าทับไฟล์ที่แก้เสร็จแล้ว — ก่อน paste เทียบก่อนว่าดิสก์ใหม่กว่ามั้ย
4. แก้เสร็จ: `flutter analyze` → ผ่านค่อยรัน
5. เปลี่ยนทีละเรื่อง ไฟล์เล็ก commit บ่อย
