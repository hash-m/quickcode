import 'package:flutter/material.dart';
import 'package:quickcode/screens/home_screen.dart';
import 'package:quickcode/widgets/input.dart';
import 'package:quickcode/widgets/output.dart';
import 'package:quickcode/widgets/history.dart';

class SmallScreenUI extends StatelessWidget {
  final HomeController homeController;

  final bool isQrCode;
  final String? errorMessage;
  final String? barcodeData;
  final List<CodeEntry> history;

  const SmallScreenUI({
    super.key,
    required this.homeController,
    required this.isQrCode,
    required this.errorMessage,
    required this.barcodeData,
    required this.history
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputField(controller: homeController.textController),

            const SizedBox(height: 12),

            CodeToggler(
              value: isQrCode,
              onChanged: homeController.onToggle,
            ),

            const SizedBox(height: 12),

            SubmitButton(onPressed: homeController.onSubmit),

            const SizedBox(height: 16),

            if (barcodeData != null)
               SizedBox(
                width: double.infinity,
                child: BarcodeContainer(
                  errorMessage: errorMessage,
                  isQrCode: isQrCode,
                  data: barcodeData ?? "",
                ),
              ),

            const Spacer(),

            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: const Icon(Icons.history),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => SizedBox(
                      height: 600,
                      child: HistoryList(
                        history: history,
                        onSelect: (entry) {
                          homeController.onHistorySelected(entry);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}