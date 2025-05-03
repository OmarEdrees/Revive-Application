part of 'update_profile_cubit.dart';

@immutable
sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}
final class UpdateProfileLoading extends UpdateProfileState {}
final class UpdateProfileSuccess extends UpdateProfileState {}
final class UpdateProfileFailed extends UpdateProfileState {
  final String message;

  UpdateProfileFailed({required this.message});
}
final class NoChanges extends UpdateProfileState {}
// 
final class PickImageLoading extends UpdateProfileState {}
final class PickImageSuccess extends UpdateProfileState {}
final class PickImageFailed extends UpdateProfileState {
  final String message;

  PickImageFailed({required this.message});
}
