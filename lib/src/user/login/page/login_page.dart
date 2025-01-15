import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Widget _loginView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 99,
          height: 116,
          child: Image.asset('assets/images/logo_simbol.png'),
        ),
        SizedBox(
          height: 40,
        ),
        AppFont(
          '당신 근처의 밤톨마켓',
          fontWeight: FontWeight.bold,
          size: 20,
        ),
        const SizedBox(height: 15),
        AppFont(
          '중고 거래부터 동네 정보까지, \n지금 내 동네를 선택하고 시작해보세요!',
          textAlign: TextAlign.center,
          size: 18,
          color: Colors.white.withValues(alpha: 0.6),
        ),
      ],
    );
  }

  Widget _textDivier() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
          child: AppFont(
            '회원 가입/로그인',
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _loginView(),
        _textDivier(),
      ],
    ));
  }
}
