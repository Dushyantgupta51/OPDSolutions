// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/add_consultation/add_consultation_sheet.dart';

enum BottomSheetType {
  addConsultation,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.addConsultation: (context, request, completer) =>
        AddConsultation(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
