part of 'get_recycle_request_cubit.dart';

sealed class GetRecycleRequestState {}

final class GetRecycleRequestInitial extends GetRecycleRequestState {}

final class GetRecycleRequestLoading extends GetRecycleRequestState {}

final class GetRecycleRequestSuccess extends GetRecycleRequestState {}

final class GetRecycleRequestFailure extends GetRecycleRequestState {
  final String errorMessage;

  GetRecycleRequestFailure({required this.errorMessage});
}

//! update request state
final class UpdateRequestLoading extends GetRecycleRequestState {}

final class UpdateRequestSuccess extends GetRecycleRequestState {}

final class UpdateRequestFailure extends GetRecycleRequestState {
  final String errorMessage;

  UpdateRequestFailure({required this.errorMessage});
}
