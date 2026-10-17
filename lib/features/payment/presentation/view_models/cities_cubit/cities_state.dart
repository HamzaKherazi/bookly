part of 'cities_cubit.dart';

@immutable
sealed class CitiesState {}

final class CitiesInitial extends CitiesState {}

final class CitiesLoading extends CitiesState {}

final class CitiesSuccess extends CitiesState {
  final List<CityModel> cities;

  CitiesSuccess(this.cities);
}

final class CitiesError extends CitiesState {
  final String message;

  CitiesError(this.message);
}
