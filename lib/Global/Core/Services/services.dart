import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/Global/Core/Class/HiveKeys.dart';
import '../../../firebase_options.dart';
import '../Class/HiveBox.dart';

class Services extends GetxService {
  //i use it for initialized all data i need instead of initialize it in the main function
  static String userId = '';
  late Box box;
  late final FirebaseApp app;
  late final FirebaseAuth auth;
  Future<Services> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox(HiveBox.authBox);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (box.get(HiveKeys.idKey) != null) {
      userId = box.get(HiveKeys.idKey);
    }
    // auth = FirebaseAuth.instanceFor(app: app);
    // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => Services().init());
}
