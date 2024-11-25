class ActivityModel {
  final String activityName;
  final String time;
  final int duration;
  final String location;
  final int spots;
  final String intensity;
  String? category;
  final int price;

  ActivityModel({
    required this.activityName,
    required this.time,
    required this.duration,
    required this.location,
    required this.spots,
    required this.intensity,
    required this.price,
    this.category,
  });
}
