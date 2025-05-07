import 'package:core_authentication/src/data/services/firebase_auth_service.dart';
import 'package:core_authentication/src/domain/interfaces/i_firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

void initialize() {
  final firebaseAuth = FirebaseAuth.instance;
  GetIt.I.registerFactory<FirebaseAuth>(() => firebaseAuth);
  GetIt.I.registerFactory<IFirebaseAuthService>(
    () => FirebaseAuthService(
      GetIt.I(),
    ),
  );
}
