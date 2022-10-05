// TODO Implement this library.
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);

void vLog(dynamic message) {
  logger.v(message);
}

void dLog(dynamic message) {
  logger.d(message);
}
