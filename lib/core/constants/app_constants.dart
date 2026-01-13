import 'package:revive/core/utilies/assets/images/app_images.dart';
import 'package:revive/features/customer/categories/models/category_model.dart';
import 'package:revive/features/customer/category_details/models/category_products_model.dart';
import 'package:revive/generated/locale_keys.g.dart';

class AppConstants {
  static List<CategoryModel> categoryProducts = [
    CategoryModel(
      name: LocaleKeys.categoryProducts_Plastic_title,
      image: AppImages.plasticImage,
      price: 4,
      products: [
        CategoryProductsModel(
            image: AppImages.chairImage,
            name: LocaleKeys.categoryProducts_Plastic_Chair),
        CategoryProductsModel(
            image: AppImages.toyImage,
            name: LocaleKeys.categoryProducts_Plastic_Toy),
        CategoryProductsModel(
            image: AppImages.cleanImage,
            name: LocaleKeys.categoryProducts_Plastic_CleaningTools),
        CategoryProductsModel(
            image: AppImages.coolerImage,
            name: LocaleKeys.categoryProducts_Plastic_Cooler),
        CategoryProductsModel(
            image: AppImages.foodContainerImage,
            name: LocaleKeys.categoryProducts_Plastic_FoodContainers),
        CategoryProductsModel(
            image: AppImages.otherImage,
            name: LocaleKeys.categoryProducts_Plastic_Other),
      ],
    ),
    CategoryModel(
      price: 3.5,
      name: LocaleKeys.categoryProducts_EWaste_title,
      image: AppImages.eWasteImage,
      products: [
        CategoryProductsModel(
            image: AppImages.remoteControlsImage,
            name: LocaleKeys.categoryProducts_EWaste_RemoteControls),
        CategoryProductsModel(
            image: AppImages.televisionImage,
            name: LocaleKeys.categoryProducts_EWaste_Televisions),
        CategoryProductsModel(
            image: AppImages.cablesImage,
            name: LocaleKeys.categoryProducts_EWaste_ChargersCables),
        CategoryProductsModel(
            image: AppImages.mouseKeyboardImage,
            name: LocaleKeys.categoryProducts_EWaste_KeyboardsMice),
        CategoryProductsModel(
            image: AppImages.headphoneImage,
            name: LocaleKeys.categoryProducts_EWaste_Headphones),
        CategoryProductsModel(
            image: AppImages.otherImage,
            name: LocaleKeys.categoryProducts_EWaste_Other),
      ],
    ),
    CategoryModel(
      name: LocaleKeys.categoryProducts_Glass_title,
      image: AppImages.glassImage,
      price: 9,
      products: [
        CategoryProductsModel(
            image: AppImages.bottleImage,
            name: LocaleKeys.categoryProducts_Glass_WineBottles),
        CategoryProductsModel(
            image: AppImages.jarImage,
            name: LocaleKeys.categoryProducts_Glass_Jar),
        CategoryProductsModel(
            image: AppImages.drinkingGlassImage,
            name: LocaleKeys.categoryProducts_Glass_DrinkingGlass),
        CategoryProductsModel(
            image: AppImages.brokenImage,
            name: LocaleKeys.categoryProducts_Glass_BrokenGlass),
        CategoryProductsModel(
            image: AppImages.plateImage,
            name: LocaleKeys.categoryProducts_Glass_PlateBowl),
        CategoryProductsModel(
            image: AppImages.bowlImage,
            name: LocaleKeys.categoryProducts_Glass_PlateBowl),
        CategoryProductsModel(
            image: AppImages.otherImage,
            name: LocaleKeys.categoryProducts_Glass_Other),
      ],
    ),
    CategoryModel(
      price: 2.5,
      name: LocaleKeys.categoryProducts_Metal_title,
      image: AppImages.metalImage,
      products: [
        CategoryProductsModel(
            image: AppImages.tinCanImage,
            name: LocaleKeys.categoryProducts_Metal_TinCanLid),
        CategoryProductsModel(
            image: AppImages.saucepanImage,
            name: LocaleKeys.categoryProducts_Metal_Saucepan),
        CategoryProductsModel(
            image: AppImages.foilImage,
            name: LocaleKeys.categoryProducts_Metal_AluminumFoil),
        CategoryProductsModel(
            image: AppImages.wrenchImage,
            name: LocaleKeys.categoryProducts_Metal_Wrench),
        CategoryProductsModel(
            image: AppImages.screwImage,
            name: LocaleKeys.categoryProducts_Metal_Screm),
        CategoryProductsModel(
            image: AppImages.canImage,
            name: LocaleKeys.categoryProducts_Metal_Can),
        CategoryProductsModel(
            image: AppImages.otherImage,
            name: LocaleKeys.categoryProducts_Metal_Other),
      ],
    ),
    CategoryModel(
      name: LocaleKeys.categoryProducts_Paper_title,
      image: AppImages.paperImage,
      price: 12,
      products: [
        CategoryProductsModel(
            image: AppImages.noteBookImage,
            name: LocaleKeys.categoryProducts_Paper_Notebooks),
        CategoryProductsModel(
            image: AppImages.takeoutContainerImage,
            name: LocaleKeys.categoryProducts_Paper_TakeoutContainer),
        CategoryProductsModel(
            image: AppImages.newsPaperImage,
            name: LocaleKeys.categoryProducts_Paper_Newspaper),
        CategoryProductsModel(
            image: AppImages.officePaperImage,
            name: LocaleKeys.categoryProducts_Paper_OfficePaper),
        CategoryProductsModel(
            image: AppImages.bagImage,
            name: LocaleKeys.categoryProducts_Paper_PaperBag),
        CategoryProductsModel(
            image: AppImages.otherImage,
            name: LocaleKeys.categoryProducts_Paper_Other),
      ],
    ),
    CategoryModel(
      price: 6,
      name: LocaleKeys.categoryProducts_Cardboard_title,
      image: AppImages.cardboardImage,
      products: [
        CategoryProductsModel(
            image: AppImages.coffeeCupImage,
            name: LocaleKeys.categoryProducts_Cardboard_CoffeeCup),
        CategoryProductsModel(
            image: AppImages.sheetImage,
            name: LocaleKeys.categoryProducts_Cardboard_CardboardSheet),
        CategoryProductsModel(
            image: AppImages.tubeImage,
            name: LocaleKeys.categoryProducts_Cardboard_CardboardTube),
        CategoryProductsModel(
            image: AppImages.boxImage,
            name: LocaleKeys.categoryProducts_Cardboard_CardboardBox),
        CategoryProductsModel(
            image: AppImages.otherImage,
            name: LocaleKeys.categoryProducts_Cardboard_Other),
      ],
    ),
  ];
}
