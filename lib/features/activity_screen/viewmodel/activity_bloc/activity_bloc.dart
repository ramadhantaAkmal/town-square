import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:town_square/features/activity_screen/model/activity_model.dart';
import 'package:town_square/misc/activity_list.dart';

part 'activity_event.dart';
part 'activity_state.dart';
part 'activity_bloc.freezed.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc() : super(_InitialState(activityList)) {
    on<FilterActivity>(onFilterActivity);
  }

  ///Logic for filtering the activity list
  void onFilterActivity(
      FilterActivity event, Emitter<ActivityState> emit) async {
    emit(const _LoadingState());

    ///when the conditions are true it will emit a success state with an initial activity list data
    if (event.categories.contains("all") || event.categories.isEmpty) {
      emit(_SuccessState(activityList));
      return;
    }

    ///this is used for example only when
    if (event.categories.contains("calm")) {
      emit(const _ErrorState("Error found"));
      return;
    }

    ///delayed effect used for showing the loading indicator
    await Future.delayed(const Duration(seconds: 1));
    var activities = event.activities
        .where((item) => event.categories.contains(item.category))
        .toList();

    if (activities.isNotEmpty) {
      emit(_SuccessState(activities));
    } else {
      emit(const _EmptyState());
    }
  }
}
