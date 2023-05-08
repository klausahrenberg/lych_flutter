LLogLevel logLevel = LLogLevel.DEBUGGING;

enum LLogLevel { DEBUGGING, RUNTIME }

abstract class LLog {
  static void _debug(Object source, final String dMode, final bool printAsError,
      String message,
      [final Error? exception]) {
    if (logLevel == LLogLevel.DEBUGGING) {
      message =
          "(" + dMode + ") " + source.runtimeType.toString() + ": " + message;
      if (exception != null) {
        message += " / " +
            exception.runtimeType.toString() +
            ": " +
            exception.toString();
      }
      _printToConsole(message, ((printAsError) || (exception != null)));
    }
  }

  static void test(Object source, String message) {
    _debug(source, "test", false, message);
  }

  static void debug(Object source, String message) {
    _debug(source, "debug", false, message);
  }

  static void error(Object source, Error ex) {
    _debug(source, "error", true, ex.toString(), ex);
  }

  static void _printToConsole(final String message, final bool printAsError) {
    if (printAsError) {
      print(message);
    } else {
      print(message);
    }
  }
}
