import 'package:package_info_plus/package_info_plus.dart';

Future<Map<String, String>> getAppInfo() async {
  final packageInfo = await PackageInfo.fromPlatform();
  return {
    'appName': packageInfo.appName,
    'packageName': packageInfo.packageName,
    'version': packageInfo.version,
    'buildNumber': packageInfo.buildNumber,
  };
}
