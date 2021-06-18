import 'package:get/get.dart';
import 'package:pildoras_getx_api/providers/strapi_provider.dart';

class StrapiController extends GetxController with StateMixin {
  static StrapiController get to => Get.find<StrapiController>();

  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  consultarProductos() async {
    try {
      change(null, status: RxStatus.loading());
      //await Future.delayed(Duration(seconds: 2));
      await 3.delay();
      final resultado = await StrapiProvider.to.consultarNombreProducto(1);
      change(resultado['producto']['nombre'], status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
