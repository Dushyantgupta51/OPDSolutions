import 'package:opdsolution/app/app.bottomsheets.dart';
import 'package:opdsolution/app/app.dialogs.dart';
import 'package:opdsolution/app/app.locator.dart';
import 'package:opdsolution/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  String reportsInitName = 'Reports Check';
  List<String> reports = ['Reports Check', 'Reports Uncheck', 'Type'];
  reportsNameChange(value) {
    reportsInitName = value;
    notifyListeners();
  }

  bool isCheckOne = true;
  changingUI() {
    isCheckOne = false;
    notifyListeners();
  }

  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.addConsultation,
      title: Strings.ksHomeBottomSheetTitle,
      description: Strings.ksHomeBottomSheetDescription,
    );
  }
}
