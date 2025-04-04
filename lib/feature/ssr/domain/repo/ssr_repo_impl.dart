import 'package:flutter_application_1/core/error/app_error.dart';
import 'package:flutter_application_1/core/model/ssr_model.dart';
import 'package:flutter_application_1/core/result/result.dart';
import 'package:flutter_application_1/feature/ssr/data/datasource/srr_remote_source.dart'
    show SrrRemoteSource;
import 'package:flutter_application_1/feature/ssr/data/repo/srr_repo.dart';

class SsrRepoImpl extends SrrRepo {
  final SrrRemoteSource remoteSource;

  SsrRepoImpl({required this.remoteSource});
  @override
  Future<Result<SsrModel>> getScreen(String screenId) async {
    try {
      final response = await remoteSource.fetchScreenData(screenId: screenId);
      return Result<SsrModel>(data: response, appError: null);
    } on AppError catch (e) {
      return Result<SsrModel>(data: null, appError: e);
    } on Exception catch (e) {
      return Result<SsrModel>(
        data: null,
        appError: GenericError(error: e.toString()),
      );
    }
  }
}
