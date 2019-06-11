
/*
WEIGHT HISTORY CLASS
 */
class WeightItem implements Comparable<WeightItem>{
  double weight;
  DateTime dateTime;
  String note;

  WeightItem({this.weight, this.dateTime, this.note});

  int compareTo(WeightItem other) {
    int order = dateTime.compareTo(other.dateTime);
      return order;
  }

}
