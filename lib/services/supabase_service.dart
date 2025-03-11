import 'dart:io';

import 'package:get/get.dart';
import 'package:lms/utils/helper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class SupabaseService extends GetxController {
  static final SupabaseClient client = Supabase.instance.client;
  static const String S3_BUCKET = 'lms_s3';

  // Reactive user state
  Rx<User?> currentUser = Rx<User?>(null);

  RxMap<String, dynamic> userData = RxMap<String, dynamic>();

  @override
  void onInit() {
    super.onInit();
    currentUser.value = client.auth.currentUser;
    print("On init called");
    // listenToAuthChanges();
    if (currentUser.value != null) {
      fetchUserData();
    }
  }

  /// Listen to authentication changes and update the user state
  // void listenToAuthChanges() {
  //   client.auth.onAuthStateChange.listen((data) {
  //     final AuthChangeEvent event = data.event;

  //     if (event == AuthChangeEvent.signedIn ||
  //         event == AuthChangeEvent.userUpdated ||
  //         event == AuthChangeEvent.tokenRefreshed) {
  //       currentUser.value = data.session?.user;
  //       fetchUserData();
  //     } else if (event == AuthChangeEvent.signedOut) {
  //       currentUser.value = null;
  //       userData.clear();
  //     }
  //   });
  // }

  /// Fetch user data from the `user` table
  Future<void> fetchUserData() async {
    try {
      final user = client.auth.currentUser;

      if (user == null) {
        print('No user is logged in.');
        return;
      }

      final response = await client
          .from('user')
          .select(
            'full_name, image, skills, bio',
          )
          .eq('id', user.id)
          .single();

      userData.assignAll(response);
      print(' User data fetched: $response');
    } catch (error) {
      print(' Error fetching user data: $error');
    }
  }

  // Function to upload video to Supabase Storage
}
