abstract class AppImages {
  static String getImagePath(String imageNameWithExtension) {
    String path = "assets/images/$imageNameWithExtension";
    return path;
  }
}
