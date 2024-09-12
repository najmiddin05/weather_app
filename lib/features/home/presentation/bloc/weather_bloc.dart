import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/either/either.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/home/data/models/weather_data.dart';
import 'package:weather_app/features/home/domain/repository/home_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final HomeRepository repository;
  WeatherBloc({required this.repository}) : super(const WeatherState()) {
    on<GetAllWeatherEvent>(_getAllWeatherData);
  }
  void _getAllWeatherData(GetAllWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(const WeatherState(status: WeatherStatus.loading));

    final Either<Failure, WeatherData> result = await repository.getAllWeatherData(latitude: event.latitude, longitude: event.longitude);
    result.fold((Failure l) {
      emit(state.copyWith(
        status: WeatherStatus.error,
        errorMessage: (l as ServerFailure).message,
      ));
    }, (WeatherData r) {
      emit(
        state.copyWith(
          country: event.country,
          image: event.image,
          data: r,
          status: WeatherStatus.success,
        ),
      );
    });
  }
}
