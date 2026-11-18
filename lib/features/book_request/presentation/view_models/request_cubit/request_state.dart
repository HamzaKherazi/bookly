part of 'request_cubit.dart';

@immutable
sealed class RequestState {}

final class RequestInitial extends RequestState {}

final class RequestLoading extends RequestState {}

final class RequestSuccess extends RequestState {}

final class RequestFailure extends RequestState {
  final String errorMessage;

  RequestFailure({required this.errorMessage});
}
