import 'package:logger/logger.dart';

final logger = Logger(printer: PrettyPrinter(), filter: EnableLogging());

/// Class which enables logging everywhere
class EnableLogging extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
