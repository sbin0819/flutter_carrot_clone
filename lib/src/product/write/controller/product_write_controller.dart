import 'package:bamtol_market_app/src/product/repository/product_repository.dart';
import 'package:bamtol_market_app/src/user/model/user_model.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class ProductWriteController extends GetxController {
  final UserModel owner;
  final ProductRepository _productRepository;
  RxList<AssetEntity> selectedImages = <AssetEntity>[].obs;
  ProductWriteController(this.owner, this._productRepository);

  changeSelectedImages(List<AssetEntity>? images) {
    selectedImages(images);
  }

  deleteImage(int index) {
    selectedImages.removeAt(index);
  }

  changeTitle(String value) {}
}
