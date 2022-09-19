// ignore_for_file: deprecated_member_use, avoid_print, library_private_types_in_public_api
/*import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/utilities/constants.dart';
import 'package:untitled1/utilities/texto.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) =>  const LoginScreen(),
    );
  }
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

String msg = '';

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  final GlobalKey<FormState> _key = GlobalKey();

  RegExp emailRegExp = RegExp(r'^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$');
  RegExp contRegExp = RegExp(r'^([1-zA-Z0-1@.\s]{1,255})$');
  final myController1 = TextEditingController();
  final myController = TextEditingController();
  late String _correo;
  late String _contrasena;
  String mensaje = '';

  bool _rememberMe = false;

  String? _validateLogin(String? text){
    if(text!.isEmpty){
      return "Informe o login";
    }
    return null;
  }
  String? _validateSenha(String? text){
    if(text!.isEmpty){
      return "Informe a senha";
    }
    return null;
  }

  initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    //    Descomentar las siguientes lineas para generar un efecto de "respiracion"
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward();
  }

  dispose() {
    // Es importante SIEMPRE realizar el dispose del controller.
    controller.dispose();
    super.dispose();
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          Texto.email,
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: myController,
            validator: _validateLogin,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Texto.letras,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Texto.letras,
              ),
              hintText: Texto.email,
              hintStyle: kHintTextStyle,
            ),
          ),

        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          Texto.contra,
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: myController1,
            validator: _validateSenha,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            style: const TextStyle(
              color: Texto.letras,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Texto.letras,
              ),
              hintText: Texto.contra,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {},
        padding: const EdgeInsets.only(right: 0.0),
        child: const Text(
          Texto.olvide,
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return SizedBox(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Texto.letrasBtn,
              activeColor: Texto.letras,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          const Text(
            Texto.record,
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          {
            _onClickLogin(context);
          }
        },
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: const Text(
          Texto.btnIni,
          style: TextStyle(
            color: Color(0xFF33691E),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  _onClickLogin(BuildContext context) {

    if(_contrasena.isEmpty || _correo.isEmpty) {
      showDialog(context: context,
        builder: (context){
          return AlertDialog(
              title:Text("Error"),
              content: Text("Login e/ou Senha inválido(s)"),
              actions : <Widget>[
                FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                )
              ]
          );
        },
      );
    }
  }

  Widget _buildsecond(){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          {
            Navigator.pushNamed(context, '/second');
          }
        },
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: const Text(
          Texto.btnIni,
          style: TextStyle(
            color: Color(0xFF33691E),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Texto.fondo0,
                    Texto.fondo1,
                    Texto.fondo2,
                    Texto.fondo3,
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 120.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Image.asset(
                        'assets/logos/descarga.png',
                        alignment: Alignment.center,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const Text(
                      '''
${Texto.contract}\n${Texto.titulo}''',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Texto.letras,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    _buildEmailTF(),
                    _buildPasswordTF(),
                    _buildForgotPasswordBtn(),
                    _buildRememberMeCheckbox(),
                    _buildLoginBtn(),
                    _buildsecond(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}