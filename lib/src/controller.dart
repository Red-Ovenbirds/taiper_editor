import 'dart:math';

import 'package:flutter/material.dart';
import 'package:taiper/taiper.dart';

class TaiperEditingController with ChangeNotifier {
  List<Key> keys = [];
  List<ClayblockData> data = [];

  TaiperEditingController(List<ClayblockData> initialData) {
    this.data = initialData;
    this.keys = data.map((data) => new GlobalKey()).toList();
  }

  updateEntry(int index, ClayblockData data) {
    this.data[index] = data;
  }

  removeEntry(int index) {
    this.data.removeAt(index);
    this.keys.removeAt(index);
    notifyListeners();
  }

  moveEntry(int oldIndex, int newIndex) {
    oldIndex = max(oldIndex, 0);
    newIndex = min(newIndex, this.data.length-1);

    final entry = this.data[oldIndex];
    final key = this.keys[oldIndex];

    this.keys.removeAt(oldIndex);
    this.keys.insert(newIndex, key);

    this.data.removeAt(oldIndex);
    this.data.insert(newIndex, entry);

    notifyListeners();
  }

  addBodyTextMold() {
    this.data.add(ClayblockData(type: "text/body", value: "", props: null));
    this.keys.add(new GlobalKey());
    notifyListeners();
  }

  addTitleTextMold() {
    this.data.add(ClayblockData(type: "text/title", value: "", props: null));
    this.keys.add(new GlobalKey());
    notifyListeners();
  }

  addImageMold() {
    this.data.add(ClayblockData(type: "image/local", value: "", props: null));
    this.keys.add(new GlobalKey());
    notifyListeners();
  }
}
