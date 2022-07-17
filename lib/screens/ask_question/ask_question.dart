import 'package:am_industrial4/widgets/loading_button.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../logic/screens/logic_ask_question.dart';
import '../../widgets/animated_page.dart';

class ScreenAskQuestion extends StatelessWidget {
  const ScreenAskQuestion({Key? key}) : super(key: key);

  static const screenId = 'ScreenAskQuestion0002';
  @override
  Widget build(BuildContext context) {
    final logic = LogicAskQuestionScreen();
    FToast().init(context);
    return AmAnimatedPage(
      uniqueId: screenId,
      minHeight: 0,
      forceAnimation: logic.forceAnimation,
      scaffold: Scaffold(
        backgroundColor: Color.fromARGB(255, 211, 213, 255),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 199, 190, 255),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ask Questions',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(width: 20),
              const Icon(Icons.phone, size: 36),
            ],
          ),
        ),
        body: GestureDetector(
          onTap: logic.unFocus,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Card(
                elevation: 6,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        TextFormField(
                          focusNode: logic.focusName,
                          controller: logic.textControllerName,
                          decoration: const InputDecoration(
                            hintText: 'Your Name',
                            icon: Icon(
                              Icons.person,
                            ),
                            label: Text('Your Name'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          focusNode: logic.focusPhone,
                          keyboardType: TextInputType.number,
                          controller: logic.textControllerPhoneNo,
                          decoration: InputDecoration(
                            hintText: 'Your Phone number',
                            border: const OutlineInputBorder(),
                            icon: SizedBox(
                              // width: 150,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.phone,
                                  ),
                                  const SizedBox(height: 10),
                                  CountryCodePicker(
                                    initialSelection: '+20',
                                    favorite: const ['+20'],
                                    onChanged: logic.countryCodeChange,
                                  ),
                                ],
                              ),
                            ),
                            label: const Text('Your Phone number'),
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: logic.textControllerText,
                          maxLines: 5,
                          focusNode: logic.focusText,
                          decoration: const InputDecoration(
                            hintText: 'Text Message',
                            label: Text('Text Message'),
                            icon: Icon(Icons.message),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Center(
                            child: AmLoadingButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.send_to_mobile_rounded),
                                  SizedBox(width: 10),
                                  Text('Submit'),
                                ],
                              ),
                              onTap: logic.submit,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Note: The phone no must have WhatsApp or Telegram',
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.pink),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
