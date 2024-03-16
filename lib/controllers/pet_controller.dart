import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/service/auth_service.dart';

class PetController extends GetxController {
  static PetController get instance => Get.find();
  var data = [].obs;
  var isLoading = false.obs;

  Future<dynamic> getPets() async {
    isLoading.value = true;
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("pets").get();
      data.assignAll(querySnapshot.docs.map((doc) => doc.data()));
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      debugPrint("get pet error $e");
    }
  }
}
