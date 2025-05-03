import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/di/dependancy_injection.dart';
import 'package:revive/core/network/supabase/database/get_stream_data_with_spcific_id.dart';
import 'package:revive/features/company/company_home/models/request_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'get_recycle_request_state.dart';

class GetRecycleRequestCubit extends Cubit<GetRecycleRequestState> {
  GetRecycleRequestCubit() : super(GetRecycleRequestInitial()) {
    getAllRecycleRequest();
  }

  StreamSubscription? subscription;
  int retryCount = 0;
  final int maxRetries = 3;
  List<RequestModel> requests = [];
  List<RequestModel> newRequests = [];
  List<RequestModel> completeRequests = [];
  void getAllRecycleRequest() {
    subscription?.cancel();
    emit(GetRecycleRequestLoading());
    subscription = streamDataWithSpecificId(
      tableName: "recycle_request",
      primaryKey: "company_id",
      id: getIt<SupabaseClient>().auth.currentUser!.id,
    ).listen(
      (data) {
        if (isClosed) return;
        retryCount = 0;
        if (data.isNotEmpty) {
          requests = data.map((e) => RequestModel.fromJson(e)).toList();
          newRequests.clear();
          completeRequests.clear();
          for (var element in requests) {
            if (element.completeRequest) {
              completeRequests.add(element);
            } else {
              newRequests.add(element);
            }
          }
          emit(GetRecycleRequestSuccess());
        } else {
          emit(GetRecycleRequestFailure(errorMessage: "No requests found"));
        }
      },
      onError: (error) {
        if (isClosed) return;
        retryCount++;
        if (retryCount >= maxRetries) {
          emit(GetRecycleRequestFailure(errorMessage: error.toString()));
        } else {
          getAllRecycleRequest();
        }
      },
      cancelOnError: true,
    );
  }

  //! complete request
  Future<void> completeRequest(String requestId) async {
    try {
      if (isClosed) return;
      emit(UpdateRequestLoading());
      await getIt<SupabaseClient>()
          .from("recycle_request")
          .update({"complete_request": true}).eq("id", requestId);

      if (isClosed) return;
      emit(UpdateRequestSuccess());
    } on Exception catch (e) {
      if (isClosed) return;
      emit(UpdateRequestFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
