import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InitStartPage extends StatelessWidget {
  const InitStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 99,
              height: 116,
              child: Image.asset(
                'assets/images/logo_simbol.png',
              ),
            ),
            Text(
              '당신 근처의 밤톨마켓',
              style: GoogleFonts.notoSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              '중고 거래부터 동네 정보까지, \n지금 내 동네를 선택하고 시작해보세요!',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white.withValues(
                  alpha: 0.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
