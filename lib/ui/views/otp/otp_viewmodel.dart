import 'package:flutter/material.dart';
import 'package:opdsolution/ui/views/otp/otp_view.form.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class OtpViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
    super.setFormStatus();
  }

  switchFocus(String value, BuildContext context) {
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    } else if (value.length != 1) {
      FocusScope.of(context).previousFocus();
    }
  }

  bool isFormValid() {
    if (otpDigit1Value != null &&
        otpDigit2Value != null &&
        otpDigit3Value != null &&
        otpDigit4Value != null) {
      return (otpDigit1Value!.trim().isNotEmpty &&
          otpDigit2Value!.trim().isNotEmpty &&
          otpDigit3Value!.trim().isNotEmpty &&
          otpDigit4Value!.trim().isNotEmpty);
    }
    return false;
  }

  Future goToHomeView() async {
    // await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.navigateTo(Routes.profileView);
  }
}
