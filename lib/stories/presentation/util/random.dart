import 'dart:math';

int generateRandomNumber(int min, int max) {
  final random = Random();
  return min + random.nextInt(max - min + 1);
}
