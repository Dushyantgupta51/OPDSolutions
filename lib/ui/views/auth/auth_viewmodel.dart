import 'auth_view.form.dart';
import 'package:stacked/stacked.dart';
import '/app/app.locator.dart';
import '/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
    super.setFormStatus();
  }

  bool isFormValid() {
    if (phoneNumberValue != null) {
      return phoneNumberValue!.trim().isNotEmpty &&
          (phoneNumberValue!.length == 10);
    } else {
      return false;
    }
  }

  // Place anything here that needs to happen before we get into the application
  Future goToOtpView() async {
    // await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.navigateTo(Routes.otpView);
  }
}
