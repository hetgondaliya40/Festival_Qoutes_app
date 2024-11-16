import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

import '../../utilis/global.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

GlobalKey repaintboudry = GlobalKey();

void CopytoClipBord({required String data}) {
  Clipboard.setData(ClipboardData(text: data));
}

void ShareImage() async {
  RenderRepaintBoundary res = await repaintboudry.currentContext!
      .findRenderObject() as RenderRepaintBoundary;

  var image = await res.toImage(pixelRatio: 5);

  ByteData? byte = await image.toByteData(format: ImageByteFormat.png);

  Uint8List ulist = await byte!.buffer.asUint8List();

  Directory directory = await getApplicationSupportDirectory();

  File file = File("${directory.path}.png");
  await file.writeAsBytes(ulist);
  print("${file}");
}

void saveImg() async {
  RenderRepaintBoundary res = await repaintboudry.currentContext!
      .findRenderObject() as RenderRepaintBoundary;

  var image = await res.toImage(pixelRatio: 5);

  ByteData? byte = await image.toByteData(format: ImageByteFormat.png);

  Uint8List ulist = await byte!.buffer.asUint8List();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 100,
        actions: [
          IconButton(
            onPressed: () {
              ShareImage();
            },
            icon: const Icon(
              Icons.save_alt,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              saveImg();
            },
            icon: const Icon(
              Icons.ios_share_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 300,
              width: 350,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: global.bgColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    global.bgImage,
                  ),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    "${data['quote']}",
                    style: GoogleFonts.getFont(
                      global.fontFamily,
                    ).copyWith(
                      fontSize: 18,
                      color: global.fontColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    " - ${data['author']}",
                    style: GoogleFonts.getFont(
                      global.fontFamily,
                    ).copyWith(
                      fontSize: 18,
                      color: global.fontColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const Text(
                    "Background color",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: global.bgcolor
                            .map(
                              (e) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    global.bgColor = e;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(15),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: e,
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList()),
                  ),
                  const Text(
                    "Font color",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: global.bgcolor
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  global.fontColor = e;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.all(15),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: e,
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const Text(
                    "Font style",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: global.font
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  global.fontFamily = e;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(15),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                ),
                                child: Text(
                                  "A a",
                                  style: GoogleFonts.getFont(e).copyWith(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const Text(
                    "Background image ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: global.image
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  global.image = e as List<String>;
                                  global.bgImage = e;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.all(15),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      "${e}",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
