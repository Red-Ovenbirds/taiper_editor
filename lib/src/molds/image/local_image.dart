import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';

class LocalImage extends StatefulWidget {
  final String src;

  LocalImage(this.src);

  @override
  State createState() => LocalImageState();
}

class LocalImageState extends State<LocalImage> {
  Image image;
  Size size;

  @override
  initState() {
    super.initState();
    _calculateImageDimension();
  }

  _calculateImageDimension() {
    image = Image.file(File.fromUri(Uri.file(widget.src)));
    image.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo info, bool synchronousCall) {
          var myImage = info.image;
          setState(() {
            size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          });
        },
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    if (size == null) {
      return Center(child: CircularProgressIndicator());
    }
    return buildWithSize();
  }

  buildWithSize() {
    double widthImage = size.width;
    double heightImage = size.height;
    double ratio = heightImage / widthImage;
    double height;

    return LayoutBuilder(
      builder: (context, constraints) {
        double parentMinHeight =
            min(constraints.maxWidth, constraints.maxHeight);
        double deviceMinHeight = min(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height);
        if (deviceMinHeight == MediaQuery.of(context).size.height)
          deviceMinHeight *= 0.75;
        double maxHeightAvaliable = min(parentMinHeight, deviceMinHeight);
        height = min(min(0.75 * maxHeightAvaliable, ratio * maxHeightAvaliable),
            heightImage);

        return Image.file(
          File.fromUri(Uri.file(widget.src)),
          height: height,
          fit: BoxFit.contain,
        );
      },
    );
  }
}
