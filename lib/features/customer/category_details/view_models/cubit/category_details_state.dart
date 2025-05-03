part of 'category_details_cubit.dart';

abstract class CategoryDetailsState {}

final class CategoryDetailsInitial extends CategoryDetailsState {}

final class ChangeCategoryDetailsSlider extends CategoryDetailsState {
  final double value;

  ChangeCategoryDetailsSlider({required this.value});
}

final class ChangeSelectedProduct extends CategoryDetailsState {
  final int index;

  ChangeSelectedProduct({required this.index});
}

// add request state
final class AddRequestSuccess extends CategoryDetailsState {}

final class AddRequestFailed extends CategoryDetailsState {
  final String errorMessage;

  AddRequestFailed({required this.errorMessage});
}

final class AddRequestLoading extends CategoryDetailsState {}

final class FillAllRequestField extends CategoryDetailsState {}
