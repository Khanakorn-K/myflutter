# คู่มือพัฒนาตัวเอง — ฉบับของน้อง

อ่านไฟล์นี้ตอนเริ่มวันใหม่ก่อนแตะโค้ด อ่านจบ 3 นาที

## นิสัยที่ต้องมี (กันใจร้อน)
1. เช้าเปิดโปรเจกต์: `flutter analyze` ก่อนเสมอ เขียวค่อยรัน
2. เจอ error: อ่านให้จบทุกบรรทัดก่อน (มันบอกไฟล์+บรรทัด+วิธีแก้ไว้แล้ว 8 ครั้งใน 10)
3. ก่อน paste โค้ดจากเน็ต/จากแชท: อ่านทีละบรรทัด ถามตัวเองว่า "บรรทัดนี้ทำอะไร" ตอบไม่ได้ = ยังไม่ paste
4. ก่อนเซฟทับไฟล์: ไฟล์ในดิสก์อาจใหม่กว่าที่จำได้ — เทียบก่อนเสมอ
5. แก้ทีละเรื่อง รันทีละครั้ง พังจะได้รู้ว่าพังเพราะอะไร

## เช็กลิสต์ก่อนกดรัน (ท่องให้ขึ้นใจ)
- [ ] constructor ชื่อตรง class (`const MenuBarMain`, ไม่ใช่ `const new`)
- [ ] ใน `build()` ไม่มี `sl()`, ไม่มี `new` ของมี state, ไม่ยิง async
- [ ] ของที่สร้างใน `initState`/field มีที่ `dispose` ครบ — และ dispose แค่ของตัวเอง
- [ ] จำนวน tab == จำนวนหน้า
- [ ] `flutter analyze` = No issues found

## พื้นฐานที่ต้องแน่น (ตามลำดับ)
1. Dart: `final/const/late`, null safety (`?/!/late`), `async/await`, `List/Map`
2. Widget: `Stateless/Stateful`, `initState/dispose/build`, `setState` ใช้เมื่อไหร่
3. Layout: `Column/Row/Stack/ListView`, `Expanded`, `MediaQuery`
4. Navigation: `Navigator` → `go_router` (push vs goBranch)
5. State: `ChangeNotifier + ListenableBuilder` ให้คล่องก่อน แล้วค่อย `Riverpod/Bloc`
6. Network + JSON: `dio` + `fromMap → mapper → Entity`

## บันทึกพลาดของตัวเอง (อย่าให้มีรอบ 4)
- `const new` — 3 รอบ → จำ: constructor = ชื่อ class
- `sl()` ใน `build()` — 3 รอบ → จำ: build ต้อง pure
- paste ทับไฟล์ที่แก้แล้ว — 2 รอบ → จำ: เทียบดิสก์ก่อน
- package ตาย (`iconly`) — 1 รอบ → จำ: เช็ค pub.dev ก่อน add

## ทางไป Architect
- ตอนนี้ (7/10): เพิ่ม feature ที่ 2–3 ด้วยมือตัวเองให้ได้โดยไม่ถาม
- ต่อไป: `go_router` กลับมา + test โฟลเดอร์ `domain` ให้เขียว
- ไกล: backend เอง (`Dart Frog/Supabase`) + วาด C4 ของแอปตัวเอง + ออกแบบว่ารองรับ 1M user ยังไง

---
*AGENTS.md = กฎให้ AI จำ / ไฟล์นี้ = กฎให้น้องจำ*
