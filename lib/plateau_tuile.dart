import 'package:image/image.dart' as imglib;

List<Image> splitImage(List<int> input) {
  // convert image to image from image package
  imglib.Image image = imglib.decodeImage(input);

  int x = 0, y = 0;
  int width = (image.width / 3).round();
  int height = (image.height / 3).round();

  // split image to parts
  List<imglib.Image> parts = List<imglib.Image>();
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      parts.add(imglib.copyCrop(image, x, y, width, height));
      x += width;
    }
    x = 0;
    y += height;
  }

  // convert image from image package to Image Widget to display
  List<Image> output = List<Image>();
  for (var img in parts) {
    output.add(Image.memory(imglib.encodeJpg(img)));
  }

  return output;
}
