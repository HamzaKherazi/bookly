import 'package:bloc/bloc.dart';
import 'package:bookly/features/book_request/data/models/request_model.dart';
import 'package:bookly/features/book_request/data/repos/request_repo.dart';
import 'package:meta/meta.dart';

part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit(this.requestRepo) : super(RequestInitial());

  final RequestRepo requestRepo;

  Future<void> addRequest({required RequestModel request}) async {
    emit(RequestLoading());
    final result = await requestRepo.addRequest(request: request);
    result.fold(
      (failure) => emit(RequestFailure(errorMessage: failure.errMessage)),
      (isAdded) => isAdded
          ? emit(RequestSuccess())
          : emit(RequestFailure(errorMessage: 'Failed to submit request')),
    );
  }
}
