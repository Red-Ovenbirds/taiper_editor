import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';

class HeroPhotoViewWrapper extends StatelessWidget {
  const HeroPhotoViewWrapper(
      {this.imageProvider,
      this.loadingChild,
      this.backgroundDecoration,
      this.minScale,
      this.maxScale,
      this.heroTag = "photoViewByTaiper"});

  final ImageProvider imageProvider;
  final String heroTag;
  final Widget loadingChild;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            PhotoView(
              imageProvider: imageProvider,
              loadingBuilder: (context, event) {
                return Center(child: CircularProgressIndicator());
              },
              backgroundDecoration: backgroundDecoration,
              minScale: minScale,
              maxScale: maxScale,
              heroAttributes:
                  PhotoViewHeroAttributes(tag: heroTag),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: IconButton(
                icon: Icon(Icons.clear, color: Colors.white, size: 25),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
