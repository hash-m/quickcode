import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;

  const InputField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        hintText: 'Enter text here.',
      ),
    );
  }
}

class CodeToggler extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CodeToggler({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<bool>(
      segments: const [
        ButtonSegment<bool>(
          value: false,
          label: Text("Barcode"),
        ),
        ButtonSegment<bool>(
          value: true,
          label: Text("QR Code"),
        ),
      ],

      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4), // low = blocky
          ),
        ),
      ),

      selected: {value},

      onSelectionChanged: (Set<bool> selection) {
        onChanged(selection.first);
      },
    );
  }
}

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SubmitButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text("Submit"),
    );
  }
}