import 'dart:math';

// https://codeburst.io/top-7-date-methods-you-should-know-dart-6ce2b5f67090

DateTime getRandomDate()
{
  final int num =  Random().nextInt(100);
  DateTime now = DateTime.now();

  DateTime notNow = now.add(Duration(days: num));
  return notNow;

}

int getRandomInt () => 100 + Random().nextInt(100);

double getRandomDouble () => 100 + (Random().nextDouble() * 100).roundToDouble();