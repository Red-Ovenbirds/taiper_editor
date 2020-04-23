import 'dart:io';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InlineImage extends StatefulWidget {
  final String src;
  final String tag;
  final ImageType type;
  InlineImage(this.src,
      {this.tag = "photoViewByTaiper", this.type = ImageType.local});

  @override
  State createState() => InlineImageState();
}

class InlineImageState extends State<InlineImage> {
  Size size;

  @override
  initState() {
    super.initState();
    _calculateImageDimension();
  }

  @override
  didUpdateWidget(InlineImage oldWidget){
    super.didUpdateWidget(oldWidget);
    _calculateImageDimension();
  }

  _calculateImageDimension() {
    ImageProvider imageProvider = FileImage(File.fromUri(Uri.file(widget.src)));
    if (widget.type == ImageType.web) {
      imageProvider = CachedNetworkImageProvider(widget.src);
    }
    imageProvider.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo info, bool synchronousCall) {
          var receivedImage = info.image;
          setState(() {
            size = Size(receivedImage.width.toDouble(),
                receivedImage.height.toDouble());
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

        return Hero(
          tag: widget.tag,
          child: widget.type == ImageType.local
              ? Image.file(
                  File.fromUri(Uri.file(widget.src)),
                  height: height,
                  fit: BoxFit.contain,
                )
              : CachedNetworkImage(
                  imageUrl: widget.src,
                  height: height,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator())),
        );
      },
    );
  }
}

enum ImageType { local, web }
