import 'package:drift/drift.dart';
import 'package:datekeeper/core/enums/feb29_policy.dart';

class Feb29PolicyConverter extends TypeConverter<Feb29Policy, String> {
  const Feb29PolicyConverter();

  @override
  Feb29Policy fromSql(String fromDb) {
    return Feb29Policy.values.firstWhere(
      (e) => e.name == fromDb,
      orElse: () => Feb29Policy.feb28,
    );
  }

  @override
  String toSql(Feb29Policy value) => value.name;
}