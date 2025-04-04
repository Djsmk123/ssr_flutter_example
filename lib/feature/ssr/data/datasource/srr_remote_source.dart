import 'package:flutter_application_1/core/logger/logger.dart';
import 'package:flutter_application_1/core/model/ssr_model.dart';
import 'package:flutter_application_1/core/network/api_client.dart';

class SrrRemoteSource {
  final Logger logger;

  final ApiClient client;

  SrrRemoteSource({required this.client, required this.logger});
  Future<SsrModel> fetchScreenData({required String screenId}) async {
    try {
      final response = await client.performRequest(
        endpoint: screenId,
        requestType: RequestType.get,
      );

      if (response.isSuccess && response.data != null) {
        final data = SsrModel.from(response.data?.data);
        return data;
      } else {
        throw Exception(response.appError?.error ?? "Unknown error occurred");
      }
    } catch (e) {
      rethrow;
    }
  }
}
