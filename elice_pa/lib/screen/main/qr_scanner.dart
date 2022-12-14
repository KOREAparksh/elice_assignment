import 'dart:convert';
import 'dart:io';

import 'package:elice_pa/screen/custo_web_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final _title = "QR";

  //data
  final MobileScannerController cameraController = MobileScannerController();
  bool isFind = false;

  //String
  final _guideText = "QR 코드를 인식해주세요";
  final _urlError = "유효하지 않는 주소입니다.";

  //size
  final _guideSize = 220.0;
  final _guideThick = 2.0;
  final _guideSpacerHeight = 28.0;
  final _guideTopRatio = 77;
  final _guideBottomRatio = 190;

  //

  @override
  void initState() {
    super.initState();
    print(cameraController.isStarting);
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          _mobileScanner(context),
          _guide(),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        _title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _mobileScanner(context) {
    return MobileScanner(
      controller: cameraController,
      allowDuplicates: false,
      onDetect: (barcode, args) async {
        if (barcode.rawValue == null ||
            barcode.format != BarcodeFormat.qrCode ||
            isFind) {
          return;
        }
        cameraController.stop();
        isFind = true;
        await _goWebView(barcode);
        isFind = false;
        cameraController.start();
      },
    );
  }

  Future<void> _goWebView(Barcode barcode) async {
    String decoded = barcode.rawValue!;
    if (isText(barcode)) {
      try {
        decoded = utf8.decode(base64Decode(barcode.rawValue!));
      } catch (e) {
        showError();
        return;
      }
    } else if (isUrl(barcode) == false) {
      showError();
      return;
    }
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CustomWebView(url: decoded),
      ),
    );
  }

  void showError() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(_urlError),
    ));
  }

  bool isUrl(Barcode barcode) {
    if (barcode.type != BarcodeType.url) {
      return false;
    }
    return true;
  }

  bool isText(Barcode barcode) {
    if (barcode.type != BarcodeType.text) {
      return false;
    }
    return true;
  }

  Widget _guide() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(flex: _guideTopRatio, child: const SizedBox()),
        _guideRectangle(),
        SizedBox(height: _guideSpacerHeight),
        _guideTextView(),
        Expanded(flex: _guideBottomRatio, child: const SizedBox()),
      ],
    );
  }

  Widget _guideRectangle() {
    return Container(
      width: _guideSize,
      height: _guideSize,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.yellowAccent,
          width: _guideThick,
        ),
      ),
    );
  }

  Widget _guideTextView() {
    return Text(
      _guideText,
      style: const TextStyle(
        color: Colors.yellowAccent,
        fontWeight: FontWeight.w300,
        fontSize: 16,
      ),
    );
  }
}
