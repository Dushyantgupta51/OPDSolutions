import 'package:flutter/material.dart';
import 'package:opdsolution/ui/constants/images.dart';
import 'package:stacked/stacked.dart';
import '../../bottom_sheets/add_consultation/add_consultation_sheet_model.dart';
import '../../common/app_strings.dart';
import '../../widgets/button.dart';
import '../../widgets/dropdown.dart';
import '../../widgets/input.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black,
            centerTitle: true,
            title:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Image(image: AssetImage(AllIcons().men), height: 30, width: 30),
              const SizedBox(width: 10),
              const Text("Naman Chaudhary",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black))
            ]),
            actions: const [Padding(padding: EdgeInsets.only(right: 16.0))],
            leading: IconButton(
                onPressed: () {
                  // index == 1 ? viewModel.goToSearch() : viewModel.goBack();
                },
                icon: const Icon(Icons.arrow_back, color: Colors.black))),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          // color: AppColors.bgColor,
                          border: Border(
                              right:
                                  BorderSide(color: Colors.white, width: 2.0),
                              bottom:
                                  BorderSide(color: Colors.white, width: 2.0),
                              left: BorderSide(color: Colors.black12, width: 2),
                              top:
                                  BorderSide(color: Colors.black12, width: 2))),
                      padding: const EdgeInsets.all(15),
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Expanded(
                                  flex: 1,
                                  child: Text("Age",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400))),
                              Expanded(flex: 2, child: Text('12'))
                            ]),
                        const SizedBox(height: 7),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Expanded(
                                  flex: 1,
                                  child: Text("Location",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400))),
                              Expanded(
                                  flex: 2, child: Text('jaipur, rajasthan'))
                            ])
                      ])),
                  const SizedBox(height: 20),
                  Container(
                      decoration: const BoxDecoration(
                          // color: AppColors.bgColor,
                          border: Border(
                              right:
                                  BorderSide(color: Colors.white, width: 2.0),
                              bottom:
                                  BorderSide(color: Colors.white, width: 2.0),
                              left: BorderSide(color: Colors.black12, width: 2),
                              top:
                                  BorderSide(color: Colors.black12, width: 2))),
                      padding: const EdgeInsets.all(12),
                      child: Column(children: [
                        basicInfo(const Icon(Icons.person_outline), 'Male'),
                        const SizedBox(height: 10),
                        basicInfo(
                            const Icon(Icons.call_outlined), '+91 8239209316'),
                        const SizedBox(height: 10),
                        basicInfo(const Icon(Icons.location_on_outlined),
                            'swamidhruv058@gmail.com')
                      ])),
                  const SizedBox(height: 22),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(Strings.addNewConsultation,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1765ae))),
                        Text("$Strings.lastVisit March 21, 2023",
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff121010)))
                      ]),
                  const SizedBox(height: 20),
                  viewModel.isCheckOne
                      ? Column(children: [
                          Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xffe8e8ec),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5))),
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 5),
                                  child: Container(
                                      height: 83,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(5)),
                                          color: Color(0xfff8f9ff)),
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(Strings.dateofConsultation,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge),
                                                const SizedBox(height: 10),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      const SizedBox(width: 5),
                                                      Text(
                                                          "${selectedDate.toLocal()}"
                                                              .split(' ')[0],
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      14)),
                                                      Expanded(
                                                          child: Container()),
                                                      GestureDetector(
                                                          child: Image(
                                                              image: AssetImage(
                                                                  AllIcons()
                                                                      .calender),
                                                              height: 14,
                                                              width: 14),
                                                          onTap: () {
                                                            selectFirstDate(
                                                                context);
                                                          })
                                                    ])
                                              ]))))),
                          const SizedBox(height: 20),
                          Input(
                              trailing: Container(
                                  alignment: Alignment.center,
                                  color: Colors.white,
                                  width: 80,
                                  child: const Text("cm",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16))),
                              label: const Text(Strings.height)),
                          const SizedBox(height: 20),
                          Input(
                              trailing: Container(
                                  alignment: Alignment.center,
                                  color: Colors.white,
                                  width: 80,
                                  child: const Text('kg',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16))),
                              label: const Text(Strings.weight)),
                          const SizedBox(height: 20),
                          Input(
                              trailing: Container(
                                  alignment: Alignment.center,
                                  color: Colors.white,
                                  height: double.infinity,
                                  width: 80,
                                  child: const Text("bpm",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16))),
                              label: const Text(Strings.pulse)),
                          const SizedBox(height: 20),
                          Input(
                              trailing: Container(
                                  alignment: Alignment.center,
                                  color: Colors.white,
                                  height: double.infinity,
                                  width: 80,
                                  child: const Text("mmHg",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16))),
                              label: const Text(Strings.bp)),
                          const SizedBox(height: 20),
                          Input(
                              trailing: Container(
                                  alignment: Alignment.center,
                                  color: Colors.white,
                                  height: double.infinity,
                                  width: 80,
                                  child: const Text("F",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16))),
                              label: const Text(Strings.temp)),
                          const SizedBox(height: 20),
                          DropDown(
                              dropDownList: viewModel.reports,
                              initialValue: viewModel.reportsInitName,
                              label: 'Type',
                              onchange: viewModel.reportsNameChange),
                          const SizedBox(height: 20),
                          Container(
                              alignment: Alignment.center,
                              child: Button(
                                  height: 49,
                                  width:
                                      MediaQuery.of(context).size.width * 0.50,
                                  backgroundColor: const Color(0xff1765ae),
                                  onPressed: viewModel.changingUI,
                                  title: Strings.addConsultation,
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18)))
                        ])
                      : Column(children: [
                          Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xffe8e8ec),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5))),
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 5),
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(5)),
                                          color: Color(0xfff9faff)),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                                "Mr.Ramesh Chandra(66y. Male) - 8239209316",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            const SizedBox(height: 10),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text("H: 166 cm",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                        const SizedBox(
                                                            height: 10),
                                                        Text(
                                                            "$Strings.bp: 98/94 mmHg",
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500))
                                                      ]),
                                                  const SizedBox(height: 10),
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: const [
                                                        Text("W: 166 kg",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                        SizedBox(height: 10),
                                                        Text("Temp: 104º F",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500))
                                                      ]),
                                                  Column(children: const [
                                                    Text("P: 98 bpm",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500))
                                                  ])
                                                ])
                                          ])))),
                          const SizedBox(height: 10),
                          FloatingActionButton(
                              onPressed: () {
                                AddConsultationModel().addConsultation();
                              },
                              backgroundColor: const Color(0xff1765ae),
                              child: const Icon(Icons.add, size: 30)),
                          const SizedBox(height: 10),
                          const Text(Strings.addOtherConsultation,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600))
                        ])
                ])));
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}

vitalsInfo(String header) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Padding(
        padding: const EdgeInsets.only(top: 5, left: 5),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(header.toString(),
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ]))
  ]);
}

basicInfo(Widget widget, String details) {
  return Row(children: [
    widget,
    const SizedBox(width: 10),
    Text(details,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400))
  ]);
}

dates(String date, Widget child) {
  return Stack(children: [
    Container(
        padding: const EdgeInsets.fromLTRB(2.5, 3.5, 0, .5),
        height: 55,
        width: 55,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color(0xffc1c7e0)),
        child: SizedBox(
            height: 50,
            width: 50,
            child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: .5,
                      color: Color(0xffcdd1ec),
                      spreadRadius: 1.5,
                      offset: Offset(-2.5, 0),
                      blurStyle: BlurStyle.inner)
                ], shape: BoxShape.circle, color: Color(0xffdde1fd)),
                child: Center(child: child)))),
  ]);
}

DateTime selectedDate = DateTime.now();

Future<void> selectFirstDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1, 1),
      lastDate: DateTime(2024));
  if (picked != null && picked != selectedDate) {}
}
