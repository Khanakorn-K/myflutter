/// Base UseCase class ที่ทุก UseCase ต้อง extend
/// [ReturnType] คือ return type, [Params] คือ parameter type
/// ถ้าไม่มี parameter ให้ใช้ [NoParams]
abstract class UseCase<ReturnType, Params> {
  Future<ReturnType> execute(Params params);
}

/// ใช้สำหรับ UseCase ที่ไม่ต้องการ parameter
class NoParams {
  const NoParams();
}
