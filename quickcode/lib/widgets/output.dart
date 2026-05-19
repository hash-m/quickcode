import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';


class BarcodeContainer extends StatelessWidget {
  final String data;
  final bool isQrCode;
  final String? errorMessage;

  const BarcodeContainer({
    super.key,
    required this.data,
    required this.isQrCode,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    final hasError = errorMessage != null;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: hasError
            ? Colors.red.shade50
            : const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: hasError || data.isEmpty
            ? Text(
                errorMessage!,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              )
            : BarcodeWidget(
                barcode: isQrCode
                    ? Barcode.qrCode()
                    : Barcode.code128(),
                data: data,
                width: 250,
                height: 250,
              ),
      ),
    );
  }
}