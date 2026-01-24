import 'package:mandalahearts/core/services/database/spiritual_masters_db.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';

class SpiritualMasterRepository {
  SpiritualMasterRepository({required SpiritualMastersDb db}) : _db = db;

  final SpiritualMastersDb _db;

  List<SpiritualMaster>? _cache;

  Future<List<SpiritualMaster>> getSpiritualMasters({
    bool forceRefresh = false,
  }) async {
    if (!forceRefresh && _cache != null) {
      return _cache!;
    }
    final rawData = await _db.getSpiritualMasters();
    final masters = rawData.map(SpiritualMaster.fromJson).toList();
    _cache = masters;
    return masters;
  }

  void clearCache() {
    _cache = null;
  }
}
