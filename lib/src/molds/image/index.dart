import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:taiper_editor/src/molds/image/local_image.dart';
import 'package:taiper_editor/src/molds/image/photo_view.dart';
import 'package:taiper_editor/src/molds/image/web_image.dart';
import 'package:taiper_editor/src/molds/index.dart';

class ImageMold extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ImageMoldState();
}

class ImageMoldState extends State<ImageMold> with ClayblockMoldMixin {
  String src;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final controllerSrc = getClayblockData(context).value;
    if (controllerSrc != src)
      setState(() {
        src = controllerSrc;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 4),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(
          children: <Widget>[
            Expanded(
                child: Card(
                    color: Colors.black,
                    clipBehavior: Clip.antiAlias,
                    child: buildImage())),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  color: Theme.of(context).accentColor,
                  colorBrightness: Theme.of(context).accentColorBrightness,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[Icon(Icons.photo_library)],
                    ),
                    onPressed: () =>
                        didTapImageButton(context, ImageSource.gallery)),
              ),
              SizedBox(width: 8),
              Expanded(
                child: FlatButton(
                    color: Theme.of(context).accentColor,
                    colorBrightness: Theme.of(context).accentColorBrightness,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[Icon(Icons.camera_alt)],
                    ),
                    onPressed: () =>
                        didTapImageButton(context, ImageSource.camera)),
              ),
            ],
          ),
        )
      ]),
    );
  }

  Widget buildImage() {
    if (src == null || src == "") {
      return Container(width: 0, height: 0);
    }

    if (src.contains("http")) {
      return imageContainer(
          context, WebImage(src), CachedNetworkImageProvider(src));
    } else {
      return imageContainer(
          context, LocalImage(src), FileImage(File.fromUri(Uri.file(src))));
    }
  }

  imageContainer(context, image, imageProvider) => Container(
        child: GestureDetector(
          child: image,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HeroPhotoViewWrapper(
                  imageProvider: imageProvider,
                  minScale: PhotoViewComputedScale.contained * 1,
                  maxScale: PhotoViewComputedScale.covered * 2.0,
                ),
              ),
            );
          },
        ),
      );

  didTapImageButton(BuildContext context, ImageSource source) async {
    var file = await ImagePicker.pickImage(source: source);
    if (file != null) {
      updateValue(context, file.path);
      setState(() {
        src = file.path;
      });
    }
  }
}
