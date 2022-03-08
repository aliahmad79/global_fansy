import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:globalfancy/Home/bottom_bar_host.dart';
import 'package:globalfancy/auth/register.dart';
import 'package:globalfancy/common/common_textfield_with_title.dart';
import 'package:globalfancy/common/customLoader.dart';
import 'package:globalfancy/helper/colorExtension.dart';
import 'package:globalfancy/helper/extensions.dart';
import 'package:globalfancy/helper/images/images.dart';
import 'package:globalfancy/helper/locolizations.dart';
import 'package:globalfancy/helper/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
                        helper.buildActionBar(),
                        helper.buildTitleText(),
                        helper.buildForgotText(),
                        helper.buildForm(),
                        helper.buildButton(),
                      ],
                    )),

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

  Widget buildActionBar() {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 24,
              height: 24,
              child: backImage(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitleText() {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 40),
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          AppLocalizations.of(context)!.trans('reset_password'),
          style: TextStyle(
              fontFamily: 'light', fontSize: 40, color: colorTextAuth(context)),
        ),
      ),
    );
  }

  Widget buildForgotText() {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Text(
          AppLocalizations.of(context)!.trans('reset_password_text'),
          style: TextStyle(
            fontFamily: 'regular',
            fontSize: 15,
            color: colorTextAuth(context),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildForm() {
    return Form(
      key: formKey,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextFieldWithTitle(
              '',
              AppLocalizations.of(context)!.trans("new_password"),
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
            ),
            SizedBox(
              height: 15,
            ),
            CommonTextFieldWithTitle(
              '',
              AppLocalizations.of(context)!.trans("confirm_password"),
              emailController,
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
            )
          ],
        ),
      ),
    );
  }


  Widget buildButton() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width / 2,
          child: Image.asset(
            Images.smallAuthButton,
            fit: BoxFit.contain,
          ),
        ),
        FlatButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            onPressed: () {
              if (formKey.currentState!.validate()) {
//                Navigator.pushAndRemoveUntil(
//                    context,
//                    MaterialPageRoute(builder: (context) => BottomBarHost()),
//                        (Route<dynamic> route) => false);
              }

            },
            color: colorTransparent(context),
            child: Text(
              'done'.toUpperCase(),
              style: TextStyle(
                  fontSize: 20, fontFamily: 'bold', color: Colors.white),
            ))
      ],
    );
  }

}
