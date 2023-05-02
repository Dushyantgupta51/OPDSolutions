import 'package:opdsolution/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';

class AddConsultationModel extends BaseViewModel {
  final bottomsheetService = locator<BottomSheetService>();
  String reportsInitName = 'Reports Check';
  List<String> reports = ['Reports Check', 'Reports Uncheck', 'Type'];
  reportsNameChange(value) {
    reportsInitName = value;
    notifyListeners();
  }

  Future<void> addConsultation() async {
    bottomsheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.addConsultation,
    );
  }

  final navigatoinService = locator<NavigationService>();
  navigateToSearchList() {
    navigatoinService.navigateTo(Routes.searchView);
  }
}
