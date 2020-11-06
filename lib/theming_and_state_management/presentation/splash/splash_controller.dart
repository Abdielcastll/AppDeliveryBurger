import 'package:delivery_app/theming_and_state_management/domain/model/user.dart';
import 'package:delivery_app/theming_and_state_management/domain/repository/api_repository_interface.dart';
import 'package:delivery_app/theming_and_state_management/domain/repository/local_storage_repository_interface.dart';
import 'package:delivery_app/theming_and_state_management/presentation/routes/delivery_navigation.dart';
import 'package:delivery_app/theming_and_state_management/presentation/theme.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

class SplashController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  SplashController(
      {this.localRepositoryInterface, this.apiRepositoryInterface});

  @override
  void onInit() {
    this.validateTheme();
    super.onInit();
  }
  
  @override
  void onReady() {
    this.validateSession();
    super.onReady();
  }

  void validateTheme() async {
    final isDark = await localRepositoryInterface.getDartMode();
    if (isDark != null) {
      Get.changeTheme(isDark? darkTheme :lightTheme);
    }else{
      Get.changeTheme(Get.isDarkMode? darkTheme :lightTheme);
    }
  }

  void validateSession() async {
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      final user = await apiRepositoryInterface.getUserFromToken(token);
      localRepositoryInterface.saveUser(user);
      Get.offNamed(DeliveryRoutes.home);
    } else {
      Get.offNamed(DeliveryRoutes.login);
    }
  }
}
