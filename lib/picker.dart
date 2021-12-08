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
                    onPressed: () {
                      picker(context, PickerType.colorPicker);
                    },
                    child: Text("Picker  Color",
                        style: TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                            color: backgroudColor))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: buttonBgColor,
                    ),
                    onPressed: () {
                      picker(context, PickerType.blockPicker);
                    },
                    child: Text("Block Picker",
                        style: TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                            color: backgroudColor))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: buttonBgColor,
                  ),
                  onPressed: () {
                    picker(context, PickerType.slidePicker);
                  },
                  child: Text(
                    "Slide Picker",
                    style: TextStyle(
                        fontSize: 18.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        color: backgroudColor),
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
          Colors.redAccent,
          Colors.cyan,
          Colors.blue,
          Colors.brown,
          Colors.orange,
          Colors.blue,
          Colors.pink,
          Colors.grey,
          Colors.amber,
          Colors.yellow,
          Colors.lightBlue,
          Colors.greenAccent,
          Colors.deepPurple,
          Colors.blueGrey,
          Colors.teal,
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
          ColorLabelType.rgb,
          ColorLabelType.hsv,
          ColorLabelType.hsl,
          ColorLabelType.hex
        ],
        onColorChanged: (color) => setState(() {
          backgroudColor = color;
        }),
      );
}

enum PickerType { colorPicker, blockPicker, slidePicker }
