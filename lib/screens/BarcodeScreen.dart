import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'package:totrash/helpers/common.dart';
import 'package:totrash/screens/DataScreen.dart';

class BarcodeScreen extends StatefulWidget {
  const BarcodeScreen({Key? key}) : super(key: key);

  @override
  _BarcodeScreenState createState() => _BarcodeScreenState();
}

class _BarcodeScreenState extends State<BarcodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                "#ff6666", "Cancel", false, ScanMode.DEFAULT);

            if (barcodeScanRes != "-1" && barcodeScanRes.isNotEmpty) {
              Common.barcodeTemp = barcodeScanRes;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DataScreen()),
              );
            }
          },
          child: Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Click Me'),
            ),
          ),
        ),
      ),
    );
  }
}
