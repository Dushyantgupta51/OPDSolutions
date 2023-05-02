import 'package:flutter/material.dart';
import 'package:opdsolution/ui/views/auth/auth_view.form.dart';
// import 'package:opdsolutionui/ui/views/auth/auth_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../common/ui_helpers.dart';
// import '../../common/widgets/button.dart';
// import '../../common/widgets/input.dart';
import '../../widgets/button.dart';
import '../../widgets/input.dart';
import 'auth_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'phoneNumber'),
])
class AuthView extends StackedView<AuthViewModel> with $AuthView {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AuthViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 10),
            decoration: const BoxDecoration(),
            width: screenWidth(context),
            height: screenHeight(context),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Login',
                      style: TextStyle(
                          fontSize: 26, fontWeight: FontWeight.w700)),
                  verticalSpaceSmall,
                  const Text('Enter Registered Number',
                      style: TextStyle(
                          color: Color(0xff17181a),
                          fontWeight: FontWeight.w400,
                          fontSize: 14)),
                  verticalSpaceMedium,
                  verticalSpaceTiny,
                  const Input(
                      // height: 72,
                      hintText: '+91',
                      // controller: phoneNumberController,
                      maxLength: 10),
                  verticalSpaceMedium,
                  Button(
                      height: 66,
                      onPressed: viewModel.goToOtpView,
                      title: 'Send OTP',
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 22),
                      backgroundColor: const Color(0xff1765ae))
                ])));
  }

  @override
  AuthViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AuthViewModel();
  @override
  void onViewModelReady(AuthViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(AuthViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
