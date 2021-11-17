import 'package:flutter/material.dart';

class SearchForm extends StatelessWidget {
  final Key? formKey;
  final TextInputType? textInputType;
  final String? hintText;
  late TextEditingController? controller;
  final InputDecoration? inputDecoration;
  final Icon? clearWidget;

  SearchForm({Key? key,
    this.formKey,
    this.textInputType,
    this.hintText,
    TextEditingController? controller,
    this.inputDecoration,
    this.clearWidget,
  }) : super(key: key) {
    this.controller = controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller,
                  decoration: inputDecoration ?? InputDecoration(
                    border: const UnderlineInputBorder(),
                    hintText: hintText ?? 'Search',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: clearWidget ?? InkWell(
              child: const SizedBox(
                width: 48,
                height: 48,
                child: Icon(
                  Icons.clear,
                ),
              ),
              onTap: () {
                controller?.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}