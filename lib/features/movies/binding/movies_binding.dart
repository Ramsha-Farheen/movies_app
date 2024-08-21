import 'package:get/get.dart';
import 'package:movies_app/features/movies/controller/movies_controller.dart';

class MoviesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoviesController());
  }
}
