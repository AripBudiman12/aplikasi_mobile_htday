import 'package:flutter/material.dart';
import 'package:ht_day/daftarbarang/daftar_barang.dart';
import 'package:ht_day/ui/registrasi_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _lihatPassword = false;

  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: new EdgeInsets.only(top: 30.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("png/bg.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      ('png/profil.png'),
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 8.0),
                  ),
                  _emailTextField(),
                  new Padding(
                    padding: new EdgeInsets.only(top: 15.0),
                  ),
                  _passwordTextField(),
                  new Padding(
                    padding: new EdgeInsets.only(top: 15.0),
                  ),
                  _buttonLogin(),
                  new Padding(
                    padding: new EdgeInsets.only(top: 15.0),
                  ),
                  _menuRegistrasi(),
                  new Padding(
                    padding: new EdgeInsets.only(bottom: 40.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //MembuatTextbox Email
  Widget _emailTextField() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          labelText: "Email",
          labelStyle: new TextStyle(color: Colors.blue),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: new BorderSide(
                color: Colors.white,
              )),
          suffixIcon: Icon(
            Icons.mail,
            size: 25,
          )),
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextboxController,
      validator: (value) {
        //validasi harus diisi
        if (value.isEmpty) {
          return 'Email harus diisi';
        }
        return null;
      },
    );
  }

  //Membuat Textbox Password
  Widget _passwordTextField() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      obscureText: !_lihatPassword,
      decoration: InputDecoration(
          labelText: "Password",
          labelStyle: new TextStyle(color: Colors.blue),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: new BorderSide(
                color: Colors.white,
              )),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _lihatPassword = !_lihatPassword;
              });
            },
            child: Icon(
              _lihatPassword ? Icons.visibility : Icons.visibility_off,
            ),
          )),
      keyboardType: TextInputType.text,
      controller: _passwordTextboxController,
      validator: (value) {
        //validasi harus diisi
        if (value.isEmpty) {
          return "Password harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat tombol Login
  Widget _buttonLogin() {
    return RaisedButton(
        child: Text("login"),
        onPressed: () {
          var validate = _formKey.currentState.validate();
          if (validate = _formKey.currentState.validate()) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DaftarBarang()));
          }
          return "email&password salah";
        });
  }

  //Membuat menu untuk halaman registrasi
  Widget _menuRegistrasi() {
    return Container(
      child: Center(
        child: InkWell(
            child: Text(
              "Registrasi",
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => RegistrasiPage()));
            }),
      ),
    );
  }
}
