import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class SearchForm extends StatelessWidget {
  final Key? formKey;
  final TextInputType? textInputType;
  final String? hintText;
  final TextEditingController controller;
  final InputDecoration? inputDecoration;
  final Icon? clearWidget;

  SearchForm({
    Key? key,
    this.formKey,
    this.textInputType,
    this.hintText,
    TextEditingController? controller,
    this.inputDecoration,
    this.clearWidget,
  })  : controller = controller ?? TextEditingController(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kContainerPadding),
      child: Stack(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller,
                  decoration: inputDecoration ??
                      InputDecoration(
                        border: const UnderlineInputBorder(),
                        hintText:
                            hintText ?? AppLocalizations.of(context)!.search,
                      ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: clearWidget ??
                InkWell(
                  child: const SizedBox(
                    width: kMinInteractiveDimension,
                    height: kMinInteractiveDimension,
                    child: Icon(
                      Icons.clear,
                    ),
                  ),
                  onTap: () {
                    controller.clear();
                  },
                ),
          ),
        ],
      ),
    );
  }
}
