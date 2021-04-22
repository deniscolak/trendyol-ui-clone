import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trendyol_ui_clone/animations/size_transitions.dart';
import 'package:trendyol_ui_clone/constants.dart';
import 'package:trendyol_ui_clone/home_screen.dart';
import 'package:trendyol_ui_clone/widget/app_button.dart';
import 'package:trendyol_ui_clone/widget/input_widget.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({
    Key key,
  }) : super(key: key);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin>
    with SingleTickerProviderStateMixin {
  var tweenLeft = Tween<Offset>(begin: Offset.zero, end: Offset(-1.1, 0))
      .chain(CurveTween(curve: Curves.ease));
  var tweenRight = Tween<Offset>(begin: Offset(1.1, 0), end: Offset(0, 0))
      .chain(CurveTween(curve: Curves.ease));

  AnimationController _animationController;

  var _isMoved = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
          ),

          Container(
            height: MediaQuery.of(context).size.height / 2.2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFfe5c4f), Color(0xFFf37520)],
              ),
            ),
          ),
          Positioned(
              right: 30,
              top: 60,
              child: GestureDetector(
                  child: Icon(
                    FlutterIcons.close_ant,
                    size: 24,
                    color: Colors.white.withOpacity(0.9),
                  ),
                  onTap: () =>
                      Navigator.push(context, SizeRoute(page: HomeScreen())))),
          // Logo Section
          Positioned(
            top: MediaQuery.of(context).size.height / 6,
            left: MediaQuery.of(context).size.width / 3.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  scale: 7,
                ),
              ],
            ),
          ),

          // Login Screen
          SlideTransition(
            position: _animationController.drive(tweenRight),
            child:
                Stack(fit: StackFit.loose, clipBehavior: Clip.none, children: [
              _registerScreen(context),
            ]),
          ),
          SlideTransition(
            position: _animationController.drive(tweenLeft),
            child:
                Stack(fit: StackFit.loose, clipBehavior: Clip.none, children: [
              _loginScreen(context),
            ]),
          ),
        ],
      ),
    );
  }

  Positioned _registerScreen(BuildContext context) {
    return Positioned(
      left: 0,
      top: MediaQuery.of(context).size.height / 3.3,
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: EdgeInsets.all(20.0),
            elevation: 0.7,
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Lets make a generic input widget
                    InputWidget(
                      // topLabel: "Email",

                      hintText: "E-Posta",
                      // prefixIcon: FlutterIcons.chevron_left_fea,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Wrap(
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            "—— veya ——",
                            style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: kGreyColor),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 0,
                    ),
                    Center(
                      child: Wrap(
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                          ),
                          ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: double.infinity, height: 44),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF000000),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FlutterIcons.apple1_ant,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text(
                                      'Apple ile Giriş Yap',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    AppButton(
                      type: ButtonType.PLAIN,
                      text: "Diğer Giriş Seçenekleri",
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Kampanyalardan haberdar olmak için Elektronik İleti almak istiyorum.',
                      style: GoogleFonts.openSans(
                        fontSize: 12.0,
                        color: Color.fromRGBO(64, 74, 106, 1),
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),

                    Center(
                      child: Wrap(
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            "Üye misin?",
                            style: GoogleFonts.openSans(
                              fontSize: 14.0,
                              color: Color.fromRGBO(64, 74, 106, 1),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (_isMoved) {
                                _animationController.reverse();
                              } else {
                                _animationController.forward();
                              }
                              _isMoved = !_isMoved;
                            },
                            child: Text(
                              "Giriş Yap",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                color: Constants.primaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          )),
    );
  }

  Positioned _loginScreen(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height / 3.3,
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                margin: EdgeInsets.all(20.0),
                elevation: 0.7,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 8, bottom: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        InputWidget(hintText: "E-posta"),
                        InputWidget(
                          hintText: "Şifre",
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Şifremi Unuttum",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        AppButton(
                          type: ButtonType.PRIMARY,
                          text: "Giriş Yap",
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Center(
                          child: Wrap(
                            runAlignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                "Diğer Giriş Seçenekleri",
                                style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: kGreyColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: 48),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF000000),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FlutterIcons.apple1_ant,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(
                                        'Apple ile Giriş Yap',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset("assets/images/google.png"),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset("assets/images/facebook.png"),
                            ),
                          ],
                        ),
                        Center(
                          child: Wrap(
                            runAlignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                "Üye değil misin?",
                                style: GoogleFonts.openSans(
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(64, 74, 106, 1),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (_isMoved) {
                                    _animationController.reverse();
                                  } else {
                                    _animationController.forward();
                                  }
                                  _isMoved = !_isMoved;
                                },
                                child: Text(
                                  "Üye Ol",
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0,
                                    color: Constants.primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            )));
  }
}
