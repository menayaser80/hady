
import 'package:lava/constants/assets_manager.dart';
import 'package:lava/constants/global%20method.dart';
import 'package:lava/view/Admin/All%20cars.dart';
import 'package:lava/view/Admin/add%20accessories.dart';
import 'package:lava/view/Admin/add%20car.dart';
import 'package:lava/view/Admin/all%20accessories.dart';




class DashboardButtonsModel {
  final String text, imagePath;
  final Function onPressed;

  DashboardButtonsModel({
    required this.text,
    required this.imagePath,
    required this.onPressed,
  });

  static List<DashboardButtonsModel> dashboardBtnList(context) =>
      [
        DashboardButtonsModel(
          text: "Add a new Car",
          imagePath: AssetsManager.cloud,
          onPressed: () {
           navigateTo(context, EditOrUploadCarsScreen());
          },
        ),
        DashboardButtonsModel(
          text: "Add a new Accessories",
          imagePath: AssetsManager.cloud,
          onPressed: () {
            navigateTo(context, EditOrUploadAccesoriesScreen());
          },
        ),
        DashboardButtonsModel(
          text: "See all Cars",
          imagePath: AssetsManager.banner5,
          onPressed: () {
            navigateTo(context, AllCarsScreen());
          },
        ),
        DashboardButtonsModel(
          text: "See all Accessories",
          imagePath: AssetsManager.banner2,
          onPressed: () {
           navigateTo(context, AllAccessoriesScreen());
          },
        ),

      ];
}
