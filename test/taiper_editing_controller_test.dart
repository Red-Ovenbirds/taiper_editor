import 'package:flutter_test/flutter_test.dart';
import 'package:taiper/taiper.dart';

import 'package:taiper_editor/taiper_editor.dart';

void main() {
  test("item move when index is greater", () {
    ClayblockData(type: "A");
    final controller = TaiperEditingController([
      ClayblockData(type: "A"),
      ClayblockData(type: "B"),
      ClayblockData(type: "C"),
      ClayblockData(type: "D"),
    ]);
    controller.addListener(() {
      print(controller.data);
      expect(controller.data[0].type, equals("B"));
      expect(controller.data[1].type, equals("C"));
      expect(controller.data[2].type, equals("A"));
      expect(controller.data[3].type, equals("D"));
    });
    controller.moveEntry(0, 2);
  });

  test("item move when index is smaller", () {
    ClayblockData(type: "A");
    final controller = TaiperEditingController([
      ClayblockData(type: "A"),
      ClayblockData(type: "B"),
      ClayblockData(type: "C"),
      ClayblockData(type: "D"),
    ]);
    controller.addListener(() {
      print(controller.data);
      expect(controller.data[0].type, equals("B"));
      expect(controller.data[1].type, equals("A"));
      expect(controller.data[2].type, equals("C"));
      expect(controller.data[3].type, equals("D"));
    });
    controller.moveEntry(1, 0);
  });
}
