import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final String label;
  final String initialValue;
  final List<String> dropDownList;
  final Function onchange;
  const DropDown(
      {required this.label,
      required this.initialValue,
      required this.dropDownList,
      required this.onchange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              height: 80,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                  color: Color(0xfff8f9ff)),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(label,
                            style: Theme.of(context).textTheme.bodyLarge),
                        DropdownButton(
                            underline: const SizedBox(),
                            isExpanded: true,
                            style: Theme.of(context).textTheme.titleMedium,
                            elevation: 0,
                            value: initialValue,
                            icon: const Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: Icon(Icons.keyboard_arrow_down)),
                            items: dropDownList.map((String items) {
                              return DropdownMenuItem(
                                  value: items, child: Text(items));
                            }).toList(),
                            onChanged: (value) {
                              onchange(value);
                            })
                      ]))),
        ));
  }
}
