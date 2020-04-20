// https://dart.dev/guides/libraries/create-library-packages
// Create a “main” library file directly under lib, lib/<package-name>.dart, that exports all of the public APIs.
// This allows the user to get all of a library’s functionality by importing a single file.

// https://dart.dev/guides/language/effective-dart/documentation
// The library directive is a great place for documentation 
// that introduces the reader to the main concepts and functionality provided within

///**Taiper** is a layout framework that offers building block widgets called ***Clayblocks*** that can be stacked vertically inside a ***TaipaContainer*** widget.
///There are *Clayblocks* for:
/// * Text
///  * title
///  * body
/// * Image
///  * local
///  * bitmap
///  * URL
/// * Video
///  * local
///  * URL
/// * Audio
///  * local
///  * URL
///
/// Taiper editor offers inputs to create and edit a list of ClayblockData
library taiper_editor;

export 'src/container.dart';
export 'src/controller.dart';
