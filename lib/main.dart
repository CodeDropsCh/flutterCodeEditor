import 'package:code_editor/code_editor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> contentOfPage1 = [
      "<!DOCTYPE html>",
      "<html lang='fr'>",
      "\t<body>",
      "\t\t<a href='page2.html'>go to page 2</a>",
      "\t</body>",
      "</html>",
    ];

    List<FileEditor> files = [
      FileEditor(
        name: "page1.html",
        language: "html",
        code: contentOfPage1.join("\n"), // [code] needs a string
      ),
    ];

    EditorModel model = EditorModel(
      files: files, // the files
      //created above
      // you can customize the
      //editor as you want
      styleOptions: EditorModelStyleOptions(
        fontSize: 13,
      ),
    );

    final myController = TextEditingController(text: 'hello!');

    return Scaffold(
      appBar: AppBar(
        title: const Text('code'),
      ),
      body: SingleChildScrollView(
        child: CodeEditor(
          model: model,
          edit: true,
          onSubmit: (String? language, String? value) => print("yo"),
          disableNavigationbar: false,
          textEditingController: myController,
        ),
      ),
    );
  }
}
