import 'dart:math';

class GUIDGen {

  static String generate() {    
    final String hexDigits = "0123456789abcdef";
    var random = Random();
    var uuid = StringBuffer();

    for (int m = 0; m < 4; m++) {
      for (int i = 0; i < 8; i++) {
        final int hexPos = random.nextInt(16);
        uuid.write(hexDigits[hexPos]);
      }
      if (m < 3) uuid.write("-");
    }
    return uuid.toString();
  }
  
}