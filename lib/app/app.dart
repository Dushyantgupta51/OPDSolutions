import 'package:opdsolution/ui/bottom_sheets/add_consultation/add_consultation_sheet.dart';
import 'package:opdsolution/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:opdsolution/ui/views/profile/profile_view.dart';
import 'package:opdsolution/ui/views/edit/edit_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/search/search_view.dart';
import 'package:opdsolution/services/api_service.dart';
import 'package:opdsolution/ui/views/auth/auth_view.dart';
import 'package:opdsolution/ui/views/otp/otp_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: EditView),
    MaterialRoute(page: SearchView),
    MaterialRoute(page: AuthView),
    MaterialRoute(page: OtpView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: AddConsultation),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
