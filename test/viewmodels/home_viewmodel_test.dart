import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:opdsolution/app/app.bottomsheets.dart';
import 'package:opdsolution/app/app.locator.dart';
import 'package:opdsolution/ui/common/app_strings.dart';
import 'package:opdsolution/ui/views/profile/profile_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  ProfileViewModel _getModel() => ProfileViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('incrementCounter -', () {
      test('When called once should return  Counter is: 1', () {
        final model = _getModel();
        model.incrementCounter();
        expect(model.counterLabel, 'Counter is: 1');
      });
    });

    group('showBottomSheet -', () {
      test('When called, should show custom bottom sheet using notice variant',
          () {
        final bottomSheetService = getAndRegisterBottomSheetService();

        final model = _getModel();
        model.showBottomSheet();
        verify(bottomSheetService.showCustomSheet(
          variant: BottomSheetType.addConsultation,
          title: Strings.ksHomeBottomSheetTitle,
          description: Strings.ksHomeBottomSheetDescription,
        ));
      });
    });
  });
}
