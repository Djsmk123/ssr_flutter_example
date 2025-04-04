import 'package:flutter_application_1/core/model/ssr_model.dart';
import 'package:flutter_application_1/core/result/result.dart' show Result;

abstract class SrrRepo {
  //get screen
  Future<Result<SsrModel>> getScreen(String screenId);
}
