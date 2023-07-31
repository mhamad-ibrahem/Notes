import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../firebase_options.dart';
import '../Class/HiveBox.dart';

class Services extends GetxService {
  //i use it for intialize all data i need insted of intialize it in the main funcation
  late Box box;
  late final FirebaseApp app;
  late final FirebaseAuth auth;
  Future<Services> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox(HiveBox.authBox);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // auth = FirebaseAuth.instanceFor(app: app);
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => Services().init());
}
