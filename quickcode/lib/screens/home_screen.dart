import 'package:flutter/material.dart';
import 'package:quickcode/widgets/input.dart';
import 'package:quickcode/widgets/output.dart';
import 'package:quickcode/widgets/history.dart';
import 'package:quickcode/isar_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  bool isQrCode = false;
  String? errorMessage;
  String? barcodeData;
  List<CodeEntry> history = [];

  @override
  void initState() {
    super.initState();
    loadHistory();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> handleSubmit() async {
  final text = _controller.text;

  setState(() {
    if (text.isEmpty) {
      errorMessage = "Please enter some text";
      barcodeData = "";
      return;
    }

    barcodeData = text;
    errorMessage = null;
  });

  await IsarService.addCodeEntryAndTrim(
    CodeEntry()
      ..barcodeData = barcodeData!
      ..isQrCode = isQrCode
      ..timestamp = DateTime.now(),
    );
    
    await loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        title: const Text("QuickCode"),
      ),
      body: width < 600 ? smallScreenUI() : bigScreenUI()
    );
  }
  

  Future<void> loadHistory() async {
  final data = await IsarService.getTop10History();

  setState(() {
    history = data;
  });
  }

  void onHistorySelected(CodeEntry entry) {
    setState(() {
      barcodeData = entry.barcodeData;
      isQrCode = entry.isQrCode;
      errorMessage = null;

      _controller.text = entry.barcodeData;
    });
  }

  Widget bigScreenUI(){
    return Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
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
                  BarcodeContainer(
                    errorMessage: errorMessage,
                    isQrCode: isQrCode,
                    data: barcodeData ?? "",
                  ),
              ],
            ),
          ),

          Expanded(
            flex: 1,
            child: HistoryList(history: history,onSelect: onHistorySelected),
          ),
        ],
      );
  }

  Widget smallScreenUI() {
    return Column(
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
          BarcodeContainer(
            errorMessage: errorMessage,
            isQrCode: isQrCode,
            data: barcodeData ?? "",
          ),
        
        IconButton(
          icon: const Icon(Icons.history),
          onPressed: () {
            showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 400,
                child: HistoryList(
                  history: history,
                  onSelect : (entry) {
                    onHistorySelected(entry);
                    Navigator.pop(context);
                  } 
                ),
              );
            },
          );}
        )
      ],
    );
  }
}

