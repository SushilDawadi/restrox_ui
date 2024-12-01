import 'package:logger/logger.dart';

class Customlogger {
  static final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 50,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  static void logInfo(String message) {
    logger.i(message);
  }

  static void logError(String message) {
    logger.e(message);
  }

  static void logWarning(String message) {
    logger.w(message);
  }

  static void logDebug(String message) {
    logger.d(message);
  }
}
