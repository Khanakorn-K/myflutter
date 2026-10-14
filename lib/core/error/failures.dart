/// Base failure สำหรับทุก layer ใน Clean Architecture.
/// Domain / Presentation ควรคุยกันด้วย [Failure] ไม่ใช่ Exception ตรงๆ
sealed class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Failed to fetch home data']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache failure']);
}

/// Exception ฝั่ง Data layer เท่านั้น ห้ามหลุดไปถึง Presentation.
/// Repository มีหน้าที่ map Exception -> Failure
class ServerException implements Exception {
  final String message;
  const ServerException([this.message = 'Server exception']);
}
