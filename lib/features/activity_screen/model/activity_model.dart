class ActivityModel {
  final String activityName;
  final String time;
  final String duration;
  final String location;
  final int spots;
  final String intensity;
  String? category;
  final String price;
  final bool joined;

  ActivityModel({
    required this.activityName,
    required this.time,
    required this.duration,
    required this.location,
    required this.spots,
    required this.intensity,
    required this.price,
    required this.joined,
    this.category,
  });
}
