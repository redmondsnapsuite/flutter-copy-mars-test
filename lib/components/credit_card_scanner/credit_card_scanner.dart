import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:sentry/sentry.dart';

class CreditCardScanner extends StatefulWidget {
  @override
  _CreditCardScannerState createState() => _CreditCardScannerState();
}

class _CreditCardScannerState extends State<CreditCardScanner> {
  CardDetails? _cardDetails;
  CardScanOptions scanOptions = const CardScanOptions(
    scanCardHolderName: true,
    // enableDebugLogs: true,
    validCardsToScanBeforeFinishingScan: 5,
    possibleCardHolderNamePositions: [
      CardHolderNameScanPosition.aboveCardNumber,
    ],
  );

  Future<void> scanCard() async {
    try {
      final CardDetails? cardDetails =
          await CardScanner.scanCard(scanOptions: scanOptions);
      if (!mounted || cardDetails == null) return;
      setState(() {
        _cardDetails = cardDetails;
      });
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('credit_card_scanner app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                color: Colors.blue,
                onPressed: () async {
                  scanCard();
                },
                child: const Text('scan card'),
              ),
              Text('$_cardDetails'),
              // Expanded(
              //   child: OptionConfigureWidget(
              //     initialOptions: scanOptions,
              //     onScanOptionChanged: (newOptions) => scanOptions = newOptions,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
