import 'package:get/get.dart';
import 'package:lms/routes/routes_named.dart';
import 'package:lms/services/storage_service.dart';
import 'package:lms/utils/helper.dart';
import 'package:lms/utils/storage_keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<void> login(
    String email,
    String password,
  ) async {
    isLoading.value = true;

    try {
      isLoading.value = true;
      final AuthResponse response = await _supabase.auth
          .signInWithPassword(email: email, password: password);

      if (response.user != null) {
        StorageService.session
            .write(StorageKeys.userSession, response.session!.toJson());
        print(response.session);
        Get.offAllNamed(RoutesNamed.home);
      }
      isLoading.value = false;
    } on AuthException catch (e) {
      isLoading.value = false;
      showSnackBar("Error", e.message);
    }
  }

  Future<void> signUpWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      isLoading.value = true;
      final AuthResponse data = await _supabase.auth
          .signUp(email: email, password: password, data: {"name": name});

      if (data.user != null) {
        StorageService.session
            .write(StorageKeys.userSession, data.session!.toJson());
        print(data.session);
        Get.offAllNamed(RoutesNamed.home);
      }
      isLoading.value = false;
    } on AuthException catch (e) {
      isLoading.value = false;
      showSnackBar("Error", e.message);
    }
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
