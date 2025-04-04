import 'dart:developer';

class Logger {
  void logError(String error, {required StackTrace traces}) {
    log("error: $error, details: ${traces.toString()}");
  }

  void logInfo(String info) {
    log("info: $info");
  }

  void logWarning(String warning) {
    log("warning: $warning");
  }
}
