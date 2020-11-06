import 'package:delivery_app/theming_and_state_management/data/data_source/Local_repository_implement.dart';
import 'package:delivery_app/theming_and_state_management/data/data_source/api_repository_implement.dart';
import 'package:delivery_app/theming_and_state_management/domain/repository/api_repository_interface.dart';
import 'package:delivery_app/theming_and_state_management/domain/repository/local_storage_repository_interface.dart';
import 'package:get/instance_manager.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImplement());
    Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImplement());
  }
  
}