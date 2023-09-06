import 'package:flutter/material.dart';
import 'package:mars_test/components/card_mage/card_with_image.dart';
import 'package:mars_test/components/webView/webView.dart';
import '../../components/button/button.dart';
import '../../components/calendar/calendar.dart';
import '../../components/gallery/gallery.dart';
import '../../components/home_button/home-button-mobile.dart';
import '../../components/input_field/input_field.dart';
import '../../components/pdfViewer/pdf_viewer.dart';
import '../../components/scrollable_list/scrollable_list_card_title_description.dart';
import '../../components/select_with_search/select_with_search.dart';
import '../../components/uploader/uploader.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            home_button(
                              backGroundColor: Colors.blue,
                              buttonTitle: 'New Job',
                              buttonIcon: Icons.construction,
                              buttonDescription: 'Tap here to \ncreate a new job',
                            ),
                            home_button(
                              backGroundColor: Colors.purple,
                              buttonTitle: 'Open Jobs',
                              buttonIcon: Icons.engineering,
                              buttonDescription: 'Tap here to \nopen all jobs',
                            ),
                          ],
                        ),
                        // ... other rows ...
                      ],
                    ),
                  ),
                  
                  // Submit Button Row
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button(buttonText: 'Submit', buttonColor: Colors.purple),
                      ],
                    ),
                  ),
                  
                  // Input Field Row
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        input_field(inputHint: 'test hint'),
                      ],
                    ),
                  ),
                  
                  // Scrollable List
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        scrollable_list_card_title_description(),
                      ],
                    ),
                  ),
                  
                  // Show Modal Button Row
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return YourDialogWidget();
                              },
                            );
                          },
                          child: const Text('Show Modal'),
                        ),
                      ],
                    ),
                  ),
                
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CardWithImage(
                              backgroundImage: 'assets/images/construction-image.jpg',
                              date: 'August 17, 2023',
                              title: 'Title goes here',
                              description: 'Description will go here.',
                              buttonText: 'Click Me',
                              onPressed: () {
                                // Add your button click logic here
                              },
                            ),
                          )
                        ],
                      ),
                    ),

                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: ElevatedButton(
                      child: Text('Open Calendar Page'),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => TableEventsExample()),
                      ),
                    )
                  ),
                
                  Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: gallery()
                
                ),
                  
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: ElevatedButton(
                      child: Text('Open PDF'),
                      onPressed: () {
                        String pdfUrl = 'https://snapsuiteappus.blob.core.windows.net/ss-p/aircool/b604d9ec-2ccf-4dd2-92c5-9824fac11428/913/3080/projects/WO4177-Tripwire-30D60A4A-workorder.pdf?v=1687430428541';
                        // Replace the URL with the actual PDF file URL
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PDFViewer(pdfUrl: pdfUrl),
                          ),
                        );
                      },
                    )
                  ),
                   
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: ElevatedButton(
                      child: Text('Open Web View'),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const WebViewApp()),
                      ),
                    )
                  ),
                
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: FilePickerComponent())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YourDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.purple,
            title: const Text('Modal Title'),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 0),
                  child: SelectWithSearch(),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        input_field(inputHint: 'test hint'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Submit and Cancel buttons
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                button(buttonText: 'Submit', buttonColor: Colors.purple),
                SizedBox(width: 50),
                button(buttonText: 'Cancel', buttonColor: Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MyMobileBody(),
  ));
}
