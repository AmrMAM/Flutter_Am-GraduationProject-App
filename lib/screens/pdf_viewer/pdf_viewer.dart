import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:am_industrial4/logic/screens/logic_pdf_viewer.dart';
import 'package:am_state/am_state.dart';
import 'package:flutter/material.dart';

import '../../widgets/animated_page.dart';

class ScreenPDFViewer extends StatelessWidget {
  const ScreenPDFViewer({Key? key}) : super(key: key);

  static const screenId = 'ScreenPDFViewer0002';
  @override
  Widget build(BuildContext context) {
    final logic = LogicPdfViewerScreen();
    return AmAnimatedPage(
      uniqueId: screenId,
      minHeight: 0,
      forceAnimation: logic.forceAnimation,
      scaffold: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  logic.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  overflow: TextOverflow.fade,
                ),
              ),
              const SizedBox(width: 20),
              const Icon(Icons.book, size: 36),
            ],
          ),
        ),
        body: AmRefreshWidget<PDFDocument>(
          amDataProvider: logic.pdfDoc,
          builder: (ctx, doc) {
            if (logic.isLoaded) {
              return PDFViewer(document: doc!);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
