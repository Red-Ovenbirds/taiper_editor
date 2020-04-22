import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
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

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var controller = TaiperEditingController(
      [ClayblockData(value: "test", type: "text/title", props: null)]);
  var showingSpeedDial = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Example")),
      floatingActionButton: SpeedDial(
        // this is ignored if animatedIcon is non null
        // child: Icon(Icons.add),
        visible: true,
        // If true user is forced to close dial manually
        // by tapping main button and overlay is not rendered.
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.25,
        onOpen: () => setState(() => showingSpeedDial = true),
        onClose: () => setState(() => showingSpeedDial = false),
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        elevation: 8.0,
        shape: CircleBorder(),
        child: showingSpeedDial ? Icon(Icons.close) : Icon(Icons.add),
        children: [
          SpeedDialChild(
            child: Icon(Icons.image, color: theme.accentColor),
            backgroundColor: Colors.white,
            label: 'Imagem',
            labelStyle: Theme.of(context).textTheme.body1,
            onTap: () => controller.addImageMold(),
          ),
          SpeedDialChild(
            child: Icon(Icons.title, color: theme.accentColor, size: 18),
            backgroundColor: Colors.white,
            label: 'Parágrafo',
            labelStyle: Theme.of(context).textTheme.body1,
            onTap: () => controller.addBodyTextMold(),
          ),
          SpeedDialChild(
              child: Icon(Icons.title, color: theme.accentColor),
              backgroundColor: Colors.white,
              label: 'Título',
              labelStyle: Theme.of(context).textTheme.title,
              onTap: () => controller.addTitleTextMold())
        ],
      ),
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
