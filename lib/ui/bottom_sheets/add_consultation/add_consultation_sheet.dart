import 'package:flutter/material.dart';
import 'package:opdsolution/ui/common/app_strings.dart';
import 'package:opdsolution/ui/constants/images.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../widgets/button.dart';
import '../../widgets/dropdown.dart';
import '../../widgets/input.dart';
import 'add_consultation_sheet_model.dart';

class AddConsultation extends StackedView<AddConsultationModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const AddConsultation({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddConsultationModel viewModel,
    Widget? child,
  ) {
    return SizedBox(
        height: 700,
        child: Scaffold(
            appBar: AppBar(
                leading: Image(image: AssetImage(AllIcons().arrowLeft)),
                elevation: 0,
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: const Text(Strings.addConsultation,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700))),
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child:
                    ListView(physics: const BouncingScrollPhysics(), children: [
                  Container(
                      decoration: const BoxDecoration(
                          color: Color(0xffe8e8ec),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 5),
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
                                            Text(
                                                "${selectedDate.toLocal()}"
                                                    .split(' ')[0],
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14)),
                                            Expanded(child: Container()),
                                            GestureDetector(
                                                child: Image(
                                                    image: AssetImage(
                                                        AllIcons().calender),
                                                    height: 14,
                                                    width: 14),
                                                onTap: () {
                                                  selectFirstDate(context);
                                                })
                                          ])
                                    ]),
                              )))),
                  const SizedBox(height: 20),
                  Input(
                      trailing: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          height: double.infinity,
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
                          height: double.infinity,
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
                  const SizedBox(height: 40),
                  Row(children: [
                    Button(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.43,
                        backgroundColor: Colors.white,
                        onPressed: () {},
                        title: Strings.cancel,
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 22)),
                    Expanded(child: Container()),
                    Button(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.43,
                        backgroundColor: const Color(0xff1765ae),
                        onPressed: viewModel.navigateToSearchList,
                        title: Strings.save,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 22))
                  ])
                ]))));
  }

  @override
  AddConsultationModel viewModelBuilder(BuildContext context) =>
      AddConsultationModel();
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
