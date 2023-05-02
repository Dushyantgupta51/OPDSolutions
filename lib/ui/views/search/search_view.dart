import 'package:flutter/material.dart';
import 'package:opdsolution/ui/constants/images.dart';
import 'package:opdsolution/ui/views/search/search_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_strings.dart';

TextEditingController searchingController = TextEditingController();

class SearchView extends StackedView<SearchViewModel> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SearchViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
            leading: Image(image: AssetImage(AllIcons().icon)),
            backgroundColor: const Color(0xfff2f4ff),
            elevation: 0,
            title: Row(children: const [
              SizedBox(width: 60),
              Text(Strings.searchUser,
                  style: TextStyle(color: Colors.black, fontSize: 18))
            ])),
        backgroundColor: const Color(0xfff2f4ff),
        body: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: ListView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 10),
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xffcdd1ec),
                                    blurRadius: 5,
                                    spreadRadius: 2,
                                    offset: Offset(-1, -1),
                                    blurStyle: BlurStyle.inner)
                              ],
                              color: Color(0xffd6daf5),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  bottomRight: Radius.circular(6),
                                  topRight: Radius.circular(2),
                                  bottomLeft: Radius.circular(2))),
                          child: TextFormField(
                              controller: searchingController,
                              onChanged: (value) {
                                viewModel.onSerach(value);
                              },
                              decoration: InputDecoration(
                                  hintStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                  border: InputBorder.none,
                                  hintText: '8239209316',
                                  icon: Image(
                                      image: AssetImage(AllIcons().search),
                                      height: 20,
                                      width: 20)))),
                      const SizedBox(height: 25),
                      searchingController.text.isNotEmpty
                          ? filteredResults()
                          : allResults(),
                      const SizedBox(height: 20),
                      Center(
                          child: Column(children: [
                        FloatingActionButton(
                            onPressed: viewModel.gotoHomePage,
                            backgroundColor: const Color(0xff1765ae),
                            child: const Icon(Icons.add, size: 33)),
                        const SizedBox(height: 10),
                        const Text(Strings.addKid,
                            style: TextStyle(
                                color: Color(0xff1765ae),
                                fontSize: 15,
                                letterSpacing: .3,
                                fontWeight: FontWeight.bold))
                      ]))
                    ])));
  }

  @override
  SearchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchViewModel();
}

Widget allResults() {
  return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: response.length,
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffcdd1ec),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(-1, -1),
                      blurStyle: BlurStyle.inner)
                ],
                color: Color(0xffd6daf5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                    topRight: Radius.circular(2),
                    bottomLeft: Radius.circular(2))),
            child: ListTile(
                leading: Image(image: AssetImage(AllIcons().menSecond)),
                title: Text(response[index].name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: .5)),
                subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(response[index].email,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11.5,
                              color: Colors.black54)),
                      Image(
                          image: AssetImage(AllIcons().vector),
                          height: 12,
                          width: 12)
                    ])));
      });
}

Widget filteredResults() {
  return searchList.isNotEmpty
      ? ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: searchList.length,
          itemBuilder: (context, index) {
            return Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffcdd1ec),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(-1, -1),
                          blurStyle: BlurStyle.inner)
                    ],
                    color: Color(0xffd6daf5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                        topRight: Radius.circular(2),
                        bottomLeft: Radius.circular(2))),
                child: ListTile(
                    leading: Image(image: AssetImage(AllIcons().menSecond)),
                    title: Text(searchList[index].name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: .5)),
                    subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(searchList[index].email,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.5,
                                  color: Colors.black54)),
                          Image(
                              image: AssetImage(AllIcons().vector),
                              height: 12,
                              width: 12)
                        ])));
          })
      : const Center(child: Text(Strings.resultNotFound));
}
