import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/cache/cache_helper.dart';
import 'package:revive/core/di/dependancy_injection.dart';
import 'package:revive/core/network/supabase/database/add_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'category_details_state.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  CategoryDetailsCubit() : super(CategoryDetailsInitial());

  //! slider
  double _sliderValue = 5;
  double get sliderValue => _sliderValue;

  void changeSliderValue(double value) {
    _sliderValue = value;
    emit(ChangeCategoryDetailsSlider(value: _sliderValue));
  }

  //! selected index
  int _selectedIndex = -1;
  int get selectedIndex => _selectedIndex;

  void changeSelectedIndex(int index) {
    _selectedIndex = index;
    emit(ChangeSelectedProduct(index: _selectedIndex));
  }

  //! add request
  String? productName, categoryName;
  String? productPrice, productQuantity;
  Future<void> addRequest() async {
    if (productName != null &&
        productPrice != null &&
        productQuantity != null &&
        categoryName != null) {
      try {
        emit(AddRequestLoading());

        await addData(
          tableName: "recycle_request",
          data: {
            "category_name": categoryName!.tr(),
            "product_name": productName!.tr(),
            "product_quantity": productQuantity,
            "product_price": productPrice,
            "user_id": getIt<SupabaseClient>().auth.currentUser!.id,
            "user_name": getIt<CacheHelper>().getUserModel()!.name,
          },
        );

        emit(AddRequestSuccess());
      } on Exception catch (e) {
        emit(AddRequestFailed(errorMessage: e.toString()));
      }
    } else {
      emit(FillAllRequestField());
    }
  }
}
