import 'package:flutter/material.dart';

class StateDropdownField extends StatefulWidget {
  const StateDropdownField({
    super.key,
    required TextEditingController controller,
    required String txtLabel,
    required List<String> listValues,
  })  : _controller = controller,
        _label = txtLabel,
        _listValues = listValues;

  final TextEditingController _controller;
  final String _label;
  final List<String> _listValues;

  @override
  State<StateDropdownField> createState() => _StateDropdownField();
}

class _StateDropdownField extends State<StateDropdownField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DropdownButtonFormField(
          icon: const Icon(Icons.arrow_downward),
          value: widget._controller.text,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: Text(widget._label),
          ),
          validator: (value) {
            if (value == '' || value == null) {
              return 'Field cannot be empty';
            }
            return null;
          },
          menuMaxHeight: 250.0,
          padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
          onChanged: (String? value) {
            setState(() {
              widget._controller.text = value!;
            });
          },
          items:
              widget._listValues.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList()),
    );
  }
}
