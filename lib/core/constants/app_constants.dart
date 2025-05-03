import 'package:revive/core/utilies/assets/images/app_images.dart';
import 'package:revive/features/customer/categories/models/category_model.dart';
import 'package:revive/features/customer/category_details/models/category_products_model.dart';

class AppConstants {
  static List<CategoryModel> categoryProducts = [
    CategoryModel(
      name: 'Plastic',
      image: AppImages.plasticImage,
      price: 4,
      products: [
        CategoryProductsModel(image: AppImages.chairImage, name: 'Chair'),
        CategoryProductsModel(image: AppImages.toyImage, name: "Toy"),
        CategoryProductsModel(
            image: AppImages.cleanImage, name: 'Cleaning Tools'),
        CategoryProductsModel(image: AppImages.coolerImage, name: "Cooler "),
        CategoryProductsModel(
            image: AppImages.foodContainerImage, name: "Food Containers "),
        CategoryProductsModel(image: AppImages.otherImage, name: "Other"),
      ],
    ),
    CategoryModel(
      price: 3.5,
      name: 'E-Waste',
      image: AppImages.eWasteImage,
      products: [
        CategoryProductsModel(
            image: AppImages.remoteControlsImage, name: 'Remote Controls'),
        CategoryProductsModel(
            image: AppImages.televisionImage, name: 'Televisions'),
        CategoryProductsModel(
            image: AppImages.cablesImage, name: 'Chargers & Cables'),
        CategoryProductsModel(
            image: AppImages.mouseKeyboardImage, name: 'Keyboards & Mice'),
        CategoryProductsModel(
            image: AppImages.headphoneImage, name: 'Headphones'),
        CategoryProductsModel(image: AppImages.otherImage, name: 'Other'),
      ],
    ),
    CategoryModel(
      name: 'Glass',
      image: AppImages.glassImage,
      price: 9,
      products: [
        CategoryProductsModel(
            image: AppImages.bottleImage, name: 'Wine Bottles'),
        CategoryProductsModel(image: AppImages.jarImage, name: 'Jar'),
        CategoryProductsModel(
            image: AppImages.drinkingGlassImage, name: 'Drinking Glass'),
        CategoryProductsModel(
            image: AppImages.brokenImage, name: 'Broken Glass'),
        CategoryProductsModel(image: AppImages.plateImage, name: 'Plate Bowl'),
        CategoryProductsModel(image: AppImages.bowlImage, name: 'Plate & Bowl'),
        CategoryProductsModel(image: AppImages.otherImage, name: 'Other'),
      ],
    ),
    CategoryModel(
      price: 2.5,
      name: 'Metal',
      image: AppImages.metalImage,
      products: [
        CategoryProductsModel(
            image: AppImages.tinCanImage, name: 'Tin Can Lid'),
        CategoryProductsModel(image: AppImages.saucepanImage, name: 'Saucepan'),
        CategoryProductsModel(
            image: AppImages.foilImage, name: 'Aluminum Foil'),
        CategoryProductsModel(image: AppImages.wrenchImage, name: 'Wrench'),
        CategoryProductsModel(image: AppImages.screwImage, name: 'Screm'),
        CategoryProductsModel(image: AppImages.canImage, name: 'Can'),
        CategoryProductsModel(image: AppImages.otherImage, name: 'Other'),
      ],
    ),
    CategoryModel(
      name: 'Paper',
      image: AppImages.paperImage,
      price: 12,
      products: [
        CategoryProductsModel(image: AppImages.noteBookImage, name: 'Notebooks'),
        CategoryProductsModel(image: AppImages.takeoutContainerImage, name: 'Takeout Container'),
        CategoryProductsModel(image: AppImages.newsPaperImage, name: 'Newspaper'),
        CategoryProductsModel(image: AppImages.officePaperImage, name: 'Office Paper'),
        CategoryProductsModel(image: AppImages.bagImage, name: 'Paper Bag'),
        CategoryProductsModel(image: AppImages.otherImage, name: 'Other'),

      ],
    ),
    CategoryModel(
      price: 6,
      name: 'Cardboard',
      image: AppImages.cardboardImage,
      products: [
        CategoryProductsModel(
            image: AppImages.coffeeCupImage, name: 'Coffee Cup'),
        CategoryProductsModel(
            image: AppImages.sheetImage, name: 'Cardboard Sheet'),
        CategoryProductsModel(
            image: AppImages.tubeImage, name: 'Cardboard Tube'),
        CategoryProductsModel(image: AppImages.boxImage, name: 'Cardboard Box'),
        CategoryProductsModel(image: AppImages.otherImage, name: 'Other'),
      ],
    ),
  ];
}
