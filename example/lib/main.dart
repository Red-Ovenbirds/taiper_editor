import 'package:flutter/material.dart';
import 'package:taiper/taiper.dart';
import 'package:taiper_editor/taiper_editor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final controller = TaiperEditingController(
      [ClayblockData(value: "test", type: "text/title", props: null)]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Example")),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () {
        controller.addBodyTextMold();
      }),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TaiperEditorContainer(
                controller: controller,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
