# picker

A new Flutter project.

## Getting Started
This project is a starting point for a Flutter application.


```dart

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PickerPage extends StatefulWidget {
  const PickerPage({Key? key}) : super(key: key);

  @override
  State<PickerPage> createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {

  Color appbarBackgroudColor = Colors.deepPurpleAccent;
  Color backgroudColor = Colors.deepPurple;
  Color buttonBgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarBackgroudColor,
        centerTitle: true,
        title: const Text(
          'Color Picker',
          style: TextStyle(
            fontSize: 25.0,
            letterSpacing: 5.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: backgroudColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: buttonBgColor,
                    ),
                    onPressed: () => picker(context, PickerType.colorPicker), // PickerType.sliderPicker, PickerTyp.blockPicker
                    child: Text("Picker  Color",
                        style: TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                            color: backgroudColor,
                        ),
                    ),
                 ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void picker(BuildContext context, PickerType pType) {
    var body = buildColorPicker;

    switch (pType) {
      case PickerType.blockPicker:
        body = buildBlockPicker;
        break;
      case PickerType.slidePicker:
        body = buildSlidePicker;
        break;
      default:
        body = buildColorPicker;
        break;
    }

    var alert = AlertDialog(
      title: const Text("Select a Color"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          body,
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              "CLOSE",
              style: TextStyle(
                  fontSize: 18.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  color: backgroudColor),
            ),
          )
        ],
      ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  Widget get buildBlockPicker => BlockPicker(
        pickerColor: backgroudColor,
        availableColors: const [
          Colors.black,
          Colors.green,
          Colors.lime
        ],
        onColorChanged: (color) => setState(() {
          backgroudColor = color;
        }),
      );

  Widget get buildColorPicker => ColorPicker(
        pickerColor: backgroudColor,
        enableAlpha: false,
        displayThumbColor: true,
        // labelTypes: [],
        onColorChanged: (color) => setState(() {
          backgroudColor = color;
        }),
      );

  Widget get buildSlidePicker => SlidePicker(
        pickerColor: backgroudColor,
        enableAlpha: false,
        displayThumbColor: true,
        labelTypes: const [
          ColorLabelType.rgb, ColorLabelType.hsv, ColorLabelType.hsl, ColorLabelType.hex
        ],
        onColorChanged: (color) => setState(() {
          backgroudColor = color;
        }),
      );
}

enum PickerType { colorPicker, blockPicker, slidePicker }

```

![s1](https://user-images.githubusercontent.com/89924493/145298603-9a37bd25-4e7f-4d6b-82c0-fd1fd6686588.PNG)

![s2](https://user-images.githubusercontent.com/89924493/145299236-810aad9c-70f8-4cf9-8011-9a2808d38828.PNG)

![s3](https://user-images.githubusercontent.com/89924493/145299345-b1f40817-dae9-4863-a56e-b7ba82b315af.PNG)

![s4](https://user-images.githubusercontent.com/89924493/145299479-8cf578a7-6785-4c0c-898e-c4973b3bbe51.PNG)

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
