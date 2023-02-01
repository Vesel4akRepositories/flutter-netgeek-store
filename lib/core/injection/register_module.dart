import 'package:injectable/injectable.dart';
import 'package:netgeek/core/network/api_helper.dart';

@module
abstract class RegisterModule {
  @singleton
  final httpManager = HttpManager('https://example.com');
}
