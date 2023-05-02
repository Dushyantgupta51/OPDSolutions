import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../models/usermodel.dart';

List<Usermodel> response = [];
List searchList = [];

class SearchViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  gotoHomePage() {
    navigationService.navigateTo(Routes.profileView);
  }

  Future<void> getResponse() async {
    try {
      setBusy(true);
      await Dio().get('https://gorest.co.in/public/v2/comments').then((value) {
        for (var element in value.data) {
          response.add(Usermodel(
              id: element['id'],
              postId: element['post_id'],
              name: element['name'],
              email: element['email'],
              body: element['body']));
        }
      });
      notifyListeners();
    } finally {
      setBusy(false);
    }
  }

  void onSerach(String value) {
    if (value.isNotEmpty) {
      searchList = response
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
