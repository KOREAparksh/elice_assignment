import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanner extends StatelessWidget {
  const QRScanner({Key? key}) : super(key: key);

  final _title = "QR";

  //String
  final _guideText = "QR 코드를 인식해주세요";

  //size
  final _guideSize = 220.0;
  final _guideThick = 2.0;
  final _guideSpacerHeight = 28.0;
  final _guideTopRatio = 77;
  final _guideBottomRatio = 190;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          _mobileScanner(),
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

  Widget _mobileScanner() {
    return MobileScanner(
      allowDuplicates: false,
      onDetect: (barcode, args) {
        if (barcode.rawValue == null) {
          debugPrint('Failed to scan Barcode');
          return;
        }
        final String code = barcode.rawValue!;
        debugPrint('Barcode found! $code');
        if (isUrl(barcode)) {}
        if (isText(barcode)) {}
      },
    );
  }

  //Todo: 분리
  bool isUrl(Barcode barcode) {
    if (barcode.format != BarcodeFormat.qrCode) {
      return false;
    }
    if (barcode.type != BarcodeType.url) {
      return false;
    }
    return true;
  }

  bool isText(Barcode barcode) {
    if (barcode.format != BarcodeFormat.qrCode) {
      return false;
    }
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
