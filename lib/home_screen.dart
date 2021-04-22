import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trendyol_ui_clone/constants.dart';
import 'package:trendyol_ui_clone/widget/app_button.dart';
import 'package:trendyol_ui_clone/widget/bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
              ),
              Center(
                  child: Text(
                "Hesabım",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.7,
                    color: kBlackColor),
              )),
              Center(
                  child: Text(
                "Hesabınızı görüntüleyebilmek için lütfen giriş yapın.",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.4,
                    color: kBlackColor.withOpacity(0.7)),
              )),
              Center(
                  child: Text(
                "Siparişlerinizi ve Elite üyelik durumunuzu hesabımdan takip edebilirsiniz.",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.4,
                    color: kBlackColor.withOpacity(0.7)),
              )),
              SizedBox(
                height: 16,
              ),
              AppButton(
                type: ButtonType.PRIMARY,
                text: "Giriş Yap",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )),
    );
  }
}
