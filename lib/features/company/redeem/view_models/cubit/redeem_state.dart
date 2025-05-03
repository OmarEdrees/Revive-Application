part of 'redeem_cubit.dart';

@immutable
sealed class RedeemState {}

final class RedeemInitial extends RedeemState {}

final class RedeemLoading extends RedeemState {}

final class RedeemSuccess extends RedeemState {}

final class RedeemFailure extends RedeemState {
  final String errorMessage;

  RedeemFailure({required this.errorMessage});
}
