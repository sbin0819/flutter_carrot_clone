import 'package:bamtol_market_app/src/common/enum/authentication_status.dart';
import 'package:bamtol_market_app/src/user/model/user_model.dart';
import 'package:bamtol_market_app/src/user/repository/authentication_repository.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  AuthenticationController(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;
  Rx<AuthenticationStatus> status = AuthenticationStatus.init.obs;
  Rx<UserModel> userModel = const UserModel().obs;

  void authCheck() async {
    _authenticationRepository.user.listen((user) {
      _userStateChangedEvent(user);
    });
  }

  void _userStateChangedEvent(UserModel? user) async {
    if (user == null) {
      status(AuthenticationStatus.unknown);
    } else {}
  }

  void logout() async {
    await _authenticationRepository.logout();
  }
}
