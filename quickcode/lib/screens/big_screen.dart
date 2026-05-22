import 'package:flutter/material.dart';
import 'package:quickcode/screens/home_screen.dart';
import 'package:quickcode/widgets/input.dart';
import 'package:quickcode/widgets/output.dart';
import 'package:quickcode/widgets/history.dart';

class BigScreenUI extends StatelessWidget {
  final HomeController homeController;

  final bool isQrCode;
  final String? errorMessage;
  final String? barcodeData;
  final List<CodeEntry> history;

  const BigScreenUI({
    super.key,
    required this.homeController,
    required this.isQrCode,
    required this.errorMessage,
    required this.barcodeData,
    required this.history
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LEFT SIDE (input + output)
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InputField(controller: homeController.textController),

                SizedBox(height: 12),

                CodeToggler(
                  value: isQrCode,
                  onChanged: homeController.onToggle,
                ),

                SizedBox(height: 12),

                SubmitButton(onPressed: homeController.onSubmit),

                SizedBox(height: 20),

                if (barcodeData != null)
                  BarcodeContainer(
                    errorMessage: errorMessage,
                    isQrCode: isQrCode,
                    data: barcodeData ?? "",
                  ),
              ],
            ),
          ),

          SizedBox(width: 16),

          // RIGHT SIDE (history)
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade900.withValues(alpha:0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.shade800,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "History",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 12),

                  Expanded(
                    child: HistoryList(
                      history: history,
                      onSelect: homeController.onHistorySelected,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}