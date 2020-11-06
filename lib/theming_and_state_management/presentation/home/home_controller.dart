import 'package:delivery_app/theming_and_state_management/domain/model/user.dart';
import 'package:delivery_app/theming_and_state_management/domain/repository/api_repository_interface.dart';
import 'package:delivery_app/theming_and_state_management/domain/repository/local_storage_repository_interface.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  HomeController({this.apiRepositoryInterface, this.localRepositoryInterface});

  User user = User.empty();
  RxInt currentIndex = 0.obs;
  RxBool darkTheme = false.obs;
  

  @override
  void onInit() {
    this.loadCurrentTheme();
    super.onInit();
  }

  @override
  void onReady() {
    this.loadUser();
    super.onReady();
  }

  void loadUser() async {
    final currentUser = await localRepositoryInterface.getUser();
    this.user = currentUser;
  }

  Future<void> logOut() async {
    final token = await localRepositoryInterface.getToken();
    await apiRepositoryInterface.logout(token);
    await localRepositoryInterface.clearAllData();
  }

  void loadCurrentTheme() {
    localRepositoryInterface.getDartMode().then((value) => darkTheme(value));
  }

  Future<void> updateTheme(bool darkMode) async {
    await localRepositoryInterface.saveDarkMode(darkMode);
    darkTheme(darkMode);
    return darkMode;
  }
}
