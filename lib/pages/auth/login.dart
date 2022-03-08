import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:globalfancy/Home/bottom_bar_host.dart';
import 'package:globalfancy/auth/forgot_password.dart';
import 'package:globalfancy/auth/register.dart';
import 'package:globalfancy/common/common_textfield_with_title.dart';
import 'package:globalfancy/common/customLoader.dart';
import 'package:globalfancy/helper/colorExtension.dart';
import 'package:globalfancy/helper/extensions.dart';
import 'package:globalfancy/helper/images/images.dart';
import 'package:globalfancy/helper/locolizations.dart';
import 'package:globalfancy/helper/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late Helper helper;
  bool isInit = false;
  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    if (!isInit) {
      isInit = true;
      helper = Helper(context, showProgressDialog, updateState);
    }
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            statusBar(context),
            Expanded(
                child: ListView(
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.all(0),
              children: <Widget>[
                helper.buildBackground(),
                helper.buildLoginText(),
                helper.buildForm(),
                helper.forgotPassword(),
              ],
            )),
            helper.buildButton(),
            helper.dontHaveAnAccount(),
            bottomSafeArea(context),
          ],
        ),
        CustomLoader(
          loaderColor: colorLoader(context),
          showLoading: showLoading,
        ),
      ],
    ));
  }

  void updateState() {
    setState(() {});
  }

  void showProgressDialog(bool isShow) {
    if (mounted) {
      setState(() {
        showLoading = isShow;
      });
    }
  }
}

class Helper {
  late BuildContext context;
  late Function showProgressDialog, updateState;
  late SharedPreferences preferences;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneNumber = TextEditingController();

  Helper(this.context, this.showProgressDialog, this.updateState) {}

  Widget buildBackground() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.width / 8),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.width / 2,
      child: Image.asset(
        Images.authLogo,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget buildLoginText() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      child: Text(
        AppLocalizations.of(context)!.trans('login'),
        style: TextStyle(
            fontFamily: 'light', fontSize: 40, color: colorTextAuth(context)),
      ),
    );
  }

  Widget buildForm() {
    return Form(
      key: formKey,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextFieldWithTitle(
              '',
              AppLocalizations.of(context)!.trans("enter_email"),
              emailController,
              (val) {
                if (val!.isEmpty) {
                  return AppLocalizations.of(context)!.trans("required_field");
                } else if (!Utilities.isPhone(val)) {
                  return AppLocalizations.of(context)!
                      .trans("this_is_invalid_phone_number");
                }
              },
              inputType: TextInputType.text,
              isIntegerFormatter: false,
              enabled: true,
              onChanged: (val) {
                // phoneNumber.text = val;
                updateState();
              },
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: GestureDetector(
                  child: Container(
                    child: Image.asset(
                      Images.mailIcon,
                      color: colorTextAuth(context),
                    ),
                    height: 20,
                    width: 20,
                  ),
                  onTap: () {
                    updateState();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CommonTextFieldWithTitle(
              '',
              AppLocalizations.of(context)!.trans("enter_password"),
              passwordController,
                  (val) {
                if (val!.isEmpty) {
                  return AppLocalizations.of(context)!.trans("required_field");
                }
              },
              inputType: TextInputType.text,
              isIntegerFormatter: false,
              enabled: true,
              onChanged: (val) {
                // phoneNumber.text = val;
                updateState();
              },
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: GestureDetector(
                  child: Container(
                    child: Image.asset(
                      Images.lockIcon,
                      color: colorTextAuth(context),
                    ),
                    height: 20,
                    width: 20,
                  ),
                  onTap: () {
                    updateState();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget forgotPassword() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ForgotPassword()));
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                AppLocalizations.of(context)!.trans("forgot_password"),
                style: TextStyle(
                  color: colorTextAuth(context),
                  fontSize: 14.0,
                  fontFamily: 'regular',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildButton() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            Images.authButton,
            fit: BoxFit.contain,
          ),
        ),
        FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => BottomBarHost()),
                    (Route<dynamic> route) => false);
              }
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => BottomBarHost()),
                      (Route<dynamic> route) => false);
            },
            color: colorTransparent(context),
            child: Text(
              'login'.toUpperCase(),
              style: TextStyle(
                  fontSize: 20, fontFamily: 'bold', color: Colors.white),
            ))
      ],
    );
  }

  Widget dontHaveAnAccount() {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Register()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.trans("dont_have_an_account") +
                    " ",
                style: TextStyle(
                  color: colorTextAuth(context),
                  fontSize: 14.0,
                  fontFamily: 'regular',
                ),
              ),
              Text(
                AppLocalizations.of(context)!.trans("sign_up"),
                style: TextStyle(
                  color: colorTextAuth(context),
                  fontSize: 14.0,
                  fontFamily: 'bold',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
