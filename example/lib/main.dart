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
        primarySwatch: Colors.brown,
        accentColor: Colors.deepOrangeAccent,
        scaffoldBackgroundColor: Colors.lime[50],
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
  TaiperEditingController controller;
  var showingSpeedDial = false;

  @override
  void initState() {
    super.initState();

    controller = TaiperEditingController(exampleData);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Example")),
      bottomNavigationBar: BottomAppBar(),
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
        child: TaiperEditorContainer(
          controller: controller,
        ),
      ),
    );
  }

  final exampleData = [
    ClayblockData(
      type: "text/title",
      value: "Definição:",
      props: null,
    ),
    ClayblockData(
      type: "text/body",
      value:
          "A hipotensão ortostática ocorre com a mudança de posição, particularmente pela manhã ou após refeições copiosas, exercício físico e banho quente, situações que levam a uma redistribuição desfavorável do volume sangüíneo.",
    ),
    ClayblockData(
      type: "text/title",
      value: "Sinais e sintomas:",
    ),
    ClayblockData(
      type: "text/body",
      value:
          "Tontura\nSíncope\nQuedas\nDistúrbios visuais\nDéficits neurológicos focais\nCervicalgia com irradiação para os ombros\nclaudicação intermitente\nangina de peito\nIAM",
    ),
    ClayblockData(
      type: "image/web",
      value:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg/250px-Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg",
    ),
    ClayblockData(
        type: "image/web",
        value:
            "https://dictionary.cambridge.org/pt/images/full/cane_noun_002_05401_2.jpg?version=5.0.75"),
    ClayblockData(
      type: "text/ulitem",
      value: "Unordered list example item",
    ),
    ClayblockData(
      type: "text/ulitem",
      value:
          "Unordered list item that has a veeeeeeery long string to show how it does not overflow",
    ),
    ClayblockData(
      type: "file/image",
      value:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg/250px-Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg",
      props: null,
    ),
    ClayblockData(
      type: "file/link",
      value: "https://www.google.com",
    ),
    ClayblockData(
      type: "file/sklndkjnf",
      value: "ksjdnf",
    ),
    ClayblockData(
      type: "video/web",
      value:
          "https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_480_1_5MG.mp4",
    ),
    ClayblockData(
      type: "video/local",
      value: "assets/sample_video.mp4",
    ),
  ];
}
