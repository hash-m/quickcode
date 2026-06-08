import 'package:flutter/material.dart';
import 'small_screen.dart';
import 'big_screen.dart';
import 'package:quickcode/widgets/history.dart';
import 'package:quickcode/isar_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class HomeController {
  final TextEditingController textController;

  final VoidCallback onSubmit;
  final ValueChanged<bool> onToggle;
  final ValueChanged<CodeEntry> onHistorySelected;

  HomeController({
    required this.textController,
    required this.onSubmit,
    required this.onToggle,
    required this.onHistorySelected,
  });
}

class _HomePageState extends State<HomePage> {
  late HomeController homeController;
  final TextEditingController _controller = TextEditingController();

  bool isQrCode = false;
  String? errorMessage;
  String? barcodeData;
  List<CodeEntry> history = [];

  @override
  void initState() {
    super.initState();
    loadHistory();

    homeController = HomeController(
      textController: _controller,
      onSubmit: handleSubmit,
      onToggle: onToggle, 
      onHistorySelected: onHistorySelected
    );
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

    if (text.isEmpty) return;

    await IsarService.addCodeEntryAndTrim(
      CodeEntry()
        ..barcodeData = barcodeData!
        ..isQrCode = isQrCode
        ..timestamp = DateTime.now(),
      );
      
      await loadHistory();
  }

  void onToggle(bool value){
    setState(() {
      isQrCode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        title: const Text("QuickCode"),
      ),
      body: width < 600 ? 
        SmallScreenUI(
          homeController: homeController, 
          isQrCode: isQrCode,
          barcodeData: barcodeData,
          history: history,
          errorMessage: errorMessage
          )
        : 
        BigScreenUI(
          homeController : homeController,
          isQrCode: isQrCode,
          barcodeData: barcodeData,
          history: history,
          errorMessage: errorMessage
        )
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
}

