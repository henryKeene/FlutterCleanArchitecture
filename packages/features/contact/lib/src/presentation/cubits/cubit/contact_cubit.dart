import 'package:contact/contact.dart';
import 'package:core_authentication/core_authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit(this._contactNavigation, this._firebaseAuthService)
      : super(ContactInitial());

  final IContactNavigation _contactNavigation;
  final IFirebaseAuthService _firebaseAuthService;

  void navigateToLogging() {
    _contactNavigation.navigateToLogging();
  }

  void navigateToThemeShowcase() {
    _contactNavigation.navigateToThemeShowcase();
  }

  void openOfflineModal() {
    _contactNavigation.openOfflineModal();
  }

  void logout() {
    _firebaseAuthService.signOut().run();
  }
}
