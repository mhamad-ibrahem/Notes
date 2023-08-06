import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../../Global/Core/Class/StatusRequest.dart';
import '../model/user_model.dart';

abstract class ProfileController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  StatusRequest statusRequest = StatusRequest.none;
  bool canReGet = true;
  late UserModel userModel;

  //factions
  getUserData();
  reDownloadImage();
}
