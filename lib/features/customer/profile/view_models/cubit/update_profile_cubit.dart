import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:revive/core/cache/cache_helper.dart';
import 'package:revive/core/di/dependancy_injection.dart';
import 'package:revive/core/helper/pick_image.dart';
import 'package:revive/core/network/supabase/storage/upload_file.dart';
import 'package:revive/features/auth/sign_in/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial()) {
    getUserData();
  }

  void getUserData() {
    user = getIt<CacheHelper>().getUserModel()!;
    nameController.text = user!.name;
    emailController.text = user!.email;
    addressController.text = user!.address;
  }

  File? file;
  UserModel? user;
  String? imagePath;
  final supabase = getIt<SupabaseClient>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  //
  pickImage() async {
    emit(PickImageLoading());
    await pickAndUploadImages().then(
      (value) {
        if (value != null) {
          file = value.first;
        }
      },
    );
    emit(PickImageSuccess());
  }

  //
  updateProfile() async {
    if (nameController.text != user!.name ||
        emailController.text != user!.email ||
        addressController.text != user!.address ||
        file != null) {
      if (file != null) {
        imagePath = await uploadFileToSupabaseStorage(file: file!);
      }
      try {
        emit(UpdateProfileLoading());
        await supabase.from('customerss').update({
          if (nameController.text != user!.name) 'name': nameController.text,
          if (nameController.text != user!.email) 'email': emailController.text,
          if (nameController.text != user!.address)
            'address': addressController.text,
          if (imagePath != null) 'image': imagePath
        }).eq('id', supabase.auth.currentUser!.id);
        await saveUserData();
        emit(UpdateProfileSuccess());
      } on Exception catch (e) {
        emit(UpdateProfileFailed(message: e.toString()));
      }
    } else {
      emit(NoChanges());
    }
  }

  Future<void> saveUserData() async {
    var data = await getIt<SupabaseClient>()
        .from("customerss")
        .select()
        .eq('id', supabase.auth.currentUser!.id)
        .single();
    await getIt<CacheHelper>().saveUserModel(UserModel.fromJson(data));
    getUserData();
  }
}
