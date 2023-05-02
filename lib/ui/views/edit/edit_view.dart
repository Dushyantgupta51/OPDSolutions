import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:opdsolution/ui/common/ui_helpers.dart';

import 'edit_viewmodel.dart';

class EditView extends StackedView<EditViewModel> {
  const EditView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
      const Text('STACKED',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
      Row(mainAxisSize: MainAxisSize.min, children: const [
        Text('Loading ...', style: TextStyle(fontSize: 16)),
        horizontalSpaceSmall,
        SizedBox(
            width: 16,
            height: 16,
            child:
                CircularProgressIndicator(color: Colors.black, strokeWidth: 6))
      ])
    ])));
  }

  @override
  EditViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EditViewModel();

  @override
  void onViewModelReady(EditViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
