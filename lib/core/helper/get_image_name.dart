  import 'package:revive/core/utilies/assets/images/app_images.dart';

String getImageName({required String categoryName}) {
    var image;
    switch (categoryName) {
      case "Plastic":
        image = AppImages.plasticImage;
        break;
      case "Metal":
        image = AppImages.metalImage;
        break;
      case "Glass":
        image = AppImages.glassImage;
        break;
      case "Paper":
        image = AppImages.paperImage;
        break;
      case "Cardboard":
        image = AppImages.cardboardImage;
        break;
      case "E-Waste":
        image = AppImages.eWasteImage;
        break;
      default:
    }
    return image;
  }
