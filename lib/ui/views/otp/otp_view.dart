import 'package:flutter/material.dart';
import 'package:opdsolution/ui/views/otp/otp_view.form.dart';
// import 'package:opdsolutionui/ui/views/otp/otp_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../common/ui_helpers.dart';
// import '../../common/widgets/button.dart';
// import '../../common/widgets/input.dart';
import '../../widgets/button.dart';
import '../../widgets/input.dart';
import 'otp_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'otpDigit1'),
  FormTextField(name: 'otpDigit2'),
  FormTextField(name: 'otpDigit3'),
  FormTextField(name: 'otpDigit4'),
])
class OtpView extends StackedView<OtpViewModel> with $OtpView {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OtpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: const BoxDecoration(),
        width: screenWidth(context),
        height: screenHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Enter OTP',
                style: Theme.of(context).textTheme.headlineLarge),
            verticalSpaceSmall,
            Text(
                'A four digit code just sent to your number  +91-82xxxxxx16',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium),
            verticalSpaceMedium,
            Row(
              children: [
                horizontalSpaceSmall,
                Expanded(
                    child: Input(
                        onChanged: (p0) =>
                            viewModel.switchFocus(p0, context),
                        controller: otpDigit1Controller,
                        textAlign: TextAlign.center,
                        maxLength: 1)),
                horizontalSpaceSmall,
                Expanded(
                    child: Input(
                        onChanged: (p0) =>
                            viewModel.switchFocus(p0, context),
                        controller: otpDigit2Controller,
                        textAlign: TextAlign.center,
                        maxLength: 1)),
                horizontalSpaceSmall,
                Expanded(
                    child: Input(
                        onChanged: (p0) =>
                            viewModel.switchFocus(p0, context),
                        controller: otpDigit3Controller,
                        textAlign: TextAlign.center,
                        maxLength: 1)),
                horizontalSpaceSmall,
                Expanded(
                    child: Input(
                  onChanged: (p0) =>
                      viewModel.switchFocus(p0, context),
                  controller: otpDigit4Controller,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                )),
                horizontalSpaceSmall,
              ],
            ),
            verticalSpaceMedium,
            Button(
              height: 66,
              backgroundColor:
                  const Color.fromARGB(255, 23, 101, 174),
              onPressed: viewModel.isFormValid()
                  ? viewModel.goToHomeView
                  : null,
              title: 'Authenticate',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Didn’t receive code?',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(
                    onPressed: () {
                      viewModel.goToHomeView;
                    },
                    child: const Text('Resend')),
                Text(
                  '00:59',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  OtpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtpViewModel();
  @override
  void onViewModelReady(OtpViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(OtpViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
