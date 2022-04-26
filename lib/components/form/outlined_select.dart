import 'package:flutter/material.dart';
import 'package:flutter_folder/configs/app_colors.dart';

class SelectOption {
  String label;
  String value;

  SelectOption(this.label, this.value);
}

List<SelectOption> sampleData = [
  SelectOption("Thailand", "thai"),
  SelectOption("Korea", "korea"),
];

class OutlinedSelect extends StatefulWidget {
  const OutlinedSelect({
    Key? key,
    this.label,
    this.items,
  }) : super(key: key);

  final String? label;
  final List<DropdownMenuItem<String>>? items;

  @override
  _OutlinedSelectState createState() => _OutlinedSelectState();
}

class _OutlinedSelectState extends State<OutlinedSelect> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                widget.label?.toUpperCase() ?? "",
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AppColors.kTextGrey),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: DropdownButton<String>(
                value: widget.items!.isNotEmpty
                    ? widget.items?.elementAt(0).value
                    : null,
                items: widget.items ??
                    sampleData
                        .map((e) => DropdownMenuItem(
                              child: Text(e.label),
                              value: e.value,
                            ))
                        .toList(),
                onChanged: (String? newValue) {
                },
                isExpanded: true,
                underline:const SizedBox(),
              ),
              decoration: BoxDecoration(
                  borderRadius:const BorderRadius.all(Radius.circular(8)),
                  border:
                      Border.all(color: const Color.fromARGB(100, 158, 158, 158))),
            )
          ]
        ]);
  }
}
