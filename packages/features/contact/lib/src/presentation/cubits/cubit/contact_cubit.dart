import 'package:contact/contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit(this._contactNavigation) : super(ContactInitial());

  final IContactNavigation _contactNavigation;

  void navigateToLogging() {
    _contactNavigation.navigateToLogging();
  }

  void navigateToThemeShowcase() {
    _contactNavigation.navigateToThemeShowcase();
  }
}
