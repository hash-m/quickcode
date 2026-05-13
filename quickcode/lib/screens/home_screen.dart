import 'package:flutter/material.dart';
import 'package:quickcode/widgets/input.dart';
import 'package:barcode_widget/barcode_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  bool isQrCode = false;
  String? barcodeData;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void handleSubmit() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        barcodeData = _controller.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QuickCode"),
      ),
      body: Column(
        children: [
          InputField(controller: _controller),

          CodeToggler(
            value: isQrCode,
            onChanged: (bool value) {
              setState(() {
                isQrCode = value;
              });
            },
          ),

          SubmitButton(onPressed: handleSubmit),

          if (barcodeData != null)
            BarcodeWidget(
              barcode: isQrCode
                  ? Barcode.qrCode()
                  : Barcode.code128(),
              data: barcodeData!,
              width: 500,
              height: 500,
            ),
        ],
      ),
    );
  }
}