import 'package:town_square/features/activity_screen/model/activity_model.dart';

List<ActivityModel> activityList = [
  ActivityModel(
    activityName: "Beach Yoga",
    time: "08:00",
    duration: 60,
    location: "La Playa de la Rada",
    spots: 8,
    intensity: "light",
    price: 9,
  ),
  ActivityModel(
      activityName: "Reformer Pilates",
      time: "09:00",
      duration: 60,
      location: "Wellness Studio",
      spots: 3,
      intensity: "medium",
      price: 15,
      category: "childcare"),
  ActivityModel(
      activityName: "5-a-side Football",
      time: "12:30",
      duration: 45,
      location: "Municipal Sports Center",
      spots: 0,
      intensity: "high",
      price: 19,
      category: "childcare"),
  ActivityModel(
      activityName: "5-a-side Football",
      time: "16:00",
      duration: 60,
      location: "Municipal Sports Center",
      spots: 4,
      intensity: "high",
      price: 19,
      category: "childcare"),
];
